#include "CreateIDBitcode.hpp"
#include "Variables.hpp"
#include "Transformer.hpp"
#include "Change.hpp"
#include "StrChange.hpp"
#include "FuncStrChange.hpp"
#include "FunctionChange.hpp"
#include "CreateIDBitcode.hpp"
#include "config_parser.hpp"
#include <string>
#include <string.h>
#include <iostream>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <map>
#include <utility>
#include <llvm/IR/DebugInfo.h>
#include <llvm/IR/DIBuilder.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include "llvm/IR/IRBuilder.h"
#include <llvm/IR/ValueSymbolTable.h>
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Verifier.h>

#include <iostream>
#include <fstream>

/**
 * Get corvette.inst.id meta data.
 *
 * Every instruction has a corvette.inst.id metadata added
 * by the CreateIDBitcode pass. This metadata associates
 * each instruction accrossing the entire program with 
 * a unique id.
 */
cl::opt<string> FileName("filename", cl::value_desc("filename"), cl::desc("The file name"), cl::init("file.json"));
cl::opt<string> ExcludedFunctionsFileName("exclude", cl::value_desc("filename"), cl::desc("List of functions to exclude (if in dependencies)"), cl::init("exclude.txt"));
cl::opt<string> IncludedFunctionsFileName("include", cl::value_desc("filename"), cl::desc("List of functions to include (dependencies)"), cl::init("include.txt"));
cl::opt<string> IncludedGlobalVarsFileName("include_global_vars", cl::value_desc("filename"), cl::desc("List of global variables to include"), cl::init("include_global.txt"));
cl::opt<string> ExcludedLocalVarsFileName("exclude_local_vars", cl::value_desc("filename"), cl::desc("List of local variables to exclude"), cl::init("exclude_local.txt"));
cl::opt<bool> PythonFormat("pformat", cl::value_desc("flag"), cl::desc("Use python format"), cl::init(false));
cl::opt<bool> ListOperators("ops", cl::value_desc("flag"), cl::desc("Print operators"), cl::init(false));
cl::opt<bool> ListFunctions("funs", cl::value_desc("flag"), cl::desc("Print functions"), cl::init(false));
cl::opt<bool> OnlyScalars("only-scalars", cl::value_desc("flag"), cl::desc("Print only scalars"), cl::init(false));               
cl::opt<bool> OnlyArrays("only-arrays", cl::value_desc("flag"), cl::desc("Print only arrays"), cl::init(false));

static void printType(Type *type, char* strType) {
  unsigned int typeID = type->getTypeID();
  
  switch(typeID) {
  case Type::FloatTyID: 
    strcpy(strType, "float");
    break;

  case Type::DoubleTyID: 
    strcpy(strType, "double");
    break;

  case Type::X86_FP80TyID: // long double
    strcpy(strType, "longdouble");
    break;

  case Type::PPC_FP128TyID:
    strcpy(strType, "WARNING: PPC_FP128");
    break;

  case Type::IntegerTyID:
    strcpy(strType, "int");
    break;  

  case Type::PointerTyID: {
    PointerType *pointer = dyn_cast<PointerType>(type);
    Type *elementType = pointer->getElementType();
    printType(elementType, strType);
    strcat(strType, "*");
    break;
  }
case Type::StructTyID:
    strcpy(strType, "struct");
    break;

  case Type::ArrayTyID: {    
    vector<unsigned> dimensions;
    while(ArrayType* arrayType = dyn_cast<ArrayType>(type)) {
      type = arrayType->getElementType();
      dimensions.push_back(arrayType->getNumElements());
    }
    
    if (type->isFloatingPointTy()) {
      unsigned int typeID = type->getTypeID();
      
      switch(typeID) {
      case Type::FloatTyID:       
        strcpy(strType, "float");
        //printDimensions(dimensions, outfile);
        break;
  
      case Type::DoubleTyID: 
        strcpy(strType, "double");
//        printDimensions(dimensions, outfile);
        break;
    
      case Type::X86_FP80TyID:
        strcpy(strType, "longdouble");
        //printDimensions(dimensions, outfile);
        break;
  
      default:
        break;
      }    
 } 
    else {
      //strcpy(strType, *type); //TODO: check later
      //outfile <<  *type;
  //    printDimensions(dimensions, outfile);
    }
    break;
  } 
    
  default:
    errs() << "WARNING: Variable of type " << *type << "\n";
    break;
    
  }
  return ;
}


static Type* findLocalType(Value *value) {
  Type *type = NULL;
  if (AllocaInst* alloca = dyn_cast<AllocaInst>(value)) {
    type = alloca->getAllocatedType();
  }
  else if (Argument* arg = dyn_cast<Argument>(value)) {
    type = arg->getType();
  }
  return type;
}
static bool isFPArray(Type *type) {
  if (ArrayType *array = dyn_cast<ArrayType>(type)) {
    type = array->getElementType();
    if (type->isFloatingPointTy()) {
      return true;
    }
    else {
      return isFPArray(type);
    }
  }
  else if (PointerType *pointer = dyn_cast<PointerType>(type)) {
    type = pointer->getElementType();
    if (type->isFloatingPointTy()) {
      return true;
    }
    else {
      return isFPArray(type);
    }
  }
  return false;
}
static string getID(Instruction &inst) {
  string id = "";
  if (MDNode *node = inst.getMetadata("corvette.inst.id")) {
    if(node){
      MDString *mdstring = cast<MDString>(node->getOperand(0));
      id = mdstring->getString();
    }
  }                                                                                                                               
  else {
    //errs() << "WARNING: Did not find metadata\n";
  }
  return id;
}

/**
 * Declaring json-config as an option to pass configuration 
 * input file to this pass.
 */
