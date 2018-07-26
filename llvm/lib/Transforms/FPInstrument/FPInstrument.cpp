#include "FPInstrument.hpp"

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
 
  size_t count = 0;
  //All functions needed to be instrumented are added in AllFuncList 
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    if (F.isDeclaration()) continue;
    if (!instrumentFunctions(F.getName())) continue;
    AllFuncList.push_back(&F);
  }

  for (Function *F : AllFuncList) {
    errs()<<"********"<<F->getName()<<"*****\n";
    //All function arguments are given unique index and stored in ArgMap
    for (Function::arg_iterator ait = F->arg_begin(), aend = F->arg_end();
                ait != aend; ++ait) {
      Argument *A = &*ait;
      ArgMap.insert(std::pair<Argument*, size_t>(A, count));
      count++;
    } 
    
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if(PHINode *PN = dyn_cast<PHINode>(&I)){
          Type *phi_type = PN->getType();
          if(phi_type->getTypeID() != Type::DoubleTyID)
            continue;
          handlePhi(&I, PN, *F);
        }
      }
    } 
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (LoadInst *Load = dyn_cast<LoadInst>(&I)){
          Value *Addr = Load->getPointerOperand();
          errs()<<"LoadMap insert:"<<*Addr<<":"<<I<<"\n";
          LoadMap.insert(std::pair<Instruction*, Value*>(&I, Addr)); 
        }
        if (dyn_cast<FPTruncInst>(&I)){ // it means we have new fp
          //we don't have to stop real computation if fptruc cast from double to float
          //if cast if from double to float then we need to find corresponding real value of double 
          //and save it in LoadMap, so whereever cast is used we will use corresponding real
          
          Instruction *OpIns = dyn_cast<Instruction>(I.getOperand(0));
          if(LoadMap.count(OpIns) != 0){
            Value *realI = LoadMap.at(OpIns);
            LoadMap.insert(std::pair<Instruction*, Value*>(&I, realI)); 
          } 
       }
       else if (StoreInst *Store = dyn_cast<StoreInst>(&I)){
          Value *Addr = Store->getPointerOperand();
          setReal(&I, Addr, Store->getOperand(0), *F); //For every store we set real value in shadowmap
       }
       else if (SIToFPInst *Sitofp = dyn_cast<SIToFPInst>(&I)){ // it means we have new fp
          setRealCastIToD(&I, Sitofp->getOperand(0), *F); //For every store we set real value in shadowmap
       }
       else if (FPExtInst *ext = dyn_cast<FPExtInst>(&I)){ // it means we have new fp
          setRealCastFToD(&I, ext->getOperand(0), *F); //For every store we set real value in shadowmap
       }
       else if (BinaryOperator* BO = dyn_cast<BinaryOperator>(&I)){
          switch(BO->getOpcode()) {
            case Instruction::FAdd:                                                                        
            case Instruction::FSub:
            case Instruction::FMul:
            case Instruction::FDiv:{
              handleIns(&I, BO, *F); // give unique index to all BO instructions
              handleOp(&I, BO, *F);
            }  // we handle binary operations on fp
            case Instruction::Add:
            case Instruction::Sub:
            case Instruction::Mul:
            case Instruction::UDiv:
            case Instruction::SDiv:
            case Instruction::URem:
            case Instruction::SRem:
            case Instruction::FRem:
            case Instruction::Shl:
            case Instruction::LShr:
            case Instruction::AShr:
            case Instruction::And:
            case Instruction::Or:
            case Instruction::Xor:
            case Instruction::BinaryOpsEnd:{}
          }
       }
       else if (CallInst *CI = dyn_cast<CallInst>(&I)){ //handle math library functions
          Function *Callee = CI->getCalledFunction();
          if (Callee) {
            std::string name = Callee->getName();
            //TODO: do not call runtime for math functions for int
            if(name == "sqrt") 
              handleMathFunc(&I, CI, *F);  //we handle math functions for fp
            else if(name == "printValue") {
              createPrintFunc(&I, CI, *F);
            }
            else{
              handleFunc(&I, CI, *F); // handle other functions in app
            }
          }
        }
        if (FCmpInst *FCI = dyn_cast<FCmpInst>(&I)){
          errs()<<"fcmp\n";
          handleFcmp(&I, FCI, *F);
        }
      }
    }
    handleNewPhi(*F);
    NewPhiMap.clear(); 
    LoadMap.clear();
