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
5. Branch conditions
*/
bool ret = true;
LLVMContext *C;  
bool FPInstrument::runOnModule(Module &M) {
 
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
     SetVector<Value*> F_pointers;
      size_t count = 0;
      for (Function::arg_iterator ait = F->arg_begin(), aend = F->arg_end();
                ait != aend; ++ait) {
        Argument *A = &*ait;
        //if (!A->getType()->isPointerTy()) {
          argMap.insert(std::pair<Argument*, size_t>(A, count));
          count++;
        //}
      } 
    }
  for (Function *F : reverse(AllFuncList)) {
  }
  for (Function *F : reverse(AllFuncList)) {
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (PHINode *PN = dyn_cast<PHINode>(&I)) {
//        handlePhi(&I, PN, *F);
          errs()<<"Added phi node to a list"<<I<<"\n";
          PhiList.push_back(&I); 
        }
      }
    } 
    if(PhiList.size() > 0)
      handlePhi(*F);
    for (auto &BB : *F) {
      for (auto &I : BB) {
       if (LoadInst *Load = dyn_cast<LoadInst>(&I)){
          Value *Addr = Load->getPointerOperand();
          errs()<<"loadMap insert:"<<*Addr<<":"<<I<<"\n";
          loadMap.insert(std::pair<Instruction*, Value*>(&I, Addr)); //we maintain list of variables mapped to instructions,
                                                                     //can say that its like mapping temporaries
       }
       else if (FPTruncInst *fp = dyn_cast<FPTruncInst>(&I)){ // it means we have new fp
          //Value *Addr = Store->getPointerOperand();
          //we don't have to stop real computation if fptruc cast from double to float
          //if cast if from double to float then we need to find corresponding real value of double 
          //and save it in loadMap, so whereever cast is used we will use corresponding real
          
          Instruction *op0_i = dyn_cast<Instruction>(I.getOperand(0));
          if(loadMap.count(op0_i) != 0){
            Value *realI = loadMap.at(op0_i);
            loadMap.insert(std::pair<Instruction*, Value*>(&I, realI)); 
          } 
       }
       else if (StoreInst *Store = dyn_cast<StoreInst>(&I)){
          Value *Addr = Store->getPointerOperand();
          setReal(&I, Addr, Store->getOperand(0), *F); //For every store we set real value in shadowmap
       }
       else if (SIToFPInst *Sitofp = dyn_cast<SIToFPInst>(&I)){ // it means we have new fp
          //Value *Addr = Store->getPointerOperand();
          setRealCastIToD(&I, Sitofp->getOperand(0), *F); //For every store we set real value in shadowmap
       }
       else if (FPExtInst *ext = dyn_cast<FPExtInst>(&I)){ // it means we have new fp
          //Value *Addr = Store->getPointerOperand();
          setRealCastFToD(&I, ext->getOperand(0), *F); //For every store we set real value in shadowmap
       }
       else if (BinaryOperator* binOp = dyn_cast<BinaryOperator>(&I)){
          switch(binOp->getOpcode()) {
            case Instruction::FAdd:                                                                        
            case Instruction::FSub:
            case Instruction::FMul:
            case Instruction::FDiv:{
              handleOp(&I, binOp, *F);
            }  // we handle binary operations on fp
          }
       }
       else if (CallInst *callInst = dyn_cast<CallInst>(&I)){ //handle math library functions
          Function *callee = callInst->getCalledFunction();
          if (callee) {
            string name = callee->getName();
            //TODO: do not call runtime for math functions for int
            if(name == "sqrt") 
              handleMathFunc(&I, callInst, *F);  //we handle math functions for fp
            else {
              handleFunc(&I, callInst, *F); // handle other functions in app
            }
          }
      }


      }
    }
    handleNewPhi(*F);
  loadMap.clear();
  F->dump(); 
  }
  return true;
}