cl::opt<string> JsonConfigFileName("json-config", cl::value_desc("filename"), cl::desc("Configuration input file"), cl::init("config.json"));

/*
 * Get the map of type changes. 
 *
 * This maps each of the four objects - globalVar,
 * localVar, op and call - to the set of changes.
 */


cl::opt<string> OutputFileName("output", cl::value_desc("filename"), cl::desc("File name for transformed bitcode (used in regression tests)"));

static LLVMContext & getLLVMGlobalContext() {                                                                                           
  static LLVMContext MyGlobalContext;
  return MyGlobalContext;
}

ConstantInt* Variables::getInt32(int n) {
  static llvm::LLVMContext& global = getLLVMGlobalContext();
  return llvm::ConstantInt::get(llvm::Type::getInt32Ty(global), n);
}


ConstantInt* Variables::getInt64(int n) {
  static llvm::LLVMContext& global = getLLVMGlobalContext();
  return llvm::ConstantInt::get(llvm::Type::getInt64Ty(global), n);
}

static bool diffTypes(Type *type1, Type *type2) {

#ifdef DEBUG
  errs() << "COMPARING " << type1 << " AND " << type2;
#endif
  
   unsigned int typeID1 = type1->getTypeID();
   unsigned int typeID2 = type2->getTypeID();

   if (typeID1 != typeID2) {
     return true;
   }
   else {

     // Case: pointer to FP (arrays passed as parameter)
     if (PointerType *ptype1 = dyn_cast<PointerType>(type1)) {
       if (PointerType *ptype2 = dyn_cast<PointerType>(type2)) {

         Type *elementType1 = ptype1->getElementType();
         Type *elementType2 = ptype2->getElementType();

         if (elementType1->isFloatingPointTy() && elementType2->isFloatingPointTy()) {
           if (elementType1->getTypeID() != elementType2->getTypeID()) {
             return true;
           }
         }
	 else if (PointerType *ep1 = dyn_cast<PointerType>(elementType1)) {
	   if (PointerType *ep2 = dyn_cast<PointerType>(elementType2)) {
	     return diffTypes(ep1, ep2);
	   }
	 }
       }
     }

     // Case: Arrays FP
     if (ArrayType *ptype1 = dyn_cast<ArrayType>(type1)) {
       if (ArrayType *ptype2 = dyn_cast<ArrayType>(type2)) {

         Type *elementType1 = ptype1->getElementType();
         Type *elementType2 = ptype2->getElementType();

         if (elementType1->isFloatingPointTy() && elementType2->isFloatingPointTy()) {
           if (elementType1->getTypeID() != elementType2->getTypeID()) {
             return true;
           }
         }
         else if (ArrayType *ep1 = dyn_cast<ArrayType>(elementType1)) {
           if (ArrayType *ep2 = dyn_cast<ArrayType>(elementType2)) {
             return diffTypes(ep1, ep2);
           }
         }
       }
     }

   }
   return false;
}

bool Variables::doInitialization(Module &M) {

  debugInfo.processModule(M);
//  types = createConfig.getChanges();

  Changes globalVarVec;
  changes[GLOBALVAR] = globalVarVec;

  Changes localVarVec;
  changes[LOCALVAR] = localVarVec;

  Changes opVec;
  changes[OP] = opVec;

  Changes callVec;
  changes[CALL] = callVec;  

  return true;
}


unsigned Variables::getAlignment(Type* type) {
  unsigned alignment;    
  switch(type->getTypeID()) {
  case Type::FloatTyID:
    alignment = 4;
    break;
  case Type::DoubleTyID:
    alignment = 8;
    break;
  case Type::X86_FP80TyID:
    alignment = 16;
    break;
  default:
    alignment = 0;
  }
  return alignment;
}


void Variables::changeGlobal(Change* change, Module &M) {

  GlobalValue* oldTarget = dyn_cast<GlobalValue>(change->getValue());
  Type* oldType = oldTarget->getType()->getElementType();
  Type* newType = change->getType()[0];
  errs() << "Changing the precision of variable \"" << oldTarget->getName() << "\" from " << *oldType << " to " << *newType << ".\n";

  if (diffTypes(oldType, newType)) {      
    Constant *initializer;
    GlobalVariable* newTarget;

    if (PointerType *newPointerType = dyn_cast<PointerType>(newType)) {
      initializer = ConstantPointerNull::get(newPointerType);
      newTarget = new GlobalVariable(M, newType, false, GlobalValue::CommonLinkage, initializer, "");
    }
    else if (ArrayType * atype = dyn_cast<ArrayType>(newType)) {

      // preparing initializer
      Type *temp = Type::getFloatTy(M.getContext());
      vector<Constant*> operands;
      operands.push_back(ConstantFP::get(temp, 0));
      ArrayRef<Constant*> *arrayRef = new ArrayRef<Constant*>(operands);
      initializer = ConstantArray::get(atype, *arrayRef);

      newTarget = new GlobalVariable(M, newType, false, GlobalValue::CommonLinkage, initializer, "");
    }
    else {
      initializer = ConstantFP::get(newType, 0);
      newTarget = new GlobalVariable(M, newType, false, GlobalValue::CommonLinkage, initializer, "");
    }

    /*
    GlobalVariable* newTarget = new GlobalVariable(M, newType, false, GlobalValue::CommonLinkage, initializer, "");
    */

    unsigned alignment = getAlignment(newType);
    newTarget->setAlignment(alignment);

    newTarget->takeName(oldTarget);
    
    // iterating through instructions using old AllocaInst
    Value::use_iterator it = oldTarget->use_begin();
    for(; it != oldTarget->use_end(); it++) {
      //Transformer::transform(it, newTarget, oldTarget, newType, oldType, alignment);
      
    }	  
    //oldTarget->eraseFromParent();
  }
  else {
    errs() << "No changes required.\n";
  }
  return;
}