//  F->dump(); 
  }
  return true;
}

//take name of the function and check if it is in list of functions given by 
//developer and return true else false.
bool FPInstrument::instrumentFunctions(StringRef FN) {
  std::ifstream infile("functions.txt");
  std::string line;
  while (std::getline(infile, line)) {
    if(FN.find(line) != StringRef::npos){
      return true;
    }
  }
  return false;
}
/**
The 'store' instruction is used to write to memory.
There are two arguments to the 'store' instruction: a value to store and an address at which to store it.
We pass store instruction, Address where value is going to be stores, value which is going to be store and Function.
It checks whather value is a constant, function argument, pointer or its a temp(it can be load instruction or result
of some floating point instruction) and calls respective function at run time to store this value in shadow memory.
If value is function argument then index for shadow memory is the function address and index of the argument for all 
other cases index is the address where value is stored.
**/
void FPInstrument::setReal(Instruction *I, Value *ToAddr, Value *OP, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  errs()<<"setReal Instruction :"<<*I<<"\n";
  errs()<<"setReal ToAddr:"<<*ToAddr<<"\n";
  Type *OpTy = OP->getType();
  BitCastInst* BCToAddr = new BitCastInst(ToAddr,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);

  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  errs()<<"setReal: OpTy->getTypeID():"<<OpTy->getTypeID()<<"\n";

  if(OpTy->getTypeID() == Type::PointerTyID){
    SetRealTemp = M->getOrInsertFunction("setRealTemp", VoidTy, PtrVoidTy, PtrVoidTy);
    errs()<<"OpTy->getTypeID():"<<OpTy->getTypeID()<<"\n";                                                              
    //if its not a constant, not a temp, then it could be a pointer, 
    //since we already have address of variable inside pointer, we will pass it to runtime 
    BitCastInst* BCOp = new BitCastInst(OP,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    IRB.CreateCall(SetRealTemp, {BCToAddr, BCOp});
  }else if(isa<Argument>(OP) && (ArgMap.count(dyn_cast<Argument>(OP)) != 0)){
    size_t index =  ArgMap.at(dyn_cast<Argument>(OP));
    errs()<<"setReal: index:"<<index<<"\n";
    errs()<<"setReal: funarg\n";
    Argument *arg0 = dyn_cast<Argument>(OP);
    errs()<<"setReal: arg"<<*arg0<<"\n";
    errs()<<"setReal: arg no"<<arg0->getArgNo()<<"\n";
    SetRealFunArg = M->getOrInsertFunction("setRealFunArg", VoidTy, Int32Ty, PtrVoidTy, PtrVoidTy);
    BitCastInst* BCFunc = new BitCastInst(&F,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    Constant* argNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), index); //TODO: Remove this
    IRB.CreateCall(SetRealFunArg, {argNo, BCFunc, BCToAddr});
  }
  else if (isa<ConstantFP>(OP)) {
    //if its constant we don't need to look for its address, we need to create new shadow space for this constant
    errs()<<"setReal:OP is a constant"<<"\n";
    SetRealConstant = M->getOrInsertFunction("setRealConstant", VoidTy, PtrVoidTy, DoubleTy);
    IRB.CreateCall(SetRealConstant, {BCToAddr, OP});
  }
  else{
    //if its not a constant, then it could be temp, temp mapping is stored in LoadMap
    Instruction *OpIns = dyn_cast<Instruction>(I->getOperand(0));
    SetRealTemp = M->getOrInsertFunction("setRealTemp", VoidTy, PtrVoidTy, PtrVoidTy);
    if(LoadMap.count(OpIns) != 0){
      errs()<<"setReal:found in LoadMap:"<<"\n";
      Value *realI = LoadMap.at(OpIns);
      BitCastInst* BCAddr = new BitCastInst(realI, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      IRB.CreateCall(SetRealTemp, {BCToAddr, BCAddr});
    } 
    else{
        errs()<<"setReal: not a pointer, not a constant, not in load map and not a func arg";
        //it means that ita variables passed through call by val, address of this valiable is stored in 
        //funArg with the address of a called function 
        //TODO look for better way to check if its arg passed by value
    }
  }
}

/**
This is called for fpext. The 'fpext' instruction extends the value from a smaller 
floating point type to a larger floating point type. We need to find small fp stored 
in LoadMap and link the fpext instruction with it.
**/
void FPInstrument::setRealCastFToD(Instruction *I, Value *OP, Function &F){
  IRBuilder<> IRB(I);
  errs()<<"setRealCast Instruction :"<<*I<<"\n";
  errs()<<"setRealCast OP:"<<*OP<<"\n";
  Type *OpTy = OP->getType();
  errs()<<"setRealCast: OpTy->getTypeID():"<<OpTy->getTypeID()<<"\n";
  Instruction *OpIns = dyn_cast<Instruction>(I->getOperand(0));
  if(LoadMap.count(OpIns) != 0){
    errs()<<"setRealCast: found in LoadMap:"<<"\n";
    Value *realI = LoadMap.at(OpIns);
    errs()<<"setRealCast: realI:"<<*realI<<"\n";
    LoadMap.insert(std::pair<Instruction*, Value*>(I, realI));
  } 
  else{
    errs()<<"setRealCast: not found in LoadMap";
  }
}

//TODO: Check this later with example and write comment for it
void FPInstrument::setRealCastIToD(Instruction *I, Value *OP, Function &F){
  //Type cast from int to double always changes interger to integer.0, I am doing this in runtime.
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  errs()<<"setRealCast Instruction :"<<*I<<":OP:"<<*OP<<"\n";
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int32Ty = Type::getInt64Ty(M->getContext());
  Instruction *OpIns = dyn_cast<Instruction>(I->getOperand(0));

  if(LoadMap.count(OpIns) != 0){
    errs()<<"setRealCast: found in LoadMap:"<<"\n";
    Value *RealI = LoadMap.at(OpIns);
    errs()<<"setRealCast: RealI:"<<*RealI<<"\n";
    SetRealCastIToD = M->getOrInsertFunction("setRealCastIToD", VoidTy, PtrVoidTy, Int32Ty);
    LoadMap.insert(std::pair<Instruction*, Value*>(I, RealI)); //we maintain list of variables mapped to instructions,
  } 
  else{
    errs()<<"setRealCast: not found in LoadMap";
  }
  
}

/**
To print real value of register(temporary) we need to call runtime function with the index of
register.
**/
void FPInstrument::createPrintFunc(Instruction *I, CallInst *CI, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Function *Callee = CI->getCalledFunction();
  if (!instrumentFunctions(Callee->getName())) return;

  errs()<<"createPrintFunc:"<<Callee->getName()<<"\n";
  errs()<<"createPrintFunc:"<<CI->getNumArgOperands()<<"\n";

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* DoubleTy = Type::getDoubleTy(M->getContext()); 

  errs()<<"createPrintFunc:"<<Callee->getName()<<"\n";
  Value *op = CI->getArgOperand(0);
  Instruction* OpIns = dyn_cast<Instruction>(op);  
  if(RegIdMap.count(OpIns) != 0){ //if operand 1 is reg
    errs()<<"createPrintFunc got index";
    Instruction* index = RegIdMap.at(OpIns);
    PrintOp = M->getOrInsertFunction("printRegValue", VoidTy, DoubleTy, DoubleTy);
    IRB.CreateCall(PrintOp, {index, op});
  }
}
/**
This function is called for every call instruction to create call to run time function addFunArg.
It passes the argument number, function address and argument address to addFunArg. addFunArg stores
function address and argument number as index of argument address in a map. When called function is 
parsed it will ask this map for address of the argument using index(function address and argument number).
**/
void FPInstrument::handleFunc(Instruction *I, CallInst *CI, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Function *Callee = CI->getCalledFunction();
  if (!instrumentFunctions(Callee->getName())) return;

  errs()<<"handleFunc:"<<Callee->getName()<<"\n";
  errs()<<"handleFunc:"<<CI->getNumArgOperands()<<"\n";

  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));

  size_t NumOperands = CI->getNumArgOperands();
  Value *Op[NumOperands];
  Type *OpTy[NumOperands];
  for(size_t i = 0; i<NumOperands; i++){
    Op[i] = CI->getArgOperand(i);
    OpTy[i] = Op[i]->getType(); // this should be of float

    errs()<<"handleFunc:"<<*I<<"\n";
    errs()<<"handleFunc callI:"<<*CI<<"\n";
    errs()<<"handleFunc Op:"<<i<<" "<<*Op[i]<<"\n";
    errs()<<"handleFunc Op:"<<i<<"type:"<<*OpTy[i]<<"\n";

    if(OpTy[i]->getTypeID() != Type::PointerTyID){
      Instruction *OpIns = dyn_cast<Instruction>(Op[i]);
      if(LoadMap.count(OpIns) != 0){
        errs()<<"handleFunc found in LoadMap:"<<"\n";
        Value *OpAddr = LoadMap.at(OpIns);
        BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
        BitCastInst* BCOpAddr = new BitCastInst(OpAddr,PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);

        Constant* ArgNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), i);
        AddFunArg = M->getOrInsertFunction("addFunArg", VoidTy, Int32Ty, PtrVoidTy, PtrVoidTy);
        IRB.CreateCall(AddFunArg, {ArgNo, BCCallee, BCOpAddr});
      }
    }
  }
}

