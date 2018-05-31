#include "FPInstrument.hpp"
#include "Transformer.hpp"
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
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Verifier.h>
#include <fstream>


bool FPInstrument::runOnModule(Module &M) {
  
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    initializeCallbacks(*F.getParent()); 
    if (!instrumentFunctions(F.getName())) continue;  
    if (!F.isDeclaration() && F.getName() != "setShadow" && F.getName() != "getShadow") {
      runOnFunction(F);
    }
  }

  return true;
}

bool FPInstrument::instrumentFunctions(StringRef fn_name) {                                                                       
  std::ifstream infile("functions.txt");
  std::string line;
  while (std::getline(infile, line)) {
    if(fn_name.find(line) != StringRef::npos)
      return true;
  }
  return false;
}

void FPInstrument::initializeCallbacks(Module &M) {                                                                               
  IRBuilder<> IRB(M.getContext());
  AttributeList Attr;
  Attr = Attr.addAttribute(M.getContext(), AttributeList::FunctionIndex,
                           Attribute::NoUnwind);

  Type* voidTy = Type::getVoidTy(M.getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M.getContext()));
  Type* size_ty = Type::getInt64Ty(M.getContext());
  Type* int_ty = Type::getInt32Ty(M.getContext());
  Type* void_ptr_ty1 = PointerType::getUnqual(Type::getInt8Ty(M.getContext()));
  Type* void_ptr_ty2 = PointerType::getUnqual(Type::getFloatTy(M.getContext()));
  Type* float_ty = Type::getFloatTy(M.getContext());
  Type *I8Ptr = IRB.getInt8PtrTy();

  SetReal = M.getOrInsertFunction("setReal", voidTy, void_ptr_ty, float_ty);
  GetReal = M.getOrInsertFunction("getReal", I8Ptr, void_ptr_ty);
  
}