static bool diffStructTypes(StructType *type1, StructType *type2) {
  int num = type1->getNumElements();

  // assum same number of elements
  for(int i = 0; i < num; i++) {
    if (diffTypes(type1->getElementType(i), type2->getElementType(i))) {
      return true;
    }
  }
  return false;
}


AllocaInst* Variables::changeLocal(Value* value, Type* newType, Module &M) {
  AllocaInst* newTarget = NULL;
  vector<Instruction*> erase;

  if (AllocaInst *oldTarget = dyn_cast<AllocaInst>(value)) {
    Type* oldType = oldTarget->getType()->getElementType(); 
    unsigned alignment = getAlignment(newType);
    newTarget = new AllocaInst(newType, 0, "new", oldTarget);
    newTarget->setAlignment(8);
    //newTarget->takeName(oldTarget);
    //get shadow value for this alloca inst, although we don't need to do this for alloca  
    bool is_erased = false;
    for (Use &U : oldTarget->uses()) {
      User *UR = U.getUser();
      instrument(UR, M);
      is_erased = Transformer::transform(UR, newTarget, oldTarget, newType, oldType, alignment);
    }
  }
  else if (Argument *argument = dyn_cast<Argument>(value)){
    errs() << "WARNING: Function argument instead of Alloca for: " << argument->getName() << ".\n";
  }

  return newTarget;
}

#if 1
void Variables::instrument(User *UR, Module &M) {
  errs()<<"instrument\n";
  Instruction  *I = dyn_cast<Instruction>(UR);
  IRBuilder<> IRB(I);

  Type* void_ptr_ty1 = PointerType::getUnqual(Type::getInt8Ty(M.getContext()));
  Type* void_ptr_ty2 = PointerType::getUnqual(Type::getInt8Ty(M.getContext()));

  bool IsWrite = isa<StoreInst>(*I);
  bool IsRead = isa<LoadInst>(*I);
  if(IsWrite || IsRead){
  Value *Addr = IsWrite
      ? cast<StoreInst>(I)->getPointerOperand()
      : cast<LoadInst>(I)->getPointerOperand();
  if(Addr){
    BitCastInst* bitcast = new BitCastInst(Addr,PointerType::getUnqual(Type::getInt8Ty(M.getContext())),"", I);

    Function *callfunc = dyn_cast<Function>(M.getOrInsertFunction("getShadow", void_ptr_ty1, void_ptr_ty2));
    callfunc->setCallingConv(CallingConv::C);
  
    IRB.CreateCall(callfunc, bitcast);
  }
  }
//  CallInst *CI = IRB.CreateCall(callfunc, {A0,A1});

}
#endif
AllocaInst* Variables::changeLocal(Change* change, Module &M) {

  Type* newType = change->getType()[0];
  if (ArrayType* arrayType = dyn_cast<ArrayType>(newType)) {
    errs() <<"test2\n"; 
//    return changeLocal(change->getValue(), arrayType, M);
  } else if (PointerType* pointerType = dyn_cast<PointerType>(newType)) {
    errs() <<"test3\n"; 
//    return changeLocal(change->getValue(), pointerType, M); //Crashing here
  } else if (StructType* structType = dyn_cast<StructType>(newType)) {
    errs() <<"test4\n"; 
 //   return changeLocal(change->getValue(), structType/*, change->getField()*/, M);
  } else {
    errs() <<"test5\n"; 
    return changeLocal(change->getValue(), newType, M);
  }
}