/**
This function is called for math library functions. Argument to these functions can be a constant,
temp loaded from memory, temp - result of another fp instruction, temp - register. We need to find 
address of temp loaded from memory or index for register and call runtime with the indices to perform
mpfr equivalent function.
**/
void FPInstrument::handleMathFunc(Instruction *I, CallInst *CI, Function &F){
  errs()<<"handleMathFunc called\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* DoubleTy = Type::getDoubleTy(M->getContext()); 

  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Value *OP = CI->getOperand(0);
  Constant* funcCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), 1);
  BitCastInst* BCOp;
  Function *Callee = CI->getCalledFunction();
  if (Callee) {
    std::string name = Callee->getName();
    errs()<<"handleMathFunc func name:"<<name<<"\n";
    errs()<<"handleMathFunc operand name:"<<*OP<<"\n";
    //Assuming operand is a temp
    if (isa<ConstantFP>(OP)) { 
      BCOp = new BitCastInst(OP, Type::getDoubleTy(M->getContext()),"", I);
      HandleFunc = M->getOrInsertFunction("handleMathFunc", PtrVoidTy, Int32Ty, DoubleTy);
      Instruction* NewIns = IRB.CreateCall(HandleFunc, {funcCode, BCOp});
      Value *Addr = dyn_cast<Value>(NewIns);
      LoadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
      errs()<<"handleMathFunc LoadMap insert:"<<*Addr<<":"<<*I<<"\n";
    }
    else{
      errs()<<"handleMathFunc OP is not a constant, finding in LoadMap\n";
      Instruction *OpIns = dyn_cast<Instruction>(OP);
      if(LoadMap.count(OpIns) != 0){
        errs()<<"handleMathFunc found in LoadMap:"<<"\n";
        Value *OpAddr = LoadMap.at(OpIns);
        BCOp = new BitCastInst(OpAddr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
        HandleFunc = M->getOrInsertFunction("handleMathFunc", PtrVoidTy, Int32Ty, PtrVoidTy);
        Instruction* NewIns = IRB.CreateCall(HandleFunc, {funcCode, BCOp});
        Value *Addr = dyn_cast<Value>(NewIns);
        LoadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
        errs()<<"handleMathFunc LoadMap insert:"<<*Addr<<":"<<*I<<"\n";
      }
      else{
        errs()<<("handleMathFunc Not found in LoadMap\n");
      }
    }
  }
}