bool FPInstrument::instrumentFunctions(StringRef fn_name) {
  std::ifstream infile("functions.txt");
  std::string line;
  while (std::getline(infile, line)) {
    if(fn_name.find(line) != StringRef::npos){
      return true;
    }
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

void FPInstrument::setRealCastFToD(Instruction *I, Value *op0, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  errs()<<"setRealCast Instruction :"<<*I<<"\n";
  errs()<<"setRealCast op0:"<<*op0<<"\n";
  Type *op0_type = op0->getType();
  errs()<<"setRealCast: op0_type->getTypeID():"<<op0_type->getTypeID()<<"\n";
  Type* voidTy = Type::getVoidTy(M->getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type* double_ty = Type::getDoubleTy(M->getContext());
  Type* int_ty = Type::getInt32Ty(M->getContext());
//  Value *op0_i = dyn_cast<Value>(I->getOperand(0));
  Instruction *op0_i = dyn_cast<Instruction>(I->getOperand(0));
  if(loadMap.count(op0_i) != 0){
    errs()<<"setRealCast: found in loadMap:"<<"\n";
    Value *realI = loadMap.at(op0_i);
    errs()<<"setRealCast: realI:"<<*realI<<"\n";
   // SetRealCastFToD = M->getOrInsertFunction("setRealCastFToD", voidTy, void_ptr_ty, float_ty);
   // BitCastInst* bitcast1 = new BitCastInst(realI, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  //  Instruction* newI = IRB.CreateCall(SetRealCastFToD, {bitcast1, op0});
    loadMap.insert(std::pair<Instruction*, Value*>(I, realI)); //we maintain list of variables mapped to instructions,
  } 
  else{
    errs()<<"setRealCast: not found in loadMap";
  }
  
}
void FPInstrument::setRealCastIToD(Instruction *I, Value *op0, Function &F){
  //Type cast from int to double always changes interger to integer.0, I am doing this in runtime.
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  errs()<<"setRealCast Instruction :"<<*I<<"\n";
  errs()<<"setRealCast op0:"<<*op0<<"\n";
  Type *op0_type = op0->getType();
  errs()<<"setRealCast: op0_type->getTypeID():"<<op0_type->getTypeID()<<"\n";
  Type* voidTy = Type::getVoidTy(M->getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type* double_ty = Type::getDoubleTy(M->getContext());
  Type* int_ty = Type::getInt64Ty(M->getContext());
//  Value *op0_i = dyn_cast<Value>(I->getOperand(0));
  Instruction *op0_i = dyn_cast<Instruction>(I->getOperand(0));
  if(loadMap.count(op0_i) != 0){
    errs()<<"setRealCast: found in loadMap:"<<"\n";
    Value *realI = loadMap.at(op0_i);
    errs()<<"setRealCast: realI:"<<*realI<<"\n";
    SetRealCastIToD = M->getOrInsertFunction("setRealCastIToD", voidTy, void_ptr_ty, int_ty);
    BitCastInst* bitcast1 = new BitCastInst(realI, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    Instruction* newI = IRB.CreateCall(SetRealCastIToD, {bitcast1, op0});
    loadMap.insert(std::pair<Instruction*, Value*>(I, realI)); //we maintain list of variables mapped to instructions,
  } 
  else{
    errs()<<"setRealCast: not found in loadMap";
  }
  
}

void FPInstrument::setReal(Instruction *I, Value *Addr, Value *op0, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  errs()<<"setReal Instruction :"<<*I<<"\n";
  errs()<<"setReal Addr:"<<*Addr<<"\n";
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type *op0_type = op0->getType();
  BitCastInst* bitcast = new BitCastInst(Addr,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);

  Type* int_ty = Type::getInt32Ty(M->getContext());
  Type* voidTy = Type::getVoidTy(M->getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type* double_ty = Type::getDoubleTy(M->getContext());
  errs()<<"setReal: op0_type->getTypeID():"<<op0_type->getTypeID()<<"\n";
  if(op0_type->getTypeID() == Type::PointerTyID){
    Value *op0_i = dyn_cast<Value>(I->getOperand(0));
    SetRealTemp = M->getOrInsertFunction("setRealTemp", voidTy, void_ptr_ty, void_ptr_ty);
    errs()<<"op0_type->getTypeID():"<<op0_type->getTypeID()<<"\n";                                                              
    //if its not a constant, not a temp, then it could be a pointer, 
    //since we already have address of variable inside pointer, we will pass it to runtime 
    BitCastInst* bitcast1 = new BitCastInst(op0,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    Instruction* newI = IRB.CreateCall(SetRealTemp, {bitcast, bitcast1});
  }else if(isa<Argument>(op0) && (argMap.count(dyn_cast<Argument>(op0)) != 0)){
    size_t index =  argMap.at(dyn_cast<Argument>(op0));
    errs()<<"setReal: index:"<<index<<"\n";
    errs()<<"setReal: funarg\n";
    Argument *arg0 = dyn_cast<Argument>(op0);
    errs()<<"setReal: arg"<<*arg0<<"\n";
    errs()<<"setReal: arg no"<<arg0->getArgNo()<<"\n";
    Instruction *op0_i = dyn_cast<Instruction>(I->getOperand(0));
    SetRealFunArg = M->getOrInsertFunction("setRealFunArg", voidTy, int_ty, void_ptr_ty, void_ptr_ty);
    BitCastInst* bitcast1 = new BitCastInst(&F,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    Constant* argNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), index);
    Instruction* newI = IRB.CreateCall(SetRealFunArg, {argNo, bitcast1, bitcast});
  }
  else if (isa<ConstantFP>(op0)) {
    //if its constant we don't need to look for its address, we need to create new shadow space for this constant
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
    //if its not a constant, then it could be temp, temp mapping is stored in loadMap
    Instruction *op0_i = dyn_cast<Instruction>(I->getOperand(0));
    SetRealTemp = M->getOrInsertFunction("setRealTemp", voidTy, void_ptr_ty, void_ptr_ty);
    if(loadMap.count(op0_i) != 0){
      errs()<<"setReal:found in loadMap:"<<"\n";
      Value *realI = loadMap.at(op0_i);
      BitCastInst* bitcast1 = new BitCastInst(realI,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      Instruction* newI = IRB.CreateCall(SetRealTemp, {bitcast, bitcast1});
    } 
    else{
        errs()<<"setReal: not a pointer, not a constant, not in load map, means its loaded from func arg";
        //it means that ita variables passed through call by val, address of this valiable is stored in 
        //funArg with the address of a called function 
        //TODO look for better way to check if its arg passed by value
    }
  }
}


void FPInstrument::handleFunc(Instruction *I, CallInst *call, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Function *Callee = call->getCalledFunction();
  
  if (!instrumentFunctions(Callee->getName())) return;

  errs()<<"handleFunc:"<<Callee->getName()<<"\n";
  //TODO: get number of arguments
  errs()<<"handleFunc:"<<call->getNumArgOperands()<<"\n";
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Type* voidTy = Type::getVoidTy(M->getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  size_t numOperands = call->getNumArgOperands();
  Value *op[numOperands];
  Type *op_ty[numOperands];
  for(int i = 0; i<numOperands; i++){
    op[i] = call->getArgOperand(i);
    op_ty[i] = op[i]->getType(); // this should be of float

    errs()<<"handleFunc:"<<*I<<"\n";
    errs()<<"handleFunc callI:"<<*call<<"\n";
    errs()<<"handleFunc op:"<<i<<" "<<*op[i]<<"\n";
    errs()<<"handleFunc op:"<<i<<"type:"<<*op_ty[i]<<"\n";

    if (isa<ConstantFP>(op[i])){
    }
    else if(op_ty[i]->getTypeID() != Type::PointerTyID){
      Instruction *op_i = dyn_cast<Instruction>(op[i]);
      if(loadMap.count(op_i) != 0){
        errs()<<"handleFunc found in loadMap:"<<"\n";
        Value *op_1 = loadMap.at(op_i);
        BitCastInst *bitcast = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
        BitCastInst* bitcast1 = new BitCastInst(op_1,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
        errs()<<"handleFunc bitcast1:"<<bitcast1<<"\n";
        Constant* argNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), i);
        AddFunArg = M->getOrInsertFunction("addFunArg", voidTy, int_ty, void_ptr_ty, void_ptr_ty);
        Instruction* newI = IRB.CreateCall(AddFunArg, {argNo, bitcast, bitcast1});
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
    errs()<<"handleMathFunc func name:"<<name<<"\n";
    errs()<<"handleMathFunc operand name:"<<*op0<<"\n";
    //Assuming operand is a temp
    if (isa<ConstantFP>(op0)) { 
        if(op0_type->getTypeID() == Type::FloatTyID){
          b_op_0 = new BitCastInst(op0, Type::getFloatTy(M->getContext()),"", I);
          HandleFunc = M->getOrInsertFunction("handleMathFunc", void_ptr_ty, int_ty, float_ty);
          Instruction* newI = IRB.CreateCall(HandleFunc, {funcCode, b_op_0});
          Value *Addr = dyn_cast<Value>(newI);
          loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
          errs()<<"handleMathFunc loadMap insert:"<<*Addr<<":"<<*I<<"\n";
        }
        else if(op0_type->getTypeID() == Type::DoubleTyID){
          b_op_0 = new BitCastInst(op0, Type::getDoubleTy(M->getContext()),"", I);
          HandleFunc = M->getOrInsertFunction("handleMathFunc", void_ptr_ty, int_ty, double_ty);
          Instruction* newI = IRB.CreateCall(HandleFunc, {funcCode, b_op_0});
          Value *Addr = dyn_cast<Value>(newI);
          loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
          errs()<<"handleMathFunc loadMap insert:"<<*Addr<<":"<<*I<<"\n";
        }
        else
          errs()<<"handleMathFunc: Error!!! Unknown type\n";
    }
    else{
      errs()<<"handleMathFunc op0 is not a constant, finding in loadMap\n";
      Instruction *op_i = dyn_cast<Instruction>(op0);
      if(loadMap.count(op_i) != 0){
        errs()<<"handleMathFunc found in loadMap:"<<"\n";
        Value *op_1 = loadMap.at(op_i);
        b_op_0 = new BitCastInst(op_1, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
        HandleFunc = M->getOrInsertFunction("handleMathFunc", void_ptr_ty, int_ty, void_ptr_ty);
        Instruction* newI = IRB.CreateCall(HandleFunc, {funcCode, b_op_0});
        Value *Addr = dyn_cast<Value>(newI);
        loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
        errs()<<"handleMathFunc loadMap insert:"<<*Addr<<":"<<*I<<"\n";
      }
      else{
        errs()<<("handleMathFunc Not found in loadMap\n");
      }
    }
  }
}

void FPInstrument::handleNewPhi(Function &F){
  Module *M = F.getParent();
  Type* double_ty = Type::getDoubleTy(M->getContext());
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  for(auto it = newPhiMap.begin(); it != newPhiMap.end(); ++it)
  {
    errs()<<"handleNewPhi called:"<<"\n";
    Instruction* oldPhi = it->first;
    Instruction* newPhi = it->second;

    PHINode *PN = dyn_cast<PHINode>(oldPhi);
    PHINode* iPHI = dyn_cast<PHINode>(newPhi);

    for (unsigned PI = 0, PE = PN->getNumIncomingValues(); PI != PE; ++PI) {
      BasicBlock *IBB = PN->getIncomingBlock(PI);
      Value *IncValue = PN->getIncomingValue(PI);  
      if (IncValue == PN) continue; //TODO
      errs()<<"handleNewPhi IncValue"<<*IncValue<<"\n"; 
      Instruction* IValue = dyn_cast<Instruction>(IncValue);  
      if(regIdMap.count(IValue) != 0){ //handling registers
        errs()<<"handleNewPhi found in reg map\n";
        Instruction* ins = regIdMap.at(IValue);
        iPHI->addIncoming(ins, IBB);
      }
      if (isa<ConstantFP>(IncValue)) {
        iPHI->addIncoming(IncValue, IBB);
      } 
    }
  }
 
}
//we will cretahandleOpe new phi nodes which will have operands as corresponding real val
//void FPInstrument::handlePhi(Instruction *I, PHINode *PN, Function &F){
void FPInstrument::handlePhi(Function &F){
  Module *M = F.getParent();
  Type* double_ty = Type::getDoubleTy(M->getContext());
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  for (Instruction *I : reverse(PhiList)) {
  IRBuilder<> IRB(I);
  PHINode *PN = dyn_cast<PHINode>(I);
  errs()<<"handlePhi called:"<<*I<<"\n";
  Type *phi_type = PN->getType();
  if(phi_type->getTypeID() != Type::DoubleTyID){
    continue;
  }
  PHINode* iPHI = IRB.CreatePHI (double_ty, 2);
  regIdMap.insert(std::pair<Instruction*, Instruction*>(PN, iPHI)); 
  newPhiMap.insert(std::pair<Instruction*, Instruction*>(I, iPHI)); 

/*
  for (unsigned PI = 0, PE = PN->getNumIncomingValues(); PI != PE; ++PI) {
    BasicBlock *IBB = PN->getIncomingBlock(PI);
    Value *IncValue = PN->getIncomingValue(PI);  
    if (IncValue == PN) continue; //TODO

    if(PHINode *incValue1 = dyn_cast<PHINode>(IncValue)){ //if its phi node
      errs()<<"handlePhi calling recursive handlePhi\n";
      handlePhi(F);
    }
    else if (BinaryOperator* binOp = dyn_cast<BinaryOperator>(IncValue)){
      switch(binOp->getOpcode()) {
            case Instruction::FAdd:                                                                        
            case Instruction::FSub:
            case Instruction::FMul:
            case Instruction::FDiv:
            case Instruction::FRem:{
              Instruction *IV = dyn_cast<Instruction>(IncValue); 
              Instruction* ins = NULL;
              handleOpReg(&ins, IV, binOp, F);
              iPHI->addIncoming(ins, IBB);
            }  // we handle binary operations on fp
      }
    }
    if (isa<ConstantFP>(IncValue)) {
  //  SetRealReg = M->getOrInsertFunction("setRealReg", int_ty, double_ty);
 //   BitCastInst *b_op1 = new BitCastInst(IncValue, Type::getDoubleTy(M->getContext()),"", I); //TODO check type
//    Instruction* newI = IRB.CreateCall(SetRealReg, {b_op1});
      iPHI->addIncoming(IncValue, IBB);
    } 
  }
*/

 // }        // Allow self-referencing phi-nodes.
  }
 
}

Value* FPInstrument::handleRegOperand(Instruction *I, Value* operand, Function &F){
  errs()<<"handleRegOperand called\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type *fpConstant_op0 = operand->getType();
  Type* double_ty = Type::getDoubleTy(M->getContext());
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Instruction *index = NULL;
  Instruction *op_i = dyn_cast<Instruction>(operand);
  if(regIdMap.count(op_i) != 0){ //handling registers
      index = regIdMap.at(op_i);
//      b_op = new BitCastInst(id, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  }
  else{
    SetRealReg = M->getOrInsertFunction("setRealReg", int_ty, double_ty);
    BitCastInst *b_op1 = new BitCastInst(operand, Type::getDoubleTy(M->getContext()),"", I); //TODO check type
    Instruction* newI = IRB.CreateCall(SetRealReg, {b_op1});
    //index = dyn_cast<Value>(newI); 
    //regIdMap.insert(std::pair<Instruction*, Value*>(op_i, index)); 
//      b_op = new BitCastInst(index, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
           
  }
  return index;
}

BitCastInst* FPInstrument::handleOperand(Instruction **index, Instruction *I, Value* operand, Function &F, 
                                        bool *consFlag, bool *regFlag){
  errs()<<"handleOperand called\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  BitCastInst* b_op = NULL;
  BitCastInst* b_op1 = NULL;
  Type *fpConstant_op0 = operand->getType();
  Type* double_ty = Type::getDoubleTy(M->getContext());
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type* int_ty = Type::getInt32Ty(M->getContext());

  if (isa<ConstantFP>(operand)) {
    errs()<<"handleOperand op is a constant\n";
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      b_op = new BitCastInst(operand, Type::getFloatTy(M->getContext()),"", I);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      b_op = new BitCastInst(operand, Type::getDoubleTy(M->getContext()),"", I);
    *consFlag = true;
  } 
  else {
    errs()<<"handleOperand op is not a constant, finding in loadMap\n";
    Instruction *op_i = dyn_cast<Instruction>(operand);
    if(loadMap.count(op_i) != 0){
      errs()<<"found in loadMap:"<<"\n";
      Value *op_0 = loadMap.at(op_i);
      b_op = new BitCastInst(op_0, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    }
    else if(regIdMap.count(op_i) != 0){ //handling registers
      errs()<<"found in RegMap:"<<"\n";
      *index = regIdMap.at(op_i);
      *regFlag = true;
    }
  }
  return b_op;
}

BitCastInst* FPInstrument::handleOperandReg(Instruction *I, Value* operand, Function &F, Instruction** index){
  errs()<<"handleOperandReg called"<<*operand<<"\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  BitCastInst* b_op = NULL;
  BitCastInst* b_op1 = NULL;
  Type *fpConstant_op0 = operand->getType();
  Type* double_ty = Type::getDoubleTy(M->getContext());
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Type* float_ty = Type::getFloatTy(M->getContext());
  Instruction *op_i1 = dyn_cast<Instruction>(operand);

  if (isa<ConstantFP>(operand)) {
    errs()<<"handleOperandReg op is a constant\n";
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      b_op = new BitCastInst(operand, Type::getFloatTy(M->getContext()),"", I);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      b_op = new BitCastInst(operand, Type::getDoubleTy(M->getContext()),"", I);
  }
  else if (BinaryOperator* binOp1 = dyn_cast<BinaryOperator>(operand)){
    errs()<<"handleOperandReg op is binary operation\n";
    Instruction* ins = NULL;
    handleOpReg(&ins, op_i1, binOp1, F);
  }
  else if(regIdMap.count(op_i1) != 0){ //if operand 1 is reg
    errs()<<"handleOperandReg op is a phi node\n";
    *index = regIdMap.at(op_i1);
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rf", double_ty, int_ty, double_ty, float_ty);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rd", double_ty, int_ty, double_ty, double_ty);
//    b_op = new BitCastInst(index, Type::getDoubleTy(M->getContext()),"", I);
  //  return index;
  }
  else
    errs()<<"handleOperandReg Error!!! operand not found\n";
  return b_op;
}

void FPInstrument::handleOpReg(Instruction **newI, Instruction *I, BinaryOperator* binOp, Function &F){
  errs()<<"handleOpReg called:"<<*I<<"\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Constant* opCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), binOp->getOpcode());

  Instruction *op_i1 = dyn_cast<Instruction>(binOp->getOperand(0));
  Instruction *op_i2 = dyn_cast<Instruction>(binOp->getOperand(1));

  BitCastInst* b_op_0 = NULL;                                                                                                     
  BitCastInst* b_op_1 = NULL;
  bool op_0_cons = false;
  bool op_1_cons = false;
  Instruction* index = NULL;

  Type *fpConstant_op0 = binOp->getOperand(0)->getType();
  Type *fpConstant_op1 = binOp->getOperand(1)->getType();
  Constant* regIndex = NULL;
  BitCastInst* b_op = NULL;
  BitCastInst* b_op1 = NULL;

    //if its not found in loadMap, it means its register var
    //first we will insert this var in regIdMap by giving it a unique id
    //then we will set its value in runtime
  Value *index0 = NULL;
  Value *index1 = NULL;
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type* double_ty = Type::getDoubleTy(M->getContext());
  
  b_op_0 = handleOperandReg(I, binOp->getOperand(0), F, &index);
  b_op_1 = handleOperandReg(I, binOp->getOperand(1), F, &index);

  //F.dump();
  errs()<<"b_op_0:"<<b_op_0<<"\n";
  errs()<<"b_op_1:"<<b_op_1<<"\n";
  if(index != NULL){
    if(b_op_1 != NULL)
      *newI = IRB.CreateCall(HandleOp, {opCode, index, b_op_1});
    else if (b_op_0 != NULL)
      *newI = IRB.CreateCall(HandleOp, {opCode, index, b_op_0});
  }
  //F.dump();
}

#if 0
Instruction* FPInstrument::handleOpReg(Instruction *I, BinaryOperator* binOp, Function &F){
  errs()<<"handleOp called:"<<*I<<"\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Constant* opCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), binOp->getOpcode());

  Type *fpConstant_op0 = binOp->getOperand(0)->getType();
  Type *fpConstant_op1 = binOp->getOperand(1)->getType();
  errs()<<"op0 id:"<<fpConstant_op0->getTypeID()<<"\n"; 
  errs()<<"op1 id:"<<fpConstant_op1->getTypeID()<<"\n"; 

  Constant* regIndex = NULL;
  Instruction* newI = NULL;
  BitCastInst* b_op = NULL;
  BitCastInst* b_op_1 = NULL;
  bool op_0_cons = false;
  bool op_1_cons = false;

    //if its not found in loadMap, it means its register var
    //first we will insert this var in regIdMap by giving it a unique id
    //then we will set its value in runtime
  Value *index0 = NULL;
  Value *index1 = NULL;
  errs()<<"binOp->getOperand(0):"<<binOp->getOperand(0)<<"\n";
  errs()<<"binOp->getOperand(1):"<<binOp->getOperand(1)<<"\n";
  
  if (isa<ConstantFP>(binOp->getOperand(0))) {
    errs()<<"handleOpReg op is a constant\n";
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      b_op = new BitCastInst(binOp->getOperand(0), Type::getFloatTy(M->getContext()),"", I);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      b_op = new BitCastInst(binOp->getOperand(0), Type::getDoubleTy(M->getContext()),"", I);
  }else
    index0 = handleRegOperand(I, binOp->getOperand(0), F);
  
  if (isa<ConstantFP>(binOp->getOperand(1))) {
    errs()<<"handleOpReg op is a constant\n";
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      b_op = new BitCastInst(binOp->getOperand(1), Type::getFloatTy(M->getContext()),"", I);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      b_op = new BitCastInst(binOp->getOperand(1), Type::getDoubleTy(M->getContext()),"", I);
  }else
    index1 = handleRegOperand(I, binOp->getOperand(1), F);

  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type* double_ty = Type::getDoubleTy(M->getContext());

  if(index0 != NULL && index1 != NULL){ //if operand 1 is reg
    errs()<<"op 1 is reg and op0 is reg\n";
    if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rr", double_ty, int_ty, int_ty, double_ty);
    //to get index for this register we need to call runtime
      BitCastInst* bitcast1 = new BitCastInst(index0, Type::getInt32Ty(M->getContext()),"", I);
      BitCastInst* bitcast2 = new BitCastInst(index1, Type::getInt32Ty(M->getContext()),"", I);
    newI = IRB.CreateCall(HandleOp, {opCode, bitcast1, bitcast2});

 //   Value *index = dyn_cast<Value>(newI); 
//    regIdMap.insert(std::pair<Instruction*, Value*>(I, index)); 
//    errs()<<"handleOp regIdMap insert:"<<*newI<<":"<<*I<<"\n";
     
  }
  else if(index0 != NULL){ //if operand 1 is reg
    errs()<<"op 0 is reg and op1 is constant\n";
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rf", double_ty, int_ty, int_ty, float_ty);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rd", double_ty, int_ty, int_ty, double_ty);
//    BitCastInst* bitcast = new BitCastInst(index0,PointerType::getUnqual(Type::getInt32Ty(M->getContext())),"", I);
      BitCastInst* bitcast = new BitCastInst(index0, Type::getInt32Ty(M->getContext()),"", I);
    newI = IRB.CreateCall(HandleOp, {opCode, bitcast, b_op});
  }
  else if(index1 != NULL){ //if operand 1 is reg
    errs()<<"op 0 is constant and op1 is reg\n";
    if(fpConstant_op0->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rf", double_ty, int_ty, int_ty, float_ty);
    else if(fpConstant_op0->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rd", double_ty, int_ty, int_ty, double_ty);
      BitCastInst* bitcast = new BitCastInst(index1, Type::getInt32Ty(M->getContext()),"", I);
    newI = IRB.CreateCall(HandleOp, {opCode, bitcast, b_op});
//    Instruction* newI = IRB.CreateCall(HandleOp, {opCode, index, b_op});
  }
  else
    errs()<<"handleOp Error!!! operand not found\n";
  return newI;
}
#endif

void FPInstrument::handleOp(Instruction *I, BinaryOperator* binOp, Function &F){
  errs()<<"handleOp called:"<<*I<<"\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type* int_ty = Type::getInt32Ty(M->getContext());
  Constant* opCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), binOp->getOpcode());

  Type *fpConstant_op0 = binOp->getOperand(0)->getType();
  Type *fpConstant_op1 = binOp->getOperand(1)->getType();

  Constant* regIndex = NULL;

  BitCastInst* b_op_0 = NULL;
  BitCastInst* b_op_1 = NULL;
  bool op_0_cons = false;
  bool op_1_cons = false;
  bool regFlag0 = false;
  bool regFlag1 = false;

    //if its not found in loadMap, it means its register var
    //first we will insert this var in regIdMap by giving it a unique id
    //then we will set its value in runtime
  Instruction *index0 = NULL; 
  Instruction *index1 = NULL; 
  b_op_0 = handleOperand(&index0, I, binOp->getOperand(0), F, &op_0_cons, &regFlag0);
  b_op_1 = handleOperand(&index1, I, binOp->getOperand(1), F, &op_1_cons, &regFlag1);

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
  else if(regFlag0 && regFlag1){
    errs()<<"op0 and op1 are reg\n";
    HandleOp = M->getOrInsertFunction("handleOp_rd", double_ty, int_ty, double_ty, double_ty);
  }
  else if(op_1_cons && regFlag0){
    errs()<<"op0 is reg and op1 is cons\n";
    if(fpConstant_op1->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rf", double_ty, int_ty, double_ty, float_ty);
    else if(fpConstant_op1->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rd", double_ty, int_ty, double_ty, double_ty);
  }
  else if(op_0_cons && regFlag1){
    errs()<<"op0 is cons and op1 is reg\n";
    if(fpConstant_op1->getTypeID() == Type::FloatTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rf", double_ty, int_ty, double_ty, float_ty);
    else if(fpConstant_op1->getTypeID() == Type::DoubleTyID)
      HandleOp = M->getOrInsertFunction("handleOp_rd", double_ty, int_ty, double_ty, double_ty);
  }
  else if(op_0_cons){
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
 
  Instruction* newI;
  if(op_0_cons && regFlag1){
    if(index1 != NULL){
      newI = IRB.CreateCall(HandleOp, {opCode, index1, b_op_0});
      regIdMap.insert(std::pair<Instruction*, Instruction*>(I, newI)); 
      errs()<<"handleOp regIdMap insert:"<<*I<<":"<<*newI<<"\n";
    }
  }
  if(op_1_cons && regFlag0){
    if(index0 != NULL){
      newI = IRB.CreateCall(HandleOp, {opCode, index0, b_op_1});
      regIdMap.insert(std::pair<Instruction*, Instruction*>(I, newI)); 
      errs()<<"handleOp regIdMap insert:"<<*I<<":"<<*newI<<"\n";
    }
  }
  else if(regFlag0 && regFlag1){
    if(index0 != NULL && index1 != NULL){
      newI = IRB.CreateCall(HandleOp, {opCode, index0, index1});
      regIdMap.insert(std::pair<Instruction*, Instruction*>(I, newI)); 
      errs()<<"handleOp regIdMap insert:"<<*I<<":"<<*newI<<"\n";
    }
  }
  else if(b_op_0 != NULL && b_op_1 != NULL){
    newI = IRB.CreateCall(HandleOp, {opCode, b_op_0, b_op_1});
  
    Value *Addr = dyn_cast<Value>(newI);
    loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
    errs()<<"handleOp loadMap insert:"<<*Addr<<":"<<*I<<"\n";
  }
  else
    errs()<<"handleOp Error!!! operand not found\n";
}
bool RaceDetector::hasAnnotation(Instruction* i, Value *V, StringRef Ann, uint8_t level) {
  if (Instruction *I = dyn_cast<Instruction>(V)) {
    if (I->getOpcode() == Instruction::GetElementPtr) {
      MDNode *MD = i->getMetadata("tyann");
      if (MD) {
        MDString *MDS = cast<MDString>(MD->getOperand(0));
        if (MDS->getString().equals(Ann)) {
          return true;
        } else{
          return false;
        }
      } else{
        return false;
      }
    }

    MDNode *MD = I->getMetadata("tyann");
    if (MD) {
      MDString *MDS = cast<MDString>(MD->getOperand(0));
      if (MDS->getString().equals(Ann)) {
        ConstantAsMetadata *CAM = cast<ConstantAsMetadata>(MD->getOperand(1));
        ConstantInt *CI = cast<ConstantInt>(CAM->getValue());
        if (CI->getValue() == level) {
          return true;
        } else {
            return false;
          }
        }
      }
    } 

else if (GlobalValue *G = dyn_cast<GlobalValue>(V)) {
    MDNode *MD = i->getMetadata("tyann");
    if (MD) {
      MDString *MDS = cast<MDString>(MD->getOperand(0));
      if (MDS->getString().equals(Ann)) {
        return true;
      }
    }    
  }
    MDNode *MD = i->getMetadata("tyann");
    if (MD) {
        MDString *MDS = cast<MDString>(MD->getOperand(0));
        if (MDS->getString().equals(Ann)) {
          return true;
        }
    }
  return false;
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
