#include "FPInstrument.hpp"
#include "Transformer.hpp"
#include <string>
#include <string.h>
#include <iostream>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <map>
#include <queue>
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
#include "llvm/IR/CallSite.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include <fstream>

/* TODO
1. Handle conversions
2. Handle read write from registers
3. Handle taint tracking
4. Handle error aggregation
*/
bool ret = true;
bool FPInstrument::runOnModule(Module &M) {
  errs() << "Running FPInstrument\n";
 
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    if (F.isDeclaration()) continue;
    if (!instrumentFunctions(F.getName())) continue;
    StringRef funcName = F.getName();
    AllFuncList.push_back(&F);
  }
  std::queue<llvm::Argument*> arglist;
  for (Function *F : reverse(AllFuncList)) {
    errs()<<"********"<<F->getName()<<"*****\n";

    for (Use &U : F->uses()) {
      User *UR = U.getUser();
      // Ignore blockaddress uses.
      if (isa<BlockAddress>(UR)) continue;
        
      // Used by a non-instruction, or not the callee of a function, do not
      // transform.
      if (!isa<CallInst>(UR) && !isa<InvokeInst>(UR))
        continue;
        
      CallSite CS(cast<Instruction>(UR));
      if (!CS.isCallee(&U))
        continue;

    // Check out all of the potentially constant arguments.  Note that we don't
    // inspect varargs here.
      CallSite::arg_iterator AI = CS.arg_begin();
      CallSite::arg_iterator AE = CS.arg_end();
      Function::arg_iterator Arg = F->arg_begin();
      for (int i = 0; AI != AE; i++, ++AI, ++Arg) {
        Value *V1 = dyn_cast<Value>(AI);
        Value *V2 = dyn_cast<Value>(Arg);
        errs()<<"Function uses callSite:"<<*V1<<"\n";
        errs()<<"Function uses Fun Arg:"<<*V2<<"\n";
        errs()<<"funArgMap insert:"<<*V2<<":"<<*V1<<"\n";
        Value *I1 = dyn_cast<Value>(AI);
        funArgMap.insert(std::pair<Value*, Value*>(V2, V1)); //old instruction, new instruction
      }
    }

    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (LoadInst *Load = dyn_cast<LoadInst>(&I)){
          Value *Addr = Load->getPointerOperand();
          errs()<<"loadMap insert:"<<*Addr<<":"<<I<<"\n";
          loadMap.insert(std::pair<Instruction*, Value*>(&I, Addr)); //we maintain list of variables mapped to instructions,
                                                                     //can say that its like mapping temporaries
        }
        else if (StoreInst *Store = dyn_cast<StoreInst>(&I)){
          Value *Addr = Store->getPointerOperand();
          setReal(&I, Addr, Store->getOperand(0), *F); //For every store we set real value in shadowmap
        }
        else if (BinaryOperator* binOp = dyn_cast<BinaryOperator>(&I)){
          handleOp(&I, binOp, *F);  // we handle binary operations on fp
        }
        else if (CallInst *callInst = dyn_cast<CallInst>(&I)){ //handle math library functions
          Function *callee = callInst->getCalledFunction();
          if (callee) {
            string name = callee->getName();
              if(name == "sqrt") 
                handleMathFunc(&I, callInst, *F);  //we handle math functions for fp
          }
        }
      }
    }
  loadMap.clear();
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