/**
It handles new phi instruction created before of type size_t. If incoming value is constant then it calls
run time function setRealReg and provides index of the constant and value of the constant.
setRealReg creates the entry in shadow memory with this index and value and return index.
If incoming value is register then we find the index in RegIdMap and add it to new phi node. 
**/
void FPInstrument::handleNewPhi(Function &F){
  Module *M = F.getParent();
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Instruction* Next;
  for(auto it = NewPhiMap.begin(); it != NewPhiMap.end(); ++it)
  {
    errs()<<"handleNewPhi called:"<<"\n";
    Instruction* OldPhi = it->first;
    Instruction* NewPhi = it->second;

    PHINode *PN = dyn_cast<PHINode>(OldPhi);
    PHINode* iPHI = dyn_cast<PHINode>(NewPhi);

    for (unsigned PI = 0, PE = PN->getNumIncomingValues(); PI != PE; ++PI) {
      BasicBlock *IBB = PN->getIncomingBlock(PI);
      Value *IncValue = PN->getIncomingValue(PI);  
      if (IncValue == PN) continue; //TODO
      errs()<<"handleNewPhi IncValue"<<*IncValue<<"\n"; 
      Instruction* IValue = dyn_cast<Instruction>(IncValue);  
      if(RegIdMap.count(IValue) != 0){ //handling registers
        errs()<<"handleNewPhi found in reg map\n";
        Instruction* I = RegIdMap.at(IValue);
        iPHI->addIncoming(I, IBB);
      }
      if (isa<ConstantFP>(IncValue)) {  
        for (BasicBlock::iterator BBit = IBB->begin(), BBend = IBB->end(); 
              BBit != BBend; ++BBit) {
          Next = &*BBit;
        }
        IRBuilder<> IRB(Next);
        size_t Index;
        if(ConsMap.count(IncValue) != 0)
          Index = ConsMap.at(IncValue); // it should never fail
        else{
          Index = ConsCount++; 
          ConsMap.insert(std::pair<Value*, size_t>(IncValue, ConsCount));
        }
        errs()<<"handleNewPhi Index "<<Index<<"\n";
        Constant* consIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), Index); 
        SetRealConstant = M->getOrInsertFunction("setRealReg", Int32Ty, Int32Ty, DoubleTy);
        Instruction *NewIns = IRB.CreateCall(SetRealConstant, {consIndex, IncValue});

        iPHI->addIncoming(NewIns, IBB);
      } 
    }
    F.dump();
  }
}