AllocaInst* Variables::changeLocal(Value* value, PointerType* newType, Module &M) {
  AllocaInst *oldTarget = dyn_cast<AllocaInst>(value);
  PointerType* oldPointerType = dyn_cast<PointerType>(oldTarget->getType());
  PointerType *oldType = dyn_cast<PointerType>(oldPointerType->getElementType());
  AllocaInst *newTarget = NULL;
  errs() << "Changing the precision of pointer variable \"" << oldTarget->getName() << "\" from " << *oldType 
	 << " to " << *newType << ".\n";

//  if (diffTypes(newType, oldType)) {
    //newTarget = new AllocaInst(newType, getInt32(1), "", oldTarget);

    // we are not calling getAlignment because in this case double requires 16. Investigate further.
    unsigned alignment;
    switch(newType->getElementType()->getTypeID()) {
      case Type::FloatTyID: 
        alignment = 4;
        break;
      case Type::DoubleTyID:
        alignment = 8;
        break;
      case Type::X86_FP80TyID:
        alignment = 16;
      break;
    default:
      alignment = 0;
    } 
    
    //newTarget->setAlignment(alignment); // depends on type? 8 for float? 16 for double?
    //newTarget->takeName(oldTarget);

    // iterating through instructions using old AllocaInst
    vector<Instruction*> erase;
    Value::use_iterator it = oldTarget->use_begin();

#ifdef DEBUG
    errs() << "\nOld target: ";
    oldTarget->dump();
#endif
     bool is_erased = false;
    for(; it != oldTarget->use_end(); it++) {
#ifdef DEBUG
      errs() << "\nA use: ";
      //it->dump();

      errs() << "\n===============================\n";
      errs() << "\nTransforming use\n";
#endif

//      bool is_erased = Transformer::transform(it, newTarget, oldTarget, newType, oldType, alignment);
      if (LoadInst *inst = dyn_cast<LoadInst>(*it)) {
      //    is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(StoreInst *inst = dyn_cast<StoreInst>(*it)) {
       //   is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(BitCastInst *inst = dyn_cast<BitCastInst>(*it)) {
       //   is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(GetElementPtrInst *inst = dyn_cast<GetElementPtrInst>(*it)) {
       //   is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(CallInst *inst = dyn_cast<CallInst>(*it)) {
       //   is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      }

      if (!is_erased) {
        erase.push_back(dyn_cast<Instruction>(*it));
      }

#ifdef DEBUG
      errs() << "\nDone transforming use\n";
#endif
    }
    
    // erasing uses of old instructions
    for(unsigned int i = 0; i < erase.size(); i++) {
      erase[i]->eraseFromParent();
    }
    // erase old instruction
    //oldTarget->eraseFromParent();

#ifdef DEBUG
    errs() << "DONE ALL TRANSFORMATION FOR POINTER\n";
#endif

 // } else {
    errs() << "\tNo changes required.\n";
 // }

  return newTarget;
}


AllocaInst* Variables::changeLocal(Value* value, ArrayType* newType, Module &M) {

  AllocaInst* oldTarget = dyn_cast<AllocaInst>(value);
  PointerType* oldPointerType = dyn_cast<PointerType>(oldTarget->getType());
  ArrayType* oldType = dyn_cast<ArrayType>(oldPointerType->getElementType());
  AllocaInst* newTarget = NULL;

  errs() << "Changing the precision of variable \"" << oldTarget->getName() << "\" from " << *oldType 
	 << " to " << *newType << ".\n";

  if (newType->getElementType()->getTypeID() != oldType->getElementType()->getTypeID()) {

  //  newTarget = new AllocaInst(newType, getInt32(1), "", oldTarget);
    
    // we are not calling getAlignment because in this case double requires 16. Investigate further.
    unsigned alignment;
    switch(newType->getElementType()->getTypeID()) {
    case Type::FloatTyID: 
      alignment = 4;
      break;
    case Type::DoubleTyID:
      alignment = 16;
      break;
    case Type::X86_FP80TyID:
      alignment = 16;
      break;
    default:
      alignment = 0;
    } 
    
  //  newTarget->setAlignment(alignment); // depends on type? 8 for float? 16 for double?
  //  newTarget->takeName(oldTarget);
    
    // iterating through instructions using old AllocaInst
    vector<Instruction*> erase;
    bool is_erased = false;
    Value::use_iterator it = oldTarget->use_begin() ;
    for(; it != oldTarget->use_end(); it++) {
      //bool is_erased = Transformer::transform(it, newTarget, oldTarget, newType, oldType, alignment);
      if (LoadInst *inst = dyn_cast<LoadInst>(*it)) {
    //      is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(StoreInst *inst = dyn_cast<StoreInst>(*it)) {
   //       is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(BitCastInst *inst = dyn_cast<BitCastInst>(*it)) {
    //      is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(GetElementPtrInst *inst = dyn_cast<GetElementPtrInst>(*it)) {
    //      is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(CallInst *inst = dyn_cast<CallInst>(*it)) {
    //      is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      }

      if (!is_erased)
        erase.push_back(dyn_cast<Instruction>(*it));
    }	  
    
    // erasing uses of old instructions
    for(unsigned int i = 0; i < erase.size(); i++) {
      erase[i]->eraseFromParent();
    }
    // erase old instruction
    //oldTarget->eraseFromParent();
  }
  else {
    errs() << "\tNo changes required.\n";    
  }

  return newTarget;
}


AllocaInst* Variables::changeLocal(Value* value, StructType* newType/*, int field*/, Module &M) {

  errs() << "At changeLocalStruct\n";
  AllocaInst* newTarget = NULL;
  vector<Instruction*> erase;

  if (AllocaInst *oldTarget = dyn_cast<AllocaInst>(value)) {
    if (PointerType *oldPointer = dyn_cast<PointerType>(oldTarget->getType())) {
      if (StructType *oldType = dyn_cast<StructType>(oldPointer->getElementType())) {
	
	errs() << "Changing the precision of variable \"" << oldTarget->getName() << "\" from " << *oldType 
	       << " to " << *newType << ".\n";
      
	if (diffStructTypes(oldType, newType)) {
	  unsigned alignment = oldTarget->getAlignment();
	  
//	  newTarget = new AllocaInst(newType, 0, alignment, "new", oldTarget);
//	  newTarget->takeName(oldTarget);
	
	  // iterating through instructions using old getelementptr instructions
	  Value::use_iterator it = oldTarget->use_begin();
     bool is_erased = false;
	  for(; it != oldTarget->use_end(); it++) {
	    
	    if (GetElementPtrInst *getElementPtrInst = dyn_cast<GetElementPtrInst>(*it)) {
	      if (ConstantInt *constantIntIndex = dyn_cast<ConstantInt>(getElementPtrInst->getOperand(2))) {
		unsigned int index = constantIntIndex->getLimitedValue(); // the index of the field accessed by this use
		
		Type *newFieldType = newType->getElementType(index);
		Type *oldFieldType = oldType->getElementType(index);
		unsigned alignment = getAlignment(newFieldType); // 4 hard coded for now
//		bool is_erased = Transformer::transform(it, newTarget, oldTarget, newFieldType, oldFieldType, alignment);
	   
    if (LoadInst *inst = dyn_cast<LoadInst>(*it)) {
  //        is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(StoreInst *inst = dyn_cast<StoreInst>(*it)) {
  //        is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(BitCastInst *inst = dyn_cast<BitCastInst>(*it)) {
   //       is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(GetElementPtrInst *inst = dyn_cast<GetElementPtrInst>(*it)) {
   //       is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(CallInst *inst = dyn_cast<CallInst>(*it)) {
   //       is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);                           
      }
	
		if (!is_erased) {
		  erase.push_back(dyn_cast<Instruction>(*it));
		}  
	      }
	    }
	    else {
	      errs() << "WARNING: unexpected use of struct\n";
	    }
	  }
	  
	  // erasing uses of old instructions
	  for(unsigned int i = 0; i < erase.size(); i++) {
	    erase[i]->eraseFromParent();
	  }
	  
	}
	else {
	  errs() << "\tNo changes required.\n";
	}
      } 
    }
  }
  return newTarget;
}


ConstantInt* Variables::getSizeInBits(Type *type) {
  ConstantInt *size = NULL;
  ArrayType *arrayType = dyn_cast<ArrayType>(type);
  switch (arrayType->getElementType()->getTypeID()) {
  case Type::FloatTyID: {
    int isize = arrayType->getNumElements() * 32;
    size = getInt64(isize);
    break;
  }
  case Type::DoubleTyID: {
    int isize = arrayType->getNumElements() * 64;
    size = getInt64(isize);
    break;
  }
  default:
    errs() << "WARNING: Unhandled type @ getSizeInBits\n";
    exit(1);
  }
  return size;
}


ConstantInt* Variables::getAlignmentInBits(Type *type) {
  ConstantInt *alignment = NULL;
  ArrayType *arrayType = dyn_cast<ArrayType>(type);
  switch (arrayType->getElementType()->getTypeID()) {
  case Type::FloatTyID:
    alignment = getInt64(32);
    break;
  case Type::DoubleTyID:
    alignment = getInt64(64);
    break;
  default:
    errs() << "WARNING: Unhandled type @ getAlignmentInBits\n";
    exit(1);
  }
  return alignment;
}

#if 0
MDNode* Variables::getTypeMetadata(Module &M, const DIVariable *oldDIVar, Type *newType) {

  // constructing new type descriptor
  const DIType *oldDIType = dyn_cast<DIType>(oldDIVar->getType());  
  std::vector<Value*> operands;

  switch(newType->getTypeID()) {
  case Type::FloatTyID:
    operands.push_back(getInt32(524324));
    operands.push_back(dyn_cast<Value*>(oldDIType->getOperand(1))); // preserve old context
    operands.push_back(dyn_cast<Value>(MDString::get(M.getContext(), "float")));
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(3))); // preserve old file descriptor
    operands.push_back(getInt32(0));
    operands.push_back(getInt64(32));
    operands.push_back(getInt64(32));
    operands.push_back(getInt64(0));
    operands.push_back(getInt32(0));
    operands.push_back(getInt32(4));
    break;
  case Type::DoubleTyID:   
    operands.push_back(getInt32(524324));
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(1))); // preserve old context
    operands.push_back(dyn_cast<Value>(MDString::get(M.getContext(), "double")));
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(3))); // preserve old file descriptor
    operands.push_back(getInt32(0));
    operands.push_back(getInt64(64));
    operands.push_back(getInt64(64));
    operands.push_back(getInt64(0));
    operands.push_back(getInt32(0));
    operands.push_back(getInt32(4));
    break;
  case Type::ArrayTyID: {
    Type *elementType = (dyn_cast<ArrayType>(newType))->getElementType();
    operands.push_back(getInt32(720897));
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(1))); // preserve old context
    operands.push_back(dyn_cast<Value>(MDString::get(M.getContext(), "")));
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(3))); // preserve old file descriptor
    operands.push_back(getInt32(0));
    operands.push_back(getSizeInBits(newType)); // size in bits = size * array elements
    operands.push_back(getAlignmentInBits(newType)); // alignment in bits
    operands.push_back(getInt32(0));
    operands.push_back(getInt32(0));
    operands.push_back(dyn_cast<Value>(getTypeMetadata(M, oldDIVar, elementType))); // element basic type
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(10))); // subrange should be the same
    operands.push_back(getInt32(0));
    operands.push_back(getInt32(0));
    break; 
  }
  case Type::PointerTyID: { // added on 07/26
    Type *elementType = (dyn_cast<PointerType>(newType))->getElementType();
    operands.push_back(getInt32(786447));
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(1))); // preserve old file descriptor
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(2))); // preserve old context
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(3))); // preserve old name
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(4))); // preserve old line number
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(5))); // preserve old size in bits
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(6))); // preserve old align in bits
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(7))); // preserve old offset in bits
    operands.push_back(dyn_cast<Value>(oldDIType->getOperand(8))); // preserve old flags
    operands.push_back(dyn_cast<Value>(getTypeMetadata(M, oldDIVar, elementType))); // element basic type
    break; 
  }
  default:
    errs() << "WARNING: getTypeMetadata.\n";
    newType->dump();
    errs() << "\n";
    exit(1);
  }
  
  ArrayRef<Value*> *arrayRefOperands = new ArrayRef<Value*>(operands);
  //return MDNode::get(M.getContext(), *arrayRefOperands); /TODO check later
  return MDNode::get(M.getContext(), None);
}