void FPInstrument::setReal(Instruction *I, Value *Addr, Value *op0, Function &F){
  IRBuilder<> IRB(I);
  errs()<<"setReal Instruction :"<<*I<<"\n";
  errs()<<"setReal Addr:"<<*Addr<<"\n";
  Module *M = F.getParent();
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type *op0_type = op0->getType();
  BitCastInst* bitcast = new BitCastInst(Addr,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);

  Type* voidTy = Type::getVoidTy(M->getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type* double_ty = Type::getDoubleTy(M->getContext());
  errs()<<"setReal: op0_type->getTypeID():"<<op0_type->getTypeID()<<"\n";
  if (isa<ConstantFP>(op0)) {
    errs()<<"setReal:op0 is a constant"<<"\n";
    if(op0_type->getTypeID() == Type::FloatTyID){
      SetRealConstant = M->getOrInsertFunction("setRealConstant_float", voidTy, void_ptr_ty, float_ty);
      Instruction* newI = IRB.CreateCall(SetRealConstant, {bitcast, op0});
    }
    else if(op0_type->getTypeID() == Type::DoubleTyID){
      SetRealConstant = M->getOrInsertFunction("setRealConstant_double", voidTy, void_ptr_ty, double_ty);
      Instruction* newI = IRB.CreateCall(SetRealConstant, {bitcast, op0});
    }
  }
  else{
    Instruction *op0_i = dyn_cast<Instruction>(I->getOperand(0));
    SetRealTemp = M->getOrInsertFunction("setRealTemp", voidTy, void_ptr_ty, void_ptr_ty);
    if(loadMap.count(op0_i) != 0){
      errs()<<"setReal:found in loadMap:"<<"\n";
      Value *realI = loadMap.at(op0_i);
      BitCastInst* bitcast1 = new BitCastInst(realI,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      Instruction* newI = IRB.CreateCall(SetRealTemp, {bitcast, bitcast1});
    } 
    else {
      Value *op0_i = dyn_cast<Value>(I->getOperand(0));
      errs()<<"setReal: not found in loadMap:"<<*(op0_i)<<"\n";
      SetRealTemp = M->getOrInsertFunction("setRealTemp", voidTy, void_ptr_ty, void_ptr_ty);
      errs()<<"op0_type->getTypeID():"<<op0_type->getTypeID()<<"\n"; 
      if(op0_type->getTypeID() == Type::PointerTyID){
        BitCastInst* bitcast1 = new BitCastInst(op0,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
        Instruction* newI = IRB.CreateCall(SetRealTemp, {bitcast, bitcast1});
      }
      else{
        errs()<<"setReal: not a pointer, not a constant, not in load map, means its loaded from func arg";
/*
        SetRealConstant = M->getOrInsertFunction("setRealConstant_double", voidTy, void_ptr_ty, double_ty);
        Instruction* newI = IRB.CreateCall(SetRealConstant, {bitcast, op0});
*/
        if(funArgMap.count(op0_i) != 0){
            errs()<<"setReal:found in funArgMap:"<<"\n";
            Value *realI = funArgMap.at(op0_i);
            Instruction *op0_ii = dyn_cast<Instruction>(realI);
            Type *realI_type = realI->getType();
            if (LoadInst *Load = dyn_cast<LoadInst>(op0_ii)){
              Value *Addr = Load->getPointerOperand();
              errs()<<"load :"<<*Addr<<":"<<*I<<"\n";
              errs()<<"op0_type->getTypeID():"<<op0_type->getTypeID()<<"\n"; 
             // if(op0_type->getTypeID() != Type::PointerTyID){
              //  BitCastInst* bitcast1 = new BitCastInst(Addr,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
                SetRealConstant = M->getOrInsertFunction("setRealConstant_double", voidTy, void_ptr_ty, double_ty);
                Instruction* newI = IRB.CreateCall(SetRealConstant, {bitcast, op0});
             // }
            }
        }
      }
    }
  }
}

void FPInstrument::handleMathFunc(Instruction *I, CallInst *callInst, Function &F){
  errs()<<"handleMathFunc called\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type* double_ty = Type::getDoubleTy(M->getContext()); 

  Type* int_ty = Type::getInt32Ty(M->getContext());
  Value *op0 = callInst->getOperand(0);
  Constant* funcCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), 1);
  Type *op0_type = op0->getType();
  BitCastInst* b_op_0;
  Function *callee = callInst->getCalledFunction();
  if (callee) {
    string name = callee->getName();
    errs()<<"func name:"<<name<<"\n";
    errs()<<"operand name:"<<*op0<<"\n";
    //Assuming operand is a temp
    if (isa<ConstantFP>(op0)) { 
        if(op0_type->getTypeID() == Type::FloatTyID){
          b_op_0 = new BitCastInst(op0, Type::getFloatTy(M->getContext()),"", I);
          HandleFunc = M->getOrInsertFunction("handleMathFunc", void_ptr_ty, int_ty, float_ty);
        }
        else if(op0_type->getTypeID() == Type::DoubleTyID){
          b_op_0 = new BitCastInst(op0, Type::getDoubleTy(M->getContext()),"", I);
          HandleFunc = M->getOrInsertFunction("handleMathFunc", void_ptr_ty, int_ty, double_ty);
        }
        else
          errs()<<"handleMathFunc: Error!!! Unknown type\n";
    }
    else{
      errs()<<"handleMathFunc op0 is not a constant, finding in loadMap\n";
      Instruction *op_i = dyn_cast<Instruction>(op0);
      if(loadMap.count(op_i) != 0){
        errs()<<"found in loadMap:"<<"\n";
        Value *op_1 = loadMap.at(op_i);
        b_op_0 = new BitCastInst(op_1, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
        HandleFunc = M->getOrInsertFunction("handleMathFunc", void_ptr_ty, int_ty, void_ptr_ty);
  
      }
    }
    Instruction* newI = IRB.CreateCall(HandleFunc, {funcCode, b_op_0});
    Value *Addr = dyn_cast<Value>(newI);
    loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
    errs()<<"handleOp loadMap insert:"<<*Addr<<":"<<*I<<"\n";
  }
}

void FPInstrument::handleOp(Instruction *I, BinaryOperator* binOp, Function &F){
  errs()<<"handleOp called:"<<*I<<"\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Constant* opCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), binOp->getOpcode());

  Type *fpConstant_op0 = binOp->getOperand(0)->getType();
  Type *fpConstant_op1 = binOp->getOperand(1)->getType();
 
  BitCastInst* b_op_0;
  BitCastInst* b_op_1;
  bool op_0_cons = false;
  bool op_1_cons = false;
  if (isa<ConstantFP>(binOp->getOperand(0))) {
    errs()<<"handleOp op0 is a constant\n";
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      b_op_0 = new BitCastInst(binOp->getOperand(0), Type::getFloatTy(M->getContext()),"", I);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      b_op_0 = new BitCastInst(binOp->getOperand(0), Type::getDoubleTy(M->getContext()),"", I);
    op_0_cons = true;
  } 
  else {
    errs()<<"handleOp op0 is not a constant, finding in loadMap\n";
    Instruction *op_i = dyn_cast<Instruction>(binOp->getOperand(0));
    if(loadMap.count(op_i) != 0){
      errs()<<"found in loadMap:"<<"\n";
      Value *op_0 = loadMap.at(op_i);
      b_op_0 = new BitCastInst(op_0, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    }
    else 
      errs()<<"Error:\n";
  }
  if (isa<ConstantFP>(binOp->getOperand(1))) {
    errs()<<"handleOp op1 is a constant\n";
    if(fpConstant_op1->getTypeID() == Type::FloatTyID)
      b_op_1 = new BitCastInst(binOp->getOperand(1), Type::getFloatTy(M->getContext()),"", I);
    else if(fpConstant_op1->getTypeID() == Type::DoubleTyID)
      b_op_1 = new BitCastInst(binOp->getOperand(1), Type::getDoubleTy(M->getContext()),"", I);
    op_1_cons = true;
  } 
  else {
    errs()<<"handleOp op1 is not a constant, finding in loadMap\n";
    Instruction *op_i = dyn_cast<Instruction>(binOp->getOperand(1));
    if(loadMap.count(op_i) != 0){
      errs()<<"found in loadMap:"<<"\n";
      Value *op_1 = loadMap.at(op_i);
      b_op_1 = new BitCastInst(op_1, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    }
    else 
      errs()<<"Error:\n";
  }
    Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
    Type* float_ty = Type::getFloatTy(M->getContext());
    Type* double_ty = Type::getDoubleTy(M->getContext());
  if(op_0_cons && op_1_cons){
    if (fpConstant_op0->getTypeID() == Type::FloatTyID && fpConstant_op1->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_4_ff", void_ptr_ty, int_ty, float_ty, float_ty);
    else if (fpConstant_op0->getTypeID() == Type::FloatTyID && fpConstant_op1->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_4_fd", void_ptr_ty, int_ty, float_ty, double_ty);
    else if (fpConstant_op0->getTypeID() == Type::DoubleTyID && fpConstant_op1->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_4_df", void_ptr_ty, int_ty, double_ty, float_ty);
    else if (fpConstant_op0->getTypeID() == Type::DoubleTyID && fpConstant_op1->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_4_dd", void_ptr_ty, int_ty, double_ty, double_ty);
  }
  else if(op_0_cons){
    errs()<<"op 0\n";
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_2_f", void_ptr_ty, int_ty, float_ty, void_ptr_ty);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_2_d", void_ptr_ty, int_ty, double_ty, void_ptr_ty);
    else
      errs()<<"Unknown Type\n";
  }else if(op_1_cons){
    if(fpConstant_op1->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_3_f", void_ptr_ty, int_ty, void_ptr_ty, float_ty);
    else if(fpConstant_op1->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_3_d", void_ptr_ty, int_ty, void_ptr_ty, double_ty);
  }
  else{
    HandleOp = M->getOrInsertFunction("handleOp_1", void_ptr_ty, int_ty, void_ptr_ty, void_ptr_ty);
  }
  Instruction* newI = IRB.CreateCall(HandleOp, {opCode, b_op_0, b_op_1});
  
  Value *Addr = dyn_cast<Value>(newI);
  loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
  errs()<<"handleOp loadMap insert:"<<*Addr<<":"<<*I<<"\n";
/*
  Type* type = v1->getType();
  if (PointerType* pointerType = dyn_cast<PointerType>(type)) {
    errs()<<"pointer\n";
  }
  else{
    Instruction* newI = IRB.CreateCall(HandleOp, {bitcast, bitcast1});
    //push addr of mpfr val in list
    errs()<<"insert in varMap\n";
    Value* oldI = dyn_cast<Value>(UR);
    errs()<<*oldI<<":"<<*newI<<"\n";
    varMap.insert(std::pair<Value*, Instruction*>(oldI, newI)); //old instruction, new instruction
  }
*/
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
 

bool FPInstrument::trace(User *it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment){
  errs()<<"trace:"<<*it<<"\n";
  if (LoadInst *inst = dyn_cast<LoadInst>(it)) {
      errs()<<"load\n";
      return traceLoad(*inst, newTarget, oldTarget, newType, oldType, alignment);
  } else if(StoreInst *inst = dyn_cast<StoreInst>(it)) {
      errs()<<"store\n";
      return traceStore(*inst, newTarget, oldTarget, newType, oldType, alignment);
  } else if(BitCastInst *inst = dyn_cast<BitCastInst>(it)) {
      return traceBitCast(*inst, newTarget, oldTarget, newType, oldType, alignment);
  } else if(GetElementPtrInst *inst = dyn_cast<GetElementPtrInst>(it)) {
      errs()<<"getelement\n";
      return traceGetElement(*inst, newTarget, oldTarget, newType, oldType, alignment);
  } else if(CallInst *inst = dyn_cast<CallInst>(it)) {
      errs()<<"callinst\n";
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
static const RegisterPass<FPInstrument> Y("fp", "instrument fp operations", false, false);