Instruction* FPInstrument::getReal(Instruction *I, Value *Addr, Function &F){
  IRBuilder<> IRB(I);

  Module *M = F.getParent();
  Type* voidTy = Type::getVoidTy(M->getContext());
  BitCastInst* bitcast = new BitCastInst(Addr,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);

  Instruction* newI = IRB.CreateCall(GetReal, bitcast);
  
  return newI;
}
void FPInstrument::setReal(Instruction *I, Value *Addr, Value *op1, Function &F){
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* void_ty = Type::getVoidTy(M->getContext());;

  BitCastInst* bitcast = new BitCastInst(Addr,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  BitCastInst* bitcast1 = new BitCastInst(I->getOperand(1),PointerType::getUnqual(Type::getDoubleTy(M->getContext())),"", I);

  Instruction* newI = IRB.CreateCall(SetReal, {bitcast, op1});
}

void FPInstrument::handleOp(BinaryOperator* binOp, Value *Addr, Instruction *I, Function &F){
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* voidTy = Type::getVoidTy(M->getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* size_ty = Type::getInt64Ty(M->getContext());
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Type* void_ptr_ty1 = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* void_ptr_ty2 = PointerType::getUnqual(Type::getFloatTy(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type *I8Ptr = IRB.getInt8PtrTy();
  Type* void_ty = Type::getVoidTy(M->getContext());
  BitCastInst* Addr0 = new BitCastInst(Addr,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  Constant* op_code = ConstantInt::get(Type::getInt32Ty(M->getContext()), binOp->getOpcode());
/// BitCastInst* bitcast1 = new BitCastInst(v1,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
//  BitCastInst* bitcast1 = new BitCastInst(v1,PointerType::getUnqual(Type::getFloatTy(M->getContext())),"", I);
  //have to generalize, here operand 0 is constant
  Type* type = binOp->getOperand(0)->getType();
  errs()<<"type:"<<*type<<"\n";
  if (PointerType* pointerType = dyn_cast<PointerType>(type)) {
    errs()<<"pointer\n";
    BitCastInst* op0_ptr_ty = new BitCastInst(binOp->getOperand(0),PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  HandleOp = M->getOrInsertFunction("handleOp", voidTy, int_ty, void_ptr_ty, void_ptr_ty2);
  Instruction* newI = IRB.CreateCall(HandleOp, {op_code, Addr0, op0_ptr_ty});
  }
  else{
    errs()<<"else\n";
    BitCastInst* op0_ty = new BitCastInst(binOp->getOperand(1),Type::getFloatTy(M->getContext()));
    HandleOp = M->getOrInsertFunction("handleOp", voidTy, int_ty, void_ptr_ty, float_ty);
    Instruction* newI = IRB.CreateCall(HandleOp, {op_code, Addr0, op0_ty});
  }
  
  size_t opcode = binOp->getOpcode();
}
void FPInstrument::addnewInline(Instruction *newI, Instruction *oldI){
  unsigned alignment;
  switch(newI->getType()->getTypeID()) {                                                                              
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
  LoadInst *loadInst = dyn_cast<LoadInst>(oldI);
  LoadInst* newLoad = new LoadInst(newI, "", false, alignment, loadInst);
  newLoad->setAlignment(alignment);
//  errs() << "\n=Transforming LOADINST";
//  errs() << "\nOld: ";
//  oldI->dump();
//  errs() << "\nNew: ";
//  newI->dump();
//  newLoad->dump();

}
 
unsigned FPInstrument::getAlignment(Type* type) {
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
 
bool FPInstrument::runOnFunction(Function &F) {

  for (auto &BB : F) {                                                                                                        
    for (auto &Inst : BB) {
      if (isa<LoadInst>(Inst) || isa<StoreInst>(Inst)){
        LocalLoadsAndStores.push_back(&Inst);
      }
    }
  }
  for (Instruction *I : LocalLoadsAndStores) {
    errs()<<*I<<"\n";
    if (StoreInst *Store = dyn_cast<StoreInst>(I)) {
      Value *Addr = Store->getPointerOperand();
      //create call to set value of shadow var
      //set real value for this addr
      errs()<<"op:"<<*(Store->getOperand(0))<<"\n";
      setReal(I, Addr, Store->getOperand(0), F);
    }
    else {
      LoadInst *Load = cast<LoadInst>(I);
      Value *Addr = Load->getPointerOperand();  
      //create call the get value of shadow var
      //Instruction* newI = getReal(I, Addr, F);
      //errs()<<"getReal:"<<*newI<<"\n";
      //find uses of all load inst and replace with new inst
      //addnewInline(newI, I);
      for (Use &U : Load->uses()) {
        Module *M = F.getParent();
        User *UR = U.getUser();
        errs()<<"used by\n";
        errs()<<*UR<<"\n";
//        trace(UR, newI, I, newI->getType(), I->getType(), 4);
        if(BinaryOperator* binOp = dyn_cast<BinaryOperator>(UR)) {
          switch(binOp->getOpcode()) {
            case Instruction::FAdd:
            case Instruction::FSub:
            case Instruction::FMul:
            case Instruction::FDiv:
              handleOp(binOp, Addr, I, F); 
              break;
            default:
              // do nothing
            break;
          }    
        }
      }
    }
  }
    return true;
}  

bool FPInstrument::trace(User *it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment){
  if (LoadInst *inst = dyn_cast<LoadInst>(it)) {
      return traceLoad(*inst, newTarget, oldTarget, newType, oldType, alignment);
  } else if(StoreInst *inst = dyn_cast<StoreInst>(it)) {
      return traceStore(*inst, newTarget, oldTarget, newType, oldType, alignment);
  } else if(BitCastInst *inst = dyn_cast<BitCastInst>(it)) {
      return traceBitCast(*inst, newTarget, oldTarget, newType, oldType, alignment);
  } else if(GetElementPtrInst *inst = dyn_cast<GetElementPtrInst>(it)) {
      return traceGetElement(*inst, newTarget, oldTarget, newType, oldType, alignment);
  } else if(CallInst *inst = dyn_cast<CallInst>(it)) {
      return traceCall(*inst, newTarget, oldTarget, newType, oldType, alignment);
  }
  return false;
} 

bool FPInstrument::traceLoad(LoadInst &it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment){

}

void addFPPass(const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
  PM.add(new FPInstrument());
}

RegisterStandardPasses SOpt(PassManagerBuilder::EP_OptimizerLast,
                        addFPPass);
RegisterStandardPasses S(PassManagerBuilder::EP_EnabledOnOptLevel0,
                         addFPPass);

char FPInstrument::ID = 0;
static const RegisterPass<FPInstrument> Y("fp", "Change the precision of variables", false, false);