void Variables::updateMetadata(Module& M, Value* oldTarget, Value* newTarget, Type* newType) {

  vector<Instruction*> to_remove;
  if (newTarget) {
    errs() << "\tChanging metadata for: " << newTarget->getName() << "\n";
    bool changed = false;

    for(Module::iterator f = M.begin(), fe = M.end(); f != fe; f++) {
      for(Function::iterator b = f->begin(), be = f->end(); b != be; b++) {
	for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {
	  
	  if (DbgDeclareInst *oldDeclare = dyn_cast<DbgDeclareInst>(i)) {
	    if (Value *address = oldDeclare->getAddress()) {
	      if (AllocaInst *allocaInst = dyn_cast<AllocaInst>(address)) {
		if (allocaInst == oldTarget) { // the alloca we are looking for

		  const DIVariable *oldDIVar = dyn_cast<DIVariable>(oldDeclare->getVariable());
		  MDNode* newDIType = getTypeMetadata(M, oldDIVar, newType);
		  
		  // construct new DIVariable with new type descriptor
		  vector<Value*> doperands;
		  for(unsigned i = 0; i < oldDIVar->getNumOperands(); i++) {
		    if (i == 5) { // the argument that corresponds to the type descriptor
		      doperands.push_back(dyn_cast<Value>(newDIType));
		    }
		    else {
		      doperands.push_back(dyn_cast<Value>(oldDIVar->getOperand(i))); // preserve other descriptors
		    }
		  }
		  ArrayRef<Value*> *arrayRefDOperands = new ArrayRef<Value*>(doperands);
		  //MDNode* newMDNode = MDNode::get(M.getContext(), *arrayRefDOperands);//TODO
		  MDNode* newMDNode = MDNode::get(M.getContext(), None);
		  DIVariable *newDIVar = dyn_cast<DIVariable>(newMDNode);
		  
		  // insert new declare instruction
		  DIBuilder* builder = new DIBuilder(M);
		  //Instruction *newDeclare = builder->insertDeclare(newTarget, newDIVar, oldDeclare); //TODO
		  
		  // make sure the declare instruction preserves its own metadata
		  unsigned id = 0;
		  if (oldDeclare->getMetadata(id)) {
//		    newDeclare->setMetadata(id, oldDeclare->getMetadata(id));
		  }
		  to_remove.push_back(oldDeclare); // can't erase while iterating through instructions
		  changed = true;
		}
	      }
	    }
	  }
	}
      }
    }
    for(unsigned i = 0; i < to_remove.size(); i++) {
      to_remove[i]->eraseFromParent();
    }
    if (!changed) {
      errs() << "\tNo metadata to change\n";
    }
  }
  return;
}
#endif
void Variables::findLocalVariables(Function &function, map<string, StrChange*> &changes) {
  char strType[100] = {'\0'};
  char id[100] = {'\0'};
  char myName[100] = {'\0'};
  char func[100] = {'\0'};
  char field[2] = {'\0'};
  int iField = -1;

  const ValueSymbolTable *symbolTable = function.getValueSymbolTable();
  ValueSymbolTable::const_iterator it = symbolTable->begin();
  errs()<<"start\n"; 
  for(; it != symbolTable->end(); it++) {
    Value *value = it->second;
    string name = value->getName();

    if (excludedLocalVars.find(name) == excludedLocalVars.end()) {
      Type *type = findLocalType(value);

      if (type) { 
        if ((OnlyScalars && type->isFloatingPointTy()) ||
            (OnlyArrays && isFPArray(type)) || 
            (!OnlyScalars && !OnlyArrays)) {                                                                                      
    
          if (value->getName().find('.') == string::npos) {
            if (Instruction *i = function.getEntryBlock().getTerminator()) {
              if (MDNode *node = i->getMetadata("dbg")) {
                DILocation *loc = i->getDebugLoc();
                //outfile << "\t\t\"file\": \"" << loc->getFilename() << "\",\n";
              }
            }
            strcpy(func, function.getName().str().c_str());     
            strcpy(myName, value->getName().str().c_str());     
            errs()<<"findLocalVariables:"<<myName<<"\n";
            printType(type, strType);
            strcpy(id, myName);
            strcat(id, "@");
            strcat(id, func);
            string idStr(id);

            StrChange *change = new StrChange("localVar", string(strType), iField);
            changes[idStr] = change;
          }
        }
      }
    } 
  }
  errs()<<"end\n"; 
  return;
}

