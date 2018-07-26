bool ret = true;
LLVMContext *C;  
bool FPInstrument::runOnModule(Module &M) {
 
  size_t count = 0;
  double consCount = 0;
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    if (F.isDeclaration()) continue;
    if (!instrumentFunctions(F.getName())) continue;
    StringRef funcName = F.getName();
    AllFuncList.push_back(&F);
  }

  for (Function *F : reverse(AllFuncList)) {
    errs()<<"********"<<F->getName()<<"*****\n";
    for (Function::arg_iterator ait = F->arg_begin(), aend = F->arg_end();
                ait != aend; ++ait) {
      Argument *A = &*ait;
      argMap.insert(std::pair<Argument*, size_t>(A, count));
      count++;
    } 
    
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (PHINode *PN = dyn_cast<PHINode>(&I)) {
          PhiListLast.push_back(&I); 
          PhiList.push_back(&I); 
        }
      }
    }           
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
              handleIns(&I, binOp, *F); // give unique index to all binOp instructions
              //handleConstant(&I, binOp, *F); // give unique index to all constants
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
    newPhiMap.clear(); 
    loadMap.clear();     
//  F->dump(); 
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
  Type* double_ty = Type::getDoubleTy(M->getContext()); 
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  if(Callee->getName() == "printValue"){
    errs()<<"handleFunc:"<<Callee->getName()<<"\n";
    Value *op = call->getArgOperand(0);
    Instruction* op_i = dyn_cast<Instruction>(op);  
    if(regIdMap.count(op_i) != 0){ //if operand 1 is reg
      errs()<<"handleFunc got index";
      Instruction* index = regIdMap.at(op_i);
      PrintOp = M->getOrInsertFunction("printRegValue", voidTy, double_ty, double_ty);
      Instruction * printI = IRB.CreateCall(PrintOp, {index, op});
    }
    return;
  }
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
  Type* void_ty = Type::getVoidTy(M->getContext());;
  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Instruction* next;
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
/*      if (isa<ConstantFP>(IncValue)) {  
        for (BasicBlock::iterator BBit = IBB->begin(), BBend = IBB->end(); 
              BBit != BBend; ++BBit) {
          next = &*BBit;
        }
        IRBuilder<> IRB(next);

        iPHI->addIncoming(IncValue, IBB);
      } 
*/
      if (isa<ConstantFP>(IncValue)) {  
        for (BasicBlock::iterator BBit = IBB->begin(), BBend = IBB->end(); 
              BBit != BBend; ++BBit) {
          next = &*BBit;
        }
        IRBuilder<> IRB(next);
        double cIndex;
        if(consMap.count(IncValue) != 0)
          cIndex = consMap.at(IncValue); // it should never fail
        else{
          cIndex = consCount++; 
          consMap.insert(std::pair<Value*, double>(IncValue, consCount));
        }
        errs()<<"handleNewPhi cIndex "<<cIndex<<"\n";
        Constant* consIndex = ConstantFP::get(Type::getDoubleTy(M->getContext()), cIndex); 
 SetRealConstant = M->getOrInsertFunction("setRealReg", double_ty, double_ty, double_ty);
        Instruction *newI = IRB.CreateCall(SetRealConstant, {consIndex, IncValue});

        iPHI->addIncoming(newI, IBB);
      } 

    }
        F.dump();
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
    errs()<<"handlePhi:"<<*I<<"\n";
    IRBuilder<> IRB(I);
    if(PHINode *PN = dyn_cast<PHINode>(I)){
      errs()<<"handlePhi called:"<<*I<<"\n";
      Type *phi_type = PN->getType();
      if(phi_type->getTypeID() != Type::DoubleTyID){
        continue;
      }
      PHINode* iPHI = IRB.CreatePHI (double_ty, 2);
      regIdMap.insert(std::pair<Instruction*, Instruction*>(PN, iPHI)); 
      newPhiMap.insert(std::pair<Instruction*, Instruction*>(I, iPHI)); 
    }
  }
  PhiList.clear();          
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
    
//    b_op = new BitCastInst(operand, Type::getDoubleTy(M->getContext()),"", I);
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

