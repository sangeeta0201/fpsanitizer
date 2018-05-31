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
map<ChangeType, Changes> & Variables::getChanges() {
  return changes;
}


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

//  const char* filename = JsonConfigFileName.c_str();
  //fileName = "file.json";
  changes = getChanges();
//  errs()<<"fileName:"<<filename<<"\n";
//  types = parse_config("file.json");

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

  errs()<<"changeLocal1\n";
  if (AllocaInst *oldTarget = dyn_cast<AllocaInst>(value)) {
    Type* oldType = oldTarget->getType()->getElementType();

    errs() << "Changing the precision of variable \"" << oldTarget->getName() << "\" from " << *oldType 
	   << " to " << *newType << ".\n";

    if (diffTypes(oldType, newType)) {      
      unsigned alignment = getAlignment(newType);

      //newTarget = new AllocaInst(newType, 0, alignment, "new", oldTarget);
//      newTarget = new AllocaInst(newType, oldTarget->getType()->getAddressSpace(),  nullptr, alignment, "new", oldTarget);
//      newTarget = IRB.CreateAlloca(newType,  
 //                             alignment,
   //                           "new");

  //    newTarget->takeName(oldTarget);

      // iterating through instructions using old AllocaInst
      Value::use_iterator it = oldTarget->use_begin();
         bool is_erased = false;
      for(; it != oldTarget->use_end(); it++) {
        errs()<<"Testing\n";
        errs()<<*it<<"\n";
  //        bool is_erased = Transformer::transform(it, newTarget, oldTarget, newType, oldType, alignment);
          Instruction *I = dyn_cast<Instruction>(*it);
          errs()<<*I;
          if (LoadInst *inst = dyn_cast<LoadInst>(*it)) {
          instrument(*I, M);
    //      is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(StoreInst *inst = dyn_cast<StoreInst>(*it)) {
          instrument(*I, M);
      //    is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(BitCastInst *inst = dyn_cast<BitCastInst>(*it)) {
          is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(GetElementPtrInst *inst = dyn_cast<GetElementPtrInst>(*it)) {
       //   is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      } else if(CallInst *inst = dyn_cast<CallInst>(*it)) {
       //   is_erased = Transformer::transform(*inst, newTarget, oldTarget, newType, oldType, alignment);
      }
	      if (!is_erased) {
//	        erase.push_back(dyn_cast<Instruction>(*it));
	      }
      }
      // erasing old uses of instructions
      for(unsigned int i = 0; i < erase.size(); i++) {
	//      erase[i]->eraseFromParent();
      }
      // erase old instruction
      //oldTarget->eraseFromParent();      
   }
    else {
      errs() << "\tNo changes required.\n";
    }
  }
  else if (Argument *argument = dyn_cast<Argument>(value)){
    errs() << "WARNING: Function argument instead of Alloca for: " << argument->getName() << ".\n";
  }

  return newTarget;
}


void Variables::instrument(Instruction &I, Module &M) {

  IRBuilder<> IRB(&I);

  Value *A0 = I.getOperand(0);
  Value *A1 = I.getOperand(1);
  uint64_t TypeSize = DL->getTypeStoreSizeInBits(A0->getType());
  int CallbackIdx = TypeSize == 8 ? 0 :
    TypeSize == 16 ? 1 :
    TypeSize == 32 ? 2 :
    TypeSize == 64 ? 3 : -1;
  if (CallbackIdx < 0) return;

      // iterating through instructions using old AllocaInst
  Type* op0ty = A0->getType();
  Type* op1ty = A1->getType();

  llvm::FunctionType *funcTy = llvm::FunctionType::get(IRB.getVoidTy(), {op0ty,op1ty}, false);
  Function *callfunc = dyn_cast<Function>(M.getOrInsertFunction("funcAdd", funcTy));
  callfunc->setCallingConv(CallingConv::C);
//  CallInst *CI = IRB.CreateCall(callfunc, {A0,A1});

}

AllocaInst* Variables::changeLocal(Change* change, Module &M) {

  Type* newType = change->getType()[0];
  if (ArrayType* arrayType = dyn_cast<ArrayType>(newType)) {
    errs() <<"test2\n"; 
    return changeLocal(change->getValue(), arrayType, M);
  } else if (PointerType* pointerType = dyn_cast<PointerType>(newType)) {
    errs() <<"test3\n"; 
    return changeLocal(change->getValue(), pointerType, M);
  } else if (StructType* structType = dyn_cast<StructType>(newType)) {
    errs() <<"test4\n"; 
    return changeLocal(change->getValue(), structType/*, change->getField()*/, M);
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


bool Variables::runOnModule(Module &M) {
  errs() << "Running Variables\n";
  //DL = &M.getDataLayout();
  //doInitialization(M);


  Module::global_iterator it = M.global_begin();
  LLVMContext& context = M.getContext();
  for(; it != M.global_end(); it++) {
    Value *value = dyn_cast<Value>(it);
    if (GlobalVariable *global = dyn_cast<GlobalVariable>(value)) {
      string varId = global->getName();
  //    updateChanges(varId, value, context);
    }
  }
  for(Module::iterator f = M.begin(), fe = M.end(); f != fe; f++) {
    if (!f->isDeclaration()) {
 //     runOnFunction(*f);
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
    errs() <<"test1\n";
    AllocaInst* newTarget = changeLocal(*it1, M);
    if (newTarget) {
      errs() << "\tProcessed local variable: " << newTarget->getName() << "\n";
      //updateMetadata(M, (*it1)->getValue(), newTarget, (*it1)->getType()[0]);

#ifdef DEBUG
      verifyModule(M);
      errs() << "**** MODULE VERIFIES after a single change ****\n";
#endif
    }
  }

  return true;
}
/*
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
*/
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

      errs()<<"type.size:"<<type.size()<<"\n";
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
/*
void Variables::getAnalysisUsage(AnalysisUsage &AU) const {
//  AU.addRequired<CreateIDBitcode>();
 // AU.setPreservesAll();
}
*/

char Variables::ID = 0;
static const RegisterPass<Variables> registration("variables", "Change the precision of variables");