void Variables::findOperators(Function &function, map<string, StrChange*> &changes) {
  char myName[100] = {'\0'};
  char func[100] = {'\0'};
  char id[100] = {'\0'};
  char file[100] = {'\0'};
  char line[100] = {'\0'};
  char strType[1000] = {'\0'};

  for(Function::iterator b = function.begin(), be = function.end(); b != be; b++) {
    for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {

      if (BinaryOperator *binOp = dyn_cast<BinaryOperator>(i)) {
        switch(binOp->getOpcode()){
          case Instruction::FAdd:
          case Instruction::FSub:
          case Instruction::FMul:
          case Instruction::FDiv:{ 
            strcpy(id, getID(*i).c_str());  
            strcpy(func, function.getName().str().c_str());  
            strcpy(myName, binOp->getOpcodeName());  
            printType(binOp->getType(), strType);
            string idStr(id);
            StrChange *change = new StrChange("op", string(strType), -1);
            changes[idStr] = change;
          }
            break;
          default:
            // do nothing
            break;
        }
      }
      else if (FCmpInst *fcmp = dyn_cast<FCmpInst>(i)){

        strcpy(id, getID(*i).c_str());  
        strcpy(func, function.getName().str().c_str());  
        strcpy(myName, fcmp->getOpcodeName());  
        printType(fcmp->getOperand(0)->getType(), strType);
        string idStr(id);
        StrChange *change = new StrChange("op", string(strType), -1);
        changes[idStr] = change;                                                    
      }
    }
  }
  return;
}