void FPInstrument::handleIns(Instruction *I, BinaryOperator* binOp, Function &F){
  errs()<<"handleIns called\n";
  insMap.insert(std::pair<Instruction*, double>(I, insCount));
  insCount++; 
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

  Constant* regIndex = NULL;

  BitCastInst* b_op_0 = NULL;
  BitCastInst* b_op_1 = NULL;
  bool op_0_cons = false;
  bool op_1_cons = false;
  bool regFlag0 = false;
  bool regFlag1 = false;

  //get index of ins
  double insIndex;
  insIndex = insMap.at(I);
  errs()<<"Ins index:"<<insIndex<<"\n"; 
 Constant* consInsIndex = ConstantFP::get(Type::getDoubleTy(M->getContext()), insIndex); 
    //if its not found in loadMap, it means its register var
    //first we will insert this var in regIdMap by giving it a unique id
    //then we will set its value in runtime
  Instruction *index0 = NULL; 
  Instruction *index1 = NULL; 
  Instruction *newI; 
  b_op_0 = handleOperand(&index0, I, binOp->getOperand(0), F, &op_0_cons, &regFlag0);
  b_op_1 = handleOperand(&index1, I, binOp->getOperand(1), F, &op_1_cons, &regFlag1);

  Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* float_ty = Type::getFloatTy(M->getContext());
  Type* double_ty = Type::getDoubleTy(M->getContext());
  //both operands are constants, we are passing it as double value
  if(op_0_cons && op_1_cons){
    HandleOp = M->getOrInsertFunction("handleOp_dd", void_ptr_ty, int_ty, double_ty, double_ty);
    newI = IRB.CreateCall(HandleOp, {opCode, binOp->getOperand(0), binOp->getOperand(1)}); //passing operands without typecasting
    //have to test case when constant is of type float
    regIdMap.insert(std::pair<Instruction*, Instruction*>(I, newI)); 
    errs()<<"handleOp regIdMap insert:"<<*I<<":"<<*newI<<"\n";
    errs()<<"handleOp index0:"<<*index0<<"\n";
  }
  //both operands are registers, passing index 
  else if(regFlag0 && regFlag1){
    errs()<<"op0 and op1 are reg\n";
    HandleOp = M->getOrInsertFunction("handleOp_rr", double_ty, int_ty, double_ty, double_ty, double_ty);
    errs()<<"handleOp regIdMap\n";
    errs()<<"index0:"<<*index0<<"\n";
    errs()<<"index1:"<<*index1<<"\n";
    if(index0 != NULL && index1 != NULL){
      newI = IRB.CreateCall(HandleOp, {opCode, index0, index1, consInsIndex});
      regIdMap.insert(std::pair<Instruction*, Instruction*>(I, newI)); 
      errs()<<"handleOp regIdMap insert:"<<*I<<":"<<*newI<<"\n";
 }
  }
  //operand0 is register, op1 is constant
  else if(op_1_cons && regFlag0){
    errs()<<"op0 is reg and op1 is cons\n";
    HandleOp = M->getOrInsertFunction("handleOp_rd", double_ty, int_ty, double_ty, double_ty);
    newI = IRB.CreateCall(HandleOp, {opCode, index0, binOp->getOperand(1)});
    regIdMap.insert(std::pair<Instruction*, Instruction*>(I, newI)); 
    errs()<<"handleOp regIdMap insert:"<<*I<<":"<<*newI<<"\n";
    errs()<<"handleOp index0:"<<*index0<<"\n";
  }
  //operand 0 is constant, operand 1 is register
  else if(op_0_cons && regFlag1){
    errs()<<"op0 is cons and op1 is reg\n";
    HandleOp = M->getOrInsertFunction("handleOp_dr", double_ty, int_ty, double_ty, double_ty);
    newI = IRB.CreateCall(HandleOp, {opCode, binOp->getOperand(0), index1});
    regIdMap.insert(std::pair<Instruction*, Instruction*>(I, newI)); 
    errs()<<"handleOp regIdMap insert:"<<*I<<":"<<*newI<<"\n";
  }
  //operand 0 is constant, operand 1 is memory load
  else if(op_0_cons){
    errs()<<"op0 is cons and op1 is mem\n";
    HandleOp = M->getOrInsertFunction("handleOp_2_d", void_ptr_ty, int_ty, double_ty, void_ptr_ty);
    errs()<<"handleOp loadMap1\n";
    newI = IRB.CreateCall(HandleOp, {opCode, binOp->getOperand(0), b_op_1});
  
    Value *Addr = dyn_cast<Value>(newI);
    loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
    errs()<<"handleOp loadMap insert:"<<*Addr<<":"<<*I<<"\n";
  //operand 0 is memory load, operand 1 is constant
  }else if(op_1_cons){
    errs()<<"op1 is cons and op0 is mem\n";  
HandleOp = M->getOrInsertFunction("handleOp_3_d", void_ptr_ty, int_ty, void_ptr_ty, double_ty);
    errs()<<"handleOp loadMap2\n";
    newI = IRB.CreateCall(HandleOp, {opCode, b_op_0, binOp->getOperand(1)});
  
    Value *Addr = dyn_cast<Value>(newI);
    loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
    errs()<<"handleOp loadMap insert:"<<*Addr<<":"<<*I<<"\n";
  }
  else if(b_op_0 != NULL && b_op_1 != NULL){
  //both operands are read from memory
    HandleOp = M->getOrInsertFunction("handleOp_1", void_ptr_ty, int_ty, void_ptr_ty, void_ptr_ty);
    errs()<<"handleOp loadMap3\n";
    newI = IRB.CreateCall(HandleOp, {opCode, b_op_0, b_op_1});
  
    Value *Addr = dyn_cast<Value>(newI);
    loadMap.insert(std::pair<Instruction*, Value*>(I, Addr)); //old instruction, new instruction
    errs()<<"handleOp loadMap insert:"<<*Addr<<":"<<*I<<"\n";
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