/**
This create a new phi node for every phi node of type double.
**/
void FPInstrument::handlePhi(Instruction *I, PHINode *PN, Function &F){
  Module *M = F.getParent();
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  errs()<<"handlePhi:"<<*I<<"\n";
  IRBuilder<> IRB(I);
  errs()<<"handlePhi called:"<<*I<<"\n";

  PHINode* iPHI = IRB.CreatePHI (Int32Ty, 2);
  //Wherever old phi node has been used, we need to replace it with new phi node. That's
  //why need to track it and keep it in RegIdMap
  RegIdMap.insert(std::pair<Instruction*, Instruction*>(PN, iPHI)); 
  //We need mapping of old phi node with new phi node while filling new phi node later.
  NewPhiMap.insert(std::pair<Instruction*, Instruction*>(I, iPHI)); 
}

/**
It handles operands of BinOp instruction. It check whether operand is a constant or is memory
load or its a register so that we can trac index of operand.
**/
BitCastInst* FPInstrument::handleOperand(Instruction *I, Value* OP, Function &F, 
                                        bool *IsConstant, bool *IsReg){
  errs()<<"handleOperand called\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  BitCastInst* BC = NULL;

  if (isa<ConstantFP>(OP)) {
    errs()<<"handleOperand op is a constant\n";
    *IsConstant = true;
  } 
  else {
    errs()<<"handleOperand op is not a constant, finding in LoadMap\n";
    Instruction *OpIns = dyn_cast<Instruction>(OP);
    if(LoadMap.count(OpIns) != 0){
      errs()<<"found in LoadMap:"<<"\n";
      Value *OpAddr = LoadMap.at(OpIns);
      BC = new BitCastInst(OpAddr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    }
    else if(RegIdMap.count(OpIns) != 0){ //handling registers
      errs()<<"found in RegMap:"<<"\n";
      Instruction *index = RegIdMap.at(OpIns);
      BC = new BitCastInst(index, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      *IsReg = true;
    }
  }
  return BC;
}

/**
It provides unique index to all instructions.
**/
void FPInstrument::handleIns(Instruction *I, BinaryOperator* BO, Function &F){
  errs()<<"handleIns called\n";
  InsMap.insert(std::pair<Instruction*, size_t>(I, InsCount));
  InsCount++; 
}

/**
It is called for every fcmp instruction and it creates run time call to compare with respective reals.
We need four kinds of run time handlers - checkBranchCC (both arguments are constant) ,checkBranchVV (both
arguments are temp), checkBranchCV (operand 1 is constant and operand 2 is temp ).
**/
#if 1
void FPInstrument::handleFcmp(Instruction *I, FCmpInst *FCI, Function &F){

  IRBuilder<> IRB(I);
  Module *M = F.getParent();

  BitCastInst* BCI1 = NULL;
  BitCastInst* BCI2 = NULL;

  bool IsConstantOp1 = false;
  bool IsConstantOp2 = false;
  bool IsRegOp1 = false;
  bool IsRegOp2 = false;

  BCI1 = handleOperand(I, FCI->getOperand(0), F, &IsConstantOp1, &IsRegOp1);
  BCI2 = handleOperand(I, FCI->getOperand(1), F, &IsConstantOp2, &IsRegOp2);

  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  //both operands are constants, we are passing it as double value
  //No need to compare this case
  //both operands are registers, passing index 
  if(IsConstantOp1 && IsConstantOp2){
    //both operands are constants
    HandleOp = M->getOrInsertFunction("checkBranchCC", PtrVoidTy, DoubleTy, DoubleTy);
    IRB.CreateCall(HandleOp, {FCI->getOperand(0), FCI->getOperand(1)}); //passing operands without typecasting
  }
  //both operands are registers, passing index 
  else if(IsRegOp1 && IsRegOp2) {
    errs()<<"op0 and op1 are reg or memory\n";
    HandleOp = M->getOrInsertFunction("checkBranchVV", PtrVoidTy, PtrVoidTy, PtrVoidTy);
    errs()<<"handleOp RegIdMap\n";
    IRB.CreateCall(HandleOp, {BCI1, BCI2});
  }
  if(IsConstantOp1 && IsRegOp2){
    HandleOp = M->getOrInsertFunction("checkBranchCV", PtrVoidTy, DoubleTy, PtrVoidTy);
    IRB.CreateCall(HandleOp, {FCI->getOperand(0), BCI2});
  }
  if(IsRegOp1 && IsConstantOp2){
      HandleOp = M->getOrInsertFunction("checkBranchVC", PtrVoidTy, PtrVoidTy, DoubleTy);
      IRB.CreateCall(HandleOp, {BCI1, FCI->getOperand(1)});
  } //TODO: have to do something here
  else if(IsConstantOp1){
    errs()<<"handleOp LoadMap\n";
    HandleOp = M->getOrInsertFunction("checkBranchCV", PtrVoidTy, DoubleTy, PtrVoidTy);
    IRB.CreateCall(HandleOp, {FCI->getOperand(0), BCI2});
  }
  else if(IsConstantOp2){
    errs()<<"handleOp LoadMap\n";
    HandleOp = M->getOrInsertFunction("checkBranchVC", PtrVoidTy, PtrVoidTy, DoubleTy);
    IRB.CreateCall(HandleOp, {BCI1, FCI->getOperand(1)});
  }
  else if(BCI1 != NULL && BCI2 != NULL){
    errs()<<"handleOp LoadMap\n";
    HandleOp = M->getOrInsertFunction("checkBranchVV", PtrVoidTy, PtrVoidTy, PtrVoidTy);
    IRB.CreateCall(HandleOp, {BCI1, BCI2});
  }
  else
    errs()<<"handleOp Error!!! operand not found\n";
}
#endif

/**
This is called for every BinOp instruction. It tracks operands indices and call runtime with 
those indices so that equivalent operation can be performed with mpfr.
**/
void FPInstrument::handleOp(Instruction *I, BinaryOperator* BO, Function &F){
  errs()<<"handleOp called:"<<*I<<"\n";
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Constant* OpCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), BO->getOpcode());
  BitCastInst* BCI1 = NULL;
  BitCastInst* BCI2 = NULL;

  bool IsConstantOp1 = false;
  bool IsConstantOp2 = false;
  bool IsRegOp1 = false;
  bool IsRegOp2 = false;

  //get index of ins
  size_t InsIndex;
  InsIndex = InsMap.at(I);
  errs()<<"Ins index:"<<InsIndex<<"\n";
  Constant* ConsInsIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), InsIndex); 
    //if its not found in LoadMap, it means its register var
    //first we will insert this var in RegIdMap by giving it a unique id
    //then we will set its value in runtime
  Instruction *NewIns; 

    //operand 0 is loaded from memory
  BCI1 = handleOperand(I, BO->getOperand(0), F, &IsConstantOp1, &IsRegOp1);
  BCI2 = handleOperand(I, BO->getOperand(1), F, &IsConstantOp2, &IsRegOp2);


  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  //both operands are constants, we are passing it as double value
  if(IsConstantOp1 && IsConstantOp2){
    //both operands are constants
    HandleOp = M->getOrInsertFunction("computeRealCC", PtrVoidTy, Int32Ty, DoubleTy, DoubleTy, Int32Ty);
    NewIns = IRB.CreateCall(HandleOp, {OpCode, BO->getOperand(0), BO->getOperand(1), ConsInsIndex}); //passing operands without typecasting
    //have to test case when constant is of type float
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
    errs()<<"handleOp RegIdMap insert:"<<*I<<":"<<*NewIns<<"\n";
  }
  //both operands are registers, passing index 
  else if(IsRegOp1 && IsRegOp2) {
    errs()<<"op0 and op1 are reg or memory\n";
    HandleOp = M->getOrInsertFunction("computeRealVV", PtrVoidTy, Int32Ty, PtrVoidTy, PtrVoidTy, Int32Ty);
    errs()<<"handleOp RegIdMap\n";
      NewIns = IRB.CreateCall(HandleOp, {OpCode, BCI1, BCI2,  ConsInsIndex});
      RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
      errs()<<"handleOp RegIdMap insert:"<<*I<<":"<<*NewIns<<"\n";
  }
  if(IsConstantOp1 && IsRegOp2){
      HandleOp = M->getOrInsertFunction("computeRealCV", PtrVoidTy, Int32Ty, DoubleTy, PtrVoidTy, Int32Ty);
      NewIns = IRB.CreateCall(HandleOp, {OpCode, BO->getOperand(0), BCI2,  ConsInsIndex});
      RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
      errs()<<"handleOp RegIdMap insert:"<<*I<<":"<<*NewIns<<"\n";
  }
  if(IsRegOp1 && IsConstantOp2){
      HandleOp = M->getOrInsertFunction("computeRealVC", PtrVoidTy, Int32Ty, PtrVoidTy, DoubleTy, Int32Ty);
      NewIns = IRB.CreateCall(HandleOp, {OpCode, BCI1, BO->getOperand(1),  ConsInsIndex});
      RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
      errs()<<"handleOp RegIdMap insert:"<<*I<<":"<<*NewIns<<"\n";
  } //TODO: have to do something here
  else if(IsConstantOp1){
    errs()<<"handleOp LoadMap1\n";
    HandleOp = M->getOrInsertFunction("computeRealCV", PtrVoidTy, Int32Ty, DoubleTy, PtrVoidTy, Int32Ty);
    NewIns = IRB.CreateCall(HandleOp, {OpCode, BO->getOperand(0), BCI2,  ConsInsIndex});
  
    Value *Addr = dyn_cast<Value>(NewIns);
    LoadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
    errs()<<"handleOp LoadMap insert:"<<*Addr<<":"<<*I<<"\n";
  }
  else if(IsConstantOp2){
    errs()<<"handleOp LoadMap2\n";
    HandleOp = M->getOrInsertFunction("computeRealVC", PtrVoidTy, Int32Ty, PtrVoidTy, DoubleTy, Int32Ty);
    NewIns = IRB.CreateCall(HandleOp, {OpCode, BCI1, BO->getOperand(1),  ConsInsIndex});
  
    Value *Addr = dyn_cast<Value>(NewIns);
    LoadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
    errs()<<"handleOp LoadMap insert:"<<*Addr<<":"<<*I<<"\n";
  }
  else if(BCI1 != NULL && BCI2 != NULL){
    errs()<<"handleOp LoadMap3\n";
    HandleOp = M->getOrInsertFunction("computeRealVV", PtrVoidTy, Int32Ty, PtrVoidTy, PtrVoidTy, Int32Ty);
    NewIns = IRB.CreateCall(HandleOp, {OpCode, BCI1, BCI2,  ConsInsIndex});
  
    Value *Addr = dyn_cast<Value>(NewIns);
    LoadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
    errs()<<"handleOp LoadMap insert:"<<*Addr<<":"<<*I<<"\n";
  }
  else
    errs()<<"handleOp Error!!! operand not found\n";
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