void Variables::findFunctionCalls(Function &function, map<string, StrChange*> &changes) {
  char strType[1000] = {'\0'};
  char myName[100] = {'\0'};
  char func[100] = {'\0'};
  char id[100] = {'\0'};
  char file[100] = {'\0'};
  char line[100] = {'\0'};
  char swit[100] = {'\0'};

  for(Function::iterator b = function.begin(), be = function.end(); b != be; b++) {
    for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {

      if (CallInst *callInst = dyn_cast<CallInst>(i)) {
        Function *callee = callInst->getCalledFunction();

        if (callee) {
          string name = callee->getName();
          if (functionCalls.find(name) != functionCalls.end()) {
            strcpy(id, getID(*i).c_str());  
            strcpy(func, function.getName().str().c_str());  
            strcpy(myName, name.c_str()); 
            strcpy(swit, name.c_str()); 
            strcpy(strType, "double, double"); 
  string idStr(id);
  FuncStrChange *change = new FuncStrChange("call", string(strType), -1, string(swit));
  changes[idStr] = change;
          }
        }
      }
    }
  }
return;
}
bool Variables::runOnFunc(Function &function, map<string, StrChange*> &changes) {                                      
  findLocalVariables(function, changes);

  if (ListOperators) {
    findOperators(function, changes);
  }

  if (ListFunctions) {
    findFunctionCalls(function, changes);
  }
  return false;
}
void Variables::findGlobalVariables(Module &module, map<string, StrChange*> &changes) {
  char strType[1000] = {'\0'};
  char myName[1000] = {'\0'}; 

  for (Module::global_iterator it = module.global_begin(); it != module.global_end(); it++) {
    Value *value = &*it;
    if (GlobalVariable *global = dyn_cast<GlobalVariable>(value)) {
      string name = global->getName();

      if (includedGlobalVars.find(name) != includedGlobalVars.end()) {
        PointerType* pointerType = global->getType();      
        Type* elementType = pointerType->getElementType();
  
        if ((OnlyScalars && elementType->isFloatingPointTy()) ||
          (OnlyArrays && isFPArray(elementType)) || 
          (!OnlyScalars && !OnlyArrays)) {
    
          if (name.find('.') == string::npos) {
            strcpy(myName, global->getName().str().c_str());
            printType(elementType, strType);
  string idStr(myName);
  StrChange *change = new StrChange("globalVar", string(strType), -1);
  changes[idStr] = change;
          }
        }
      }
    }
  }
  return;
}

bool Variables::runOnModule(Module &M) {
  errs() << "Running Variables\n";
  //DL = &M.getDataLayout();
  //doInitialization(M);
  
  findGlobalVariables(M, types);

  for(Module::iterator f = M.begin(), fe = M.end(); f != fe; f++) {
    string name = f->getName().str();
    errs()<<"test1\n";
    if (!f->isDeclaration() ) {
      runOnFunc(*f, types);
      errs()<<"types.size:"<<types.size()<<"\n";
    }
  }

  Module::global_iterator it = M.global_begin();
  LLVMContext& context = M.getContext();
  for(; it != M.global_end(); it++) {
    Value *value = dyn_cast<Value>(it);
    if (GlobalVariable *global = dyn_cast<GlobalVariable>(value)) {
      string varId = global->getName();
      updateChanges(varId, value, context);
    }
  }
  for(Module::iterator f = M.begin(), fe = M.end(); f != fe; f++) {
    if (!f->isDeclaration()) {
      runOnFunction(*f);
    }
  }
   for (map<ChangeType, Changes>::iterator im = changes.begin(); im != changes.end(); im++) {
    ChangeType changeType = im->first;
    Changes changeVector = im->second;

    errs() << changeType << ":\n";
    for (Changes::iterator ic = changeVector.begin(); ic != changeVector.end(); ic++) {
      Change *change = *ic;
      Value *value = change->getValue();
      if (BinaryOperator *op = dyn_cast<BinaryOperator>(value)) {
        errs() << "\tname: " << op->getOpcodeName() << ", ";
      }
      else if (FCmpInst *fcmp = dyn_cast<FCmpInst>(value)) {
        errs() << "\tname: " << fcmp->getOpcodeName() << ", ";
      }
      else {
        errs() << "\tname: " << value->getName() << ", ";
      }
      errs() << "type: "; 
      change->getType().at(0)->dump(); 
      errs() << "\n";
    }
  }

  vector<Change*>::iterator it1;
  for(it1 = changes[GLOBALVAR].begin(); it1 != changes[GLOBALVAR].end(); it1++) {
    changeGlobal(*it1, M); // TODO: return value and metadata
  }

  for(it1 = changes[LOCALVAR].begin(); it1 != changes[LOCALVAR].end(); it1++) {
    errs() <<"test11\n";
    AllocaInst* newTarget = changeLocal(*it1, M);
 //   if (newTarget) {
 //     errs() << "\tProcessed local variable: " << newTarget->getName() << "\n";
      //updateMetadata(M, (*it1)->getValue(), newTarget, (*it1)->getType()[0]);

#ifdef DEBUG
      verifyModule(M);
      errs() << "**** MODULE VERIFIES after a single change ****\n";
#endif
//    }
  }

  return true;
}

bool Variables::runOnFunction(Function &f) {
  // local variables
  string functionName = f.getName();
  LLVMContext& context = f.getContext();
  ValueSymbolTable *symbolTable = f.getValueSymbolTable();
  ValueSymbolTable::const_iterator it = symbolTable->begin();

  for(; it != symbolTable->end(); it++) {
    Value *value = it->second;
    if (dyn_cast<Argument>(value)) {
      value = findAlloca(value, &f);
    }

    string varIdStr = "";
    //varIdStr += value->getName();
    varIdStr += it->second->getName();
    varIdStr += "@";
    varIdStr += functionName;
    updateChanges(varIdStr, value, context);
  }

  // operations and calls
  for (Function::iterator b = f.begin(), be = f.end(); b != be; b++) {
    for (BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {
      Instruction *inst = dyn_cast<Instruction>(i);
      string id = getID(*i);
      updateChanges(id, inst, context);
    }
  }

  return false;
}  

static Type* constructStruct(Value *value, unsigned int fieldToChange, Type *fieldType) {

  Type *type = value->getType();
  StructType *newStructType = NULL;

  if (PointerType *pointerType = dyn_cast<PointerType>(type)) {
    if (StructType *oldStructType = dyn_cast<StructType>(pointerType->getElementType())) {

      vector<Type*> fields;
      
      for(unsigned int i = 0; i < oldStructType->getNumElements(); i++) {
  if (i != fieldToChange) {
    fields.push_back(oldStructType->getElementType(i));
  }
  else {
    // replace old field type with new type
    fields.push_back(fieldType);
  }
      }

      ArrayRef<Type*> *arrayRefFields = new ArrayRef<Type*>(fields);
      newStructType = StructType::create(*arrayRefFields, oldStructType->getName());
    }
  }
  return newStructType;
}

void Variables::updateChanges(string id, Value* value, LLVMContext& context) {
  map<string, StrChange*>::iterator typeIt;
  typeIt = types.find(id);
  if (typeIt != types.end()) {
    string changeType = typeIt->second->getClassification();
    string typeStrs = typeIt->second->getTypes();
    int field = typeIt->second->getField();
    Types type;
    // split type string
    // (in case of function there are two or more types,
    // in case of array there are size info)
    istringstream iss(typeStrs);

    do {
      string typeStr;
      iss >> typeStr;

      if (typeStr.compare("float") == 0) {
        Type *aType = Type::getFloatTy(context);
        type.push_back(aType);
      } else if (typeStr.compare("double") == 0) {
        Type *aType = Type::getDoubleTy(context);
        type.push_back(aType);
      } else if (typeStr.compare("longdouble") == 0) {
        Type *aType = Type::getX86_FP80Ty(context);
        type.push_back(aType);
      } else if (typeStr.compare(0, 6, "float[") == 0) {
        bool first = true;
        size_t openBracketPos, closeBracketPos; 
        int size;
        Type *aType;
        while ((openBracketPos = typeStr.find_last_of('[')) != string::npos) {
          closeBracketPos = typeStr.find_last_of(']');
          size = atoi(typeStr.substr(openBracketPos+1, closeBracketPos - openBracketPos - 1).c_str());
          if (first) {    
            aType = ArrayType::get(Type::getFloatTy(context), size);
            first = false;
          } else {
            aType = ArrayType::get(aType, size);
          }
          typeStr = typeStr.substr(0, openBracketPos);
        }
        type.push_back(aType);
      } else if (typeStr.compare(0, 7, "double[") == 0) {
        bool first = true;
        size_t openBracketPos, closeBracketPos;
        int size;
        Type *aType;
        while ((openBracketPos = typeStr.find_last_of('[')) != string::npos) {
          closeBracketPos = typeStr.find_last_of(']');
          size = atoi(typeStr.substr(openBracketPos+1, closeBracketPos - openBracketPos - 1).c_str());
          if (first) {
            aType = ArrayType::get(Type::getDoubleTy(context), size);
            first = false;
          } else {
            aType = ArrayType::get(aType, size);
          }
          typeStr = typeStr.substr(0, openBracketPos);
        }
        type.push_back(aType);
      } else if (typeStr.compare(0, 11, "longdouble[") == 0) {
        bool first = true;
        size_t openBracketPos, closeBracketPos; 
        int size;
        Type *aType;
        while ((openBracketPos = typeStr.find_last_of('[')) != string::npos) {
          closeBracketPos = typeStr.find_last_of(']');
          size = atoi(typeStr.substr(openBracketPos+1, closeBracketPos - openBracketPos - 1).c_str());
 if (first) {
            aType = ArrayType::get(Type::getX86_FP80Ty(context), size);
            first = false;
          } else {
            aType = ArrayType::get(aType, size);
          }
          typeStr = typeStr.substr(0, openBracketPos);
        }
        type.push_back(aType);
      } else if (typeStr.compare(0, 6, "float*") == 0) {
        Type *aType = PointerType::getUnqual(Type::getFloatTy(context));
        type.push_back(aType);
      } else if (typeStr.compare(0, 7, "double*") == 0) {
        Type *aType = PointerType::getUnqual(Type::getDoubleTy(context));
        type.push_back(aType);
      } else if (typeStr.compare(0, 11, "longdouble*") == 0) {
        Type *aType = PointerType::getUnqual(Type::getX86_FP80Ty(context));
        type.push_back(aType);
      }
    } while (iss);
// SPECIAL CASE: structs
    if (field >= 0) {
      type[0] = constructStruct(value, field, type[0]); // first element?
    }

    if (type.size() > 0) { // todo: this fix does not work in case of function call
      if (changeType.compare("globalVar") == 0) {
        errs()<<"globalVar\n";
        changes.find(GLOBALVAR)->second.push_back(new Change(type, value, field));
      } else if (changeType.compare("localVar") == 0) {
        errs()<<"localVar\n";
        changes.find(LOCALVAR)->second.push_back(new Change(type, value, field));
      } else if (changeType.compare("op") == 0) {
        errs()<<"op\n";
        changes.find(OP)->second.push_back(new Change(type, value));
      } else if (changeType.compare("call") == 0) {
        errs()<<"call\n";
        FuncStrChange* change = (FuncStrChange*) typeIt->second;
        string swit = change->getSwitch();
        changes.find(CALL)->second.push_back(new FunctionChange(type, value, swit));
      }
    }
  }
} 

Value* Variables::findAlloca(Value *value, Function *function) {

  for(Function::iterator b = function->begin(), be = function->end(); b != be; b++) {
    for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {

      if (StoreInst *store = dyn_cast<StoreInst>(i)) {
        Value *op1 = store->getOperand(0);
        Value *op2 = store->getOperand(1);
        if (op1 == value) {
          op2->takeName(value);
          return op2;
        }
      }
    }
  }
  return value;
}

void Variables::getAnalysisUsage(AnalysisUsage &AU) const {
//  AU.addRequired<CreateIDBitcode>();
 // AU.setPreservesAll();
  AU.setPreservesAll();
}


char Variables::ID = 0;
static const RegisterPass<Variables> registration("variables", "Change the precision of variables");
