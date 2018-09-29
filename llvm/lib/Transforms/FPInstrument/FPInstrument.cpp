#include "FPInstrument.h"
#include "llvm/IR/CallSite.h"  
#include "llvm/IR/ConstantFolder.h"

/* TODO
1. Pass instruction as string to run time
*/
//TODO:1.float are uplifted to double at run time, check if this is an issue in error calculation
//TODO:2 Write all functions name to functions.txt so that we can avoid it doing manually
//TODO:3 
/*
Test this with microbenchmark 
%240 = load i32, i32* %i, align 4
  %div = sdiv i32 %240, 20
  %rem = srem i32 %div, 100
  %conv = sitofp i32 %rem to double                                                                                               
  %241 = bitcast i8* null to i8*
  %div148 = fdiv double %conv, 4.950000e+01
  %242 = bitcast i8* null to i8*
*/
bool FPInstrument::runOnModule(Module &M) {
 
  size_t count = 0;
	for (Module::global_iterator it = M.global_begin(); it != M.global_end(); it++) {
		for(auto *S : M.getIdentifiedStructTypes())
    {
    }
	}
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    if (F.isDeclaration()) continue;

		
    std::string name = F.getName();
    instrumentAllFunctions(name);
  } 
  //All functions needed to be instrumented are added in AllFuncList 
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    if (F.isDeclaration()) continue;
    if (!instrumentFunctions(F.getName())) continue;
    AllFuncList.push_back(&F);
  } 

  // give unique index to all instructions
  for (Function *F : AllFuncList) {
    for (auto &BB : *F) {
      for (auto &I : BB) {
        handleIns(&I); 
      }
    }
  }
  //Before return instruction in main, I am calling function which should clean up shadow mem and get average error for
  //all fp computation
  for (Function *F : AllFuncList) {
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (ReturnInst *RI = dyn_cast<ReturnInst>(&I))
        {
          if (RI->getNumOperands() != 0)
          {
						AllReturn.push_back(RI);
          }
				}
			}
		}
	}
  for (Function *F : AllFuncList) {
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (AllocaInst *Alloca = dyn_cast<AllocaInst>(&I)){
          handleAlloca(&I, &BB, Alloca, *F);
        }
			}
    }
  }
  for (Function *F : AllFuncList) {
    Function::iterator Fit = F->begin();
    BasicBlock &BB = *Fit; 
    BasicBlock::iterator BBit = BB.begin();
    Instruction* I = &*BBit;
		count = 0;
    for (Function::arg_iterator ait = F->arg_begin(), aend = F->arg_end();
                ait != aend; ++ait) {
      Argument *A = &*ait;
      ArgMap.insert(std::pair<Argument*, size_t>(A, count));
      count++;
    } 
	}
  //All function arguments are given unique index and stored in ArgMap
#if 1
  for (Function *F : AllFuncList) {
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if(PHINode *PN = dyn_cast<PHINode>(&I)){
          Type *phi_type = PN->getType();
          if(phi_type->getTypeID() == Type::DoubleTyID || phi_type->getTypeID() == Type::FloatTyID)
          	handlePhi(&I, PN, *F);
        }
      }
    } 
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (LoadInst *Load = dyn_cast<LoadInst>(&I)){
          handleLoad(&I, &BB, Load, *F);
        }
        if (dyn_cast<FPTruncInst>(&I)){ // it means we have new fp
          //we don't have to stop real computation if fptruc cast from double to float
          //if cast if from double to float then we need to find corresponding real value of double 
          //and save it in LoadMap, so whereever cast is used we will use corresponding real
          
          Instruction *OpIns = dyn_cast<Instruction>(I.getOperand(0));
          if(RegIdMap.count(OpIns) != 0){
            Instruction *realI = RegIdMap.at(OpIns);
            RegIdMap.insert(std::pair<Instruction*, Instruction*>(&I, realI)); 
          }
					else 
          	TrackIToFCast.insert(std::pair<Instruction*, Instruction*>(&I, &I)); 
       }
       else if (StoreInst *Store = dyn_cast<StoreInst>(&I)){
          Type *OpType = Store->getOperand(0)->getType();
          //if(OpType->getTypeID() == Type::DoubleTyID || OpType->getTypeID() == Type::FloatTyID){
          	Value *Addr = Store->getPointerOperand();
          	setReal(&I, Addr, Store->getOperand(0), *F); //For every store we set real value in shadowmap
			//		}
       }
       else if (SIToFPInst *Sitofp = dyn_cast<SIToFPInst>(&I)){ // it means we have new fp
          Instruction *OpIns = dyn_cast<Instruction>(I.getOperand(0));
          if(RegIdMap.count(OpIns) != 0){
            Instruction *realI = RegIdMap.at(OpIns);
            RegIdMap.insert(std::pair<Instruction*, Instruction*>(&I, realI)); 
          }
					else 
          	TrackIToFCast.insert(std::pair<Instruction*, Instruction*>(&I, &I)); 
       }
       else if (UIToFPInst *Uitofp = dyn_cast<UIToFPInst>(&I)){ // it means we have new fp
          TrackIToFCast.insert(std::pair<Instruction*, Instruction*>(&I, &I)); 
       }
       else if (FPExtInst *ext = dyn_cast<FPExtInst>(&I)){ // it means we have new fp
          TrackIToFCast.insert(std::pair<Instruction*, Instruction*>(&I, &I)); 
      }
      else if (SelectInst *SI = dyn_cast<SelectInst>(&I)){
          Type *SIType = SI->getType();
          if(SIType->getTypeID() == Type::DoubleTyID || SIType->getTypeID() == Type::FloatTyID)
          	handleSelect(&I, SI, *F); //For every store we set real value in shadowmap
      }
			if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&I)) {
				// Dump the GEP instruction
            Value* firstOperand = GEP->getOperand(0);
            Type* type = firstOperand->getType();
						
        		if (AllocaInst *Alloca = dyn_cast<AllocaInst>(firstOperand)){
          	//	handleAlloca(&I, &BB, Alloca, *F);
						
            // Figure out whether the first operand points to an array
            if (PointerType *pointerType = dyn_cast<PointerType>(type)) {
                Type* elementType = pointerType->getElementType();
                if (elementType->isStructTy()) {
										if (ConstantInt *constantIntIndex = dyn_cast<ConstantInt>(GEP->getOperand(2))){
											size_t index = constantIntIndex->getLimitedValue();
											if (StructType* ST = dyn_cast<StructType>(elementType)) 
												cleanGEP(ST, &I, &BB, GEP, *F, index);
										}
                }
            }
						}
			}
			else if (BinaryOperator* BO = dyn_cast<BinaryOperator>(&I)){
          switch(BO->getOpcode()) {
            case Instruction::FAdd:                                                                        
            case Instruction::FSub:
            case Instruction::FMul:
            case Instruction::FDiv:{
              handleOp(&I, &BB, BO, *F);
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
			else if(ExtractValueInst *EVI = dyn_cast<ExtractValueInst>(&I)){
				handleExtractValue(&I, EVI, *F);
			}
			else if (CallInst *CI = dyn_cast<CallInst>(&I)){ //handle math library functions
          Function *Callee = CI->getCalledFunction();
          if (Callee) {
            std::string name = Callee->getName();
            //TODO: find some better way to do it
            int FuncCode = 0;
          	if(F->getName() == "main"){
            	handleMainInit(&I, *F);
						}
            if(name == "sqrt" || name == "llvm.sqrt.f64"){ 
              FuncCode = 1;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "llvm.floor.f64"){
              FuncCode = 2;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "tan"){
              FuncCode = 3;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "sin" || name == "llvm.sin.f64"){
              FuncCode = 4;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "cos" || name == "llvm.cos.f64"){
              FuncCode = 5;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "atan"){
              FuncCode = 6;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "llvm.fma.f64"){
              FuncCode = 7;
              handleMathFunc3Args(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "llvm.fabs.f64"){
              FuncCode = 8;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "log"){
              FuncCode = 9;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            else if(name == "asin"){
              FuncCode = 10;
              handleMathFunc(&I, &BB, CI, *F, FuncCode);  //we handle math functions for fp
            }
            if(name == "printValue") {
              createPrintFunc(&I, CI, *F);
            }
            if(name == "llvm.memcpy.p0i8.p0i8.i64") {
              handleLLVMMemcpy(&I, CI, *F);
            }
            else{
              handleFunc(&I, CI, *F); // handle other functions in app
            }
          }
        }
        if (FCmpInst *FCI = dyn_cast<FCmpInst>(&I)){
          handleFcmp(&I, &BB, FCI, *F);
        }

      }
    }
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (ReturnInst *RI = dyn_cast<ReturnInst>(&I))
        {
          if(F->getName() == "main"){
            handleMainRet(&I, *F);
          } 
        }
      }
    }
    handleNewPhi(*F);
    ComputeRealIns.clear();
    NewPhiMap.clear(); 
  }
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    if (F.isDeclaration()) continue;
      handleFuncInit(F);
    //insert call to init
    for (auto &BB : F) {
      for (auto &I : BB) {
        if (ReturnInst *RI = dyn_cast<ReturnInst>(&I))
        {
					if(F.getName() != "main")
          	handleFuncExit(&I, RI, &BB, F);
        }
      }
    } 
  }
	//M.dump();
#endif
  return true;
}

void FPInstrument::cleanGEP(StructType *ST,Instruction *I, BasicBlock *BB,  GetElementPtrInst *GEP, Function &F, size_t index) { 

	Module *M = F.getParent();
	Instruction *Next = getNextInstruction(I, BB);
	IRBuilder<> IRB(Next);
	Type* VoidTy = Type::getVoidTy(M->getContext());
	Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
	Type* Int64Ty = Type::getInt64Ty(M->getContext());
 	size_t count = -1; 
	for(StructType::element_iterator it = ST->element_begin(); it != ST->element_end(); it++) {
		count++;
		if(count == index){
			if((*it)->getTypeID() == Type::DoubleTyID || (*it)->getTypeID() == Type::FloatTyID){
				BitCastInst* BCToAddr = new BitCastInst(GEP, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", Next);
				GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
				Instruction *ToAddrIdx = IRB.CreateCall(GetAddr, {BCToAddr});
				HandleAlloca = M->getOrInsertFunction("handleAlloca", VoidTy, Int64Ty);
				IRB.CreateCall(HandleAlloca, {ToAddrIdx});
			}
		}
	}
}

bool FPInstrument::isFPArray(Type *type) {
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

void FPInstrument::instrumentAllFunctions(std::string FN) {
	std::ofstream myfile;
	myfile.open("functions.txt", std::ios::out|std::ios::app);
  if (myfile.is_open())
  {
    myfile <<FN;
    myfile << "\n";
    myfile.close();
  }
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

void FPInstrument::handleMainInit(Instruction *I, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Type* VoidTy = Type::getVoidTy(M->getContext());
  const DebugLoc &Loc = I->getDebugLoc();
  Finish = M->getOrInsertFunction("init", VoidTy);
  IRB.CreateCall(Finish, {});
}

//creates a finish call to run time
void FPInstrument::handleMainRet(Instruction *I, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Type* VoidTy = Type::getVoidTy(M->getContext());
  const DebugLoc &Loc = I->getDebugLoc();
/*
  auto *Scope = cast<DIScope>(Loc->getScope());
  StringRef fileName = Scope->getFilename();
  errs()<<"fileName:"<<fileName<<"\n";
 */
 // TODO:Send name of file
  Finish = M->getOrInsertFunction("finish", VoidTy);
  IRB.CreateCall(Finish, {});
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
  Type *OpTy = OP->getType();
  BitCastInst* BCToAddr = new BitCastInst(ToAddr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);


  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  if(OpTy->getTypeID() == Type::IntegerTyID){
    return;
  }
  GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  Instruction *ToAddrIdx = IRB.CreateCall(GetAddr, {BCToAddr});
  if(OpTy->getTypeID() == Type::PointerTyID){
    SetRealTemp = M->getOrInsertFunction("setRealTemp", VoidTy, Int64Ty, Int64Ty, OpTy);
    //if its not a constant, not a temp, then it could be a pointer, 
    //since we already have address of variable inside pointer, we will pass it to runtime 
    BitCastInst* BCOp = new BitCastInst(OP, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    Instruction *OPIdx = IRB.CreateCall(GetAddr, {BCOp});
    IRB.CreateCall(SetRealTemp, {ToAddrIdx, OPIdx, OP});
  }else if(isa<Argument>(OP) && (ArgMap.count(dyn_cast<Argument>(OP)) != 0)){
    size_t index =  ArgMap.at(dyn_cast<Argument>(OP));
    SetRealFunArg = M->getOrInsertFunction("setRealFunArg", VoidTy, Int32Ty, Int64Ty, Int64Ty, OpTy);
  	BitCastInst* BCFunc = new BitCastInst(&F, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    Instruction *FuncIdx = IRB.CreateCall(GetAddr, {BCFunc});
    Constant* argNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), index); //TODO: Remove this
    IRB.CreateCall(SetRealFunArg, {argNo, FuncIdx, ToAddrIdx, OP});
  }
  else if (isa<ConstantFP>(OP)) {
    //if its constant we don't need to look for its address, we need to create new shadow space for this constant
//    SetRealConstant = M->getOrInsertFunction("setRealConstant", VoidTy, Int64Ty, OpTy);
 //   IRB.CreateCall(SetRealConstant, {ToAddrIdx, OP});
  }
  else{
    //if its not a constant, then it could be temp, temp mapping is stored in LoadMap
    Instruction *OpIns = dyn_cast<Instruction>(I->getOperand(0));
    SetRealTemp = M->getOrInsertFunction("setRealTemp", VoidTy, Int64Ty, Int64Ty, OpTy);
    if(RegIdMap.count(OpIns) != 0){ //handling registers
      Instruction *Index = RegIdMap.at(OpIns);
      errs()<<"setRealTemp: found in regmap:"<<*Index<<"\n";
      IRB.CreateCall(SetRealTemp, {ToAddrIdx, Index, OP});
    }
    else{
      if (CallInst *CI = dyn_cast<CallInst>(OP)){
        Function *Callee = CI->getCalledFunction();
        if (Callee) {
          SetRealTemp = M->getOrInsertFunction("setRealReturn", VoidTy, Int64Ty);
          IRB.CreateCall(SetRealTemp, {ToAddrIdx});
        }
      } 
      else{
        errs()<<"setReal: Error !!! setReal: not a pointer, not a constant, not in load map and not a func arg\n";
        //it means that ita variables passed through call by val, address of this valiable is stored in 
        //funArg with the address of a called function 
        //TODO look for better way to check if its arg passed by value
      }
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
  Instruction *OpIns = dyn_cast<Instruction>(I->getOperand(0));
  if(RegIdMap.count(OpIns) != 0){
    Instruction *realI = RegIdMap.at(OpIns);
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, realI));
  } 
  else{
    errs()<<"setRealCastFToD: not found in LoadMap\n";
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, I));
  }
}

//TODO: Check this later with example and write comment for it
void FPInstrument::setRealCastIToD(Instruction *I, Value *ToAddr, Value *OP, Function &F){
  //Type cast from int to double always changes interger to integer.0, I am doing this in runtime.
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Instruction *OpIns = dyn_cast<Instruction>(I->getOperand(0));
  
  BitCastInst* BCToAddr = new BitCastInst(ToAddr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);

  SetRealCastIToD = M->getOrInsertFunction("setRealCastIToD", VoidTy, PtrVoidTy, Int32Ty);

  Instruction* newI = IRB.CreateCall(SetRealCastIToD, {BCToAddr, I->getOperand(0)});

  RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, newI)); //we maintain list of variables mapped to instructions,
}

void FPInstrument::handleLLVMMemcpy(Instruction *I, CallInst *CI, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Function *Callee = CI->getCalledFunction();

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

  Value *Dst = CI->getArgOperand(0);
  Value *Src = CI->getArgOperand(1);
	Value *Size = CI->getArgOperand(2);
  BitCastInst* BCDst = new BitCastInst(Dst, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  BitCastInst* BCSrc = new BitCastInst(Src, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  BitCastInst* BCSize = new BitCastInst(Size, Type::getInt64Ty(M->getContext()),"", I);
    
  GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  Instruction *DstIdx = IRB.CreateCall(GetAddr, {BCDst});
  Instruction *SrcIdx = IRB.CreateCall(GetAddr, {BCSrc});

	SetRealTemp = M->getOrInsertFunction("handleLLVMMemcpy", VoidTy, Int64Ty, Int64Ty, Int64Ty);
	IRB.CreateCall(SetRealTemp, {DstIdx, SrcIdx, BCSize});
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

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* DoubleTy = Type::getDoubleTy(M->getContext()); 

  Value *OP = CI->getArgOperand(0);
  Instruction* OpIns = dyn_cast<Instruction>(OP);  
  if(RegIdMap.count(OpIns) != 0){ //if operand 1 is reg
    Instruction* Idx = RegIdMap.at(OpIns);
    PrintOp = M->getOrInsertFunction("printRegValue", VoidTy, DoubleTy, DoubleTy);
    IRB.CreateCall(PrintOp, {Idx, OP});
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

  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));

  size_t NumOperands = CI->getNumArgOperands();
  Value *Op[NumOperands];
  Type *OpTy[NumOperands];
  BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  Instruction *CalleeIdx = IRB.CreateCall(GetAddr, {BCCallee});
  for(size_t i = 0; i<NumOperands; i++){
    Op[i] = CI->getArgOperand(i);
    OpTy[i] = Op[i]->getType(); // this should be of float

    if(OpTy[i]->getTypeID() != Type::PointerTyID && OpTy[i]->getTypeID() != Type::IntegerTyID){
      Instruction *OpIns = dyn_cast<Instruction>(Op[i]);
      if(RegIdMap.count(OpIns) != 0){
        Instruction *OpIdx = RegIdMap.at(OpIns);
        Constant* ArgNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), i);
        AddFunArg = M->getOrInsertFunction("addFunArg", VoidTy, Int32Ty, Int64Ty, Int64Ty);
        IRB.CreateCall(AddFunArg, {ArgNo, CalleeIdx, OpIdx});
      }
      else if (isa<ConstantFP>(Op[i])) {
      }
  		else if (CallInst *CI = dyn_cast<CallInst>(OpIns)){
  			Function *Callee = CI->getCalledFunction();
  			if (Callee) {
     			BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      		GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
      		Instruction *CalleeIdx = IRB.CreateCall(GetAddr, {BCCallee});
  				SetRealTemp = M->getOrInsertFunction("getRealReturn", Int64Ty, Int64Ty);
  				Instruction *OpIdx = IRB.CreateCall(SetRealTemp, {CalleeIdx});
        	Constant* ArgNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), i);
        	AddFunArg = M->getOrInsertFunction("addFunArg", VoidTy, Int32Ty, Int64Ty, Int64Ty);
        	IRB.CreateCall(AddFunArg, {ArgNo, CalleeIdx, OpIdx});
   			}
  		} 
			else{
			}
    }
  }
}

void FPInstrument::handleFuncInit(Function &F){
  Function::iterator Fit = F.begin();
  BasicBlock &BB = *Fit; 
  BasicBlock::iterator BBit = BB.begin();
  Instruction *First = &*BBit;

  Module *M = F.getParent();
  IRBuilder<> IRB(First);
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

  
  BitCastInst *BCFunc = new BitCastInst(&F, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", First);
  GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  Instruction *FuncIdx = IRB.CreateCall(GetAddr, {BCFunc});
	FuncInit = M->getOrInsertFunction("funcInit", VoidTy, Int64Ty);
	IRB.CreateCall(FuncInit, {FuncIdx});
}

void FPInstrument::handleFuncExit(Instruction *I, ReturnInst *RI, BasicBlock *BB, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
	errs()<<"handleFuncExit\n"; 
  if (RI->getNumOperands() != 0){
  	Value *OP = RI->getOperand(0);
  	Instruction *OpIns = dyn_cast<Instruction>(OP);
  	//return operand is in loadMap then it means we need to return real
  	if(RegIdMap.count(OpIns) != 0){ //handling registers
    	Instruction *Index = RegIdMap.at(OpIns);
  		BitCastInst* BCFunc = new BitCastInst(&F, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  		GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  		Instruction *FuncIdx = IRB.CreateCall(GetAddr, {BCFunc});
			errs()<<"funcExit:"<<*Index<<"\n";
  		FuncExit = M->getOrInsertFunction("funcExit", VoidTy, Int64Ty, Int64Ty);

  		IRB.CreateCall(FuncExit, {FuncIdx, Index});
		}
		else{
			errs()<<"handleFuncExit: Error !!!\n";
		}
	}
		else{
  		Constant* ConsFuncCode = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0);
  		BitCastInst* BCFunc = new BitCastInst(&F, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  		GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  		Instruction *FuncIdx = IRB.CreateCall(GetAddr, {BCFunc});

  		FuncExit = M->getOrInsertFunction("funcExit", VoidTy, Int64Ty, Int64Ty);

  		IRB.CreateCall(FuncExit, {FuncIdx, ConsFuncCode});
		}
}

void FPInstrument::handleLoad(Instruction *I,  BasicBlock *BB, LoadInst *LI, Function &F){
  Module *M = F.getParent();
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

	if(LI->getType()->getTypeID() == Type::PointerTyID){
  	BitCastInst* BCToAddr = new BitCastInst(LI, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", Next);
  	GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  	Instruction *NewIns = IRB.CreateCall(GetAddr, {BCToAddr});
  	RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
	}
	else{
  	Value *Addr = LI->getPointerOperand();
  	BitCastInst* BCToAddr = new BitCastInst(Addr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", Next);
  	GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  	Instruction *NewIns = IRB.CreateCall(GetAddr, {BCToAddr});
  	RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
	}
}

void FPInstrument::handleAlloca(Instruction *I, BasicBlock *BB, AllocaInst *A, Function &F){
  Module *M = F.getParent();

	Type *AllocaType = A->getType();
	if(AllocaType->getTypeID() != Type::StructTyID){
		return; //we want to clean only double or float types in struct
	}

	for (Use &U : A->uses()) {
    User *UR = U.getUser();
    if (BitCastInst *BI = dyn_cast<BitCastInst>(UR)){
			for (Use &UBI : BI->uses()) {
    		User *URBI = UBI.getUser();
    		if (LoadInst *LI = dyn_cast<LoadInst>(URBI)){
					for (Use &ULI : LI->uses()) {
    				User *URLI = ULI.getUser();
						if (ReturnInst *RI = dyn_cast<ReturnInst>(URLI)){
							return;
						}
				}
			}
		}
  } 
	}
 //   CallSite CS(cast<Instruction>(UR));
 //   if (!CS.isCallee(&U))

  //  Instruction *call = CS.getInstruction();
    // Check out all of the potentially constant arguments.  Note that we don't
    // inspect varargs here.
  //  Value *V1 = dyn_cast<Value>(call);


  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  
  BitCastInst* BCToAddr = new BitCastInst(A, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", Next);

  GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
  Instruction *ToAddrIdx = IRB.CreateCall(GetAddr, {BCToAddr});

  HandleAlloca = M->getOrInsertFunction("handleAlloca", VoidTy, Int64Ty);
  
  IRB.CreateCall(HandleAlloca, {ToAddrIdx});
}
//We need to call runtime function once floating point computation is executed, since
//we need to pass computed result to runtime to compare. To do that we need to instrument
//call after insted of before.
Instruction* FPInstrument::getNextInstruction(Instruction *I, BasicBlock *BB){
  Instruction *Next;
  for (BasicBlock::iterator BBit = BB->begin(), BBend = BB->end(); 
              BBit != BBend; ++BBit) {
    Next = &*BBit;
    if(I == Next){
      Next = &*(++BBit);
      break;
    }
  }
  return Next;
}

//This function handles any math function with three arguments, otherwise its similar to handleMathFunc
void FPInstrument::handleMathFunc3Args(Instruction *I, BasicBlock *BB, CallInst *CI, Function &F, int FuncCode){
  if(FuncCode == 0){
    return;
  }
  Instruction *Next = getNextInstruction(I, BB);

  IRBuilder<> IRB(Next);
  Module *M = F.getParent();
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* DoubleTy = Type::getDoubleTy(M->getContext()); 
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Value *OP1 = CI->getOperand(0);
  Value *OP2 = CI->getOperand(1);
  Value *OP3 = CI->getOperand(2);
  BitCastInst* BCI1 = NULL;
  BitCastInst* BCI2 = NULL;
  BitCastInst* BCI3 = NULL;

  bool IsConstantOp1 = false;
  bool IsConstantOp2 = false;
  bool IsConstantOp3 = false;
  bool IsRegOp1 = false;
  bool IsRegOp2 = false;
  bool IsRegOp3 = false;

  size_t InsIndex;
  InsIndex = InsMap.at(I);
  Constant* ConsInsIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), InsIndex); 

  Instruction *Index1 = 0;
  Instruction *Index2 = 0;
  Instruction *Index3 = 0;
  handleOperand(I, &Index1, CI->getOperand(0), F, &IsConstantOp1, &IsRegOp1);
  handleOperand(I, &Index2, CI->getOperand(1), F, &IsConstantOp2, &IsRegOp2);
  handleOperand(I, &Index3, CI->getOperand(2), F, &IsConstantOp3, &IsRegOp3);

  Constant* ConsFuncCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), FuncCode);

  HandleFunc = M->getOrInsertFunction("handleMathFunc3Args", Int64Ty, Int32Ty, DoubleTy, Int64Ty, 
                                                  DoubleTy, Int64Ty, DoubleTy, Int64Ty, DoubleTy, Int32Ty);
  Instruction* NewIns = IRB.CreateCall(HandleFunc, {ConsFuncCode, OP1, Index1, OP2, Index2, OP3, Index3, 
                                                    CI, ConsInsIndex});
  RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); //old instruction, new instruction
}
/**
This function is called for math library functions. Argument to these functions can be a constant,
temp loaded from memory, temp - result of another fp instruction, temp - register. We need to find 
address of temp loaded from memory or index for register and call runtime with the indices to perform
mpfr equivalent function.
**/
void FPInstrument::handleMathFunc(Instruction *I, BasicBlock *BB, CallInst *CI, Function &F, int FuncCode){
  if(FuncCode == 0){
    return;
  }
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Module *M = F.getParent();
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* DoubleTy = Type::getDoubleTy(M->getContext()); 

  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Value *OP = CI->getOperand(0);
  BitCastInst* BCOp;

  size_t InsIndex;
  InsIndex = InsMap.at(I);
  Constant* ConsInsIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), InsIndex); 
  Constant* ConsFuncCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), FuncCode);
  Constant* ConsZero = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0);
  Function *Callee = CI->getCalledFunction();

  Instruction *OpIns = dyn_cast<Instruction>(OP);
  if (Callee) {
    std::string name = Callee->getName();
    //Assuming operand is a temp
    if (isa<ConstantFP>(OP) || TrackIToFCast.count(OpIns)) {
      //errs()<<"handleMathFunc: op is constant\n";
      HandleFunc = M->getOrInsertFunction("handleMathFunc", Int64Ty, Int32Ty, DoubleTy, Int64Ty, DoubleTy, Int32Ty);
      Instruction* NewIns = IRB.CreateCall(HandleFunc, {ConsFuncCode, OP, ConsZero, CI, ConsInsIndex});
      RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); //old instruction, new instruction
      ComputeRealIns.insert(std::pair<size_t, Instruction*>(InsIndex, NewIns)); 
    }
    else if(RegIdMap.count(OpIns) != 0){
        //errs()<<"handleMathFunc: found in loadmap\n";
        Instruction *OpAddr = RegIdMap.at(OpIns);
        HandleFunc = M->getOrInsertFunction("handleMathFunc", Int64Ty, Int32Ty, DoubleTy, Int64Ty, DoubleTy, Int32Ty);
        Instruction* NewIns = IRB.CreateCall(HandleFunc, {ConsFuncCode, OP, OpAddr, CI, ConsInsIndex});
        RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); //old instruction, new instruction
        ComputeRealIns.insert(std::pair<size_t, Instruction*>(InsIndex, NewIns)); 
    }
    else{
        //errs()<<("handleMathFunc Not found in LoadMap\n");
        HandleFunc = M->getOrInsertFunction("handleMathFunc", Int64Ty, Int32Ty, DoubleTy, Int64Ty, DoubleTy, Int32Ty);
        Instruction* NewIns = IRB.CreateCall(HandleFunc, {ConsFuncCode, OP, ConsZero, CI, ConsInsIndex});
        RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); //old instruction, new instruction
        ComputeRealIns.insert(std::pair<size_t, Instruction*>(InsIndex, NewIns)); 
      
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
  Type* Int8Ty = Type::getInt8Ty(M->getContext());
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type *PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Instruction* Next;
  for(auto it = NewPhiMap.begin(); it != NewPhiMap.end(); ++it)
  {
    Instruction* OldPhi = it->first;
    Instruction* NewPhi = it->second;
    PHINode *PN = dyn_cast<PHINode>(OldPhi);
    PHINode* iPHI = dyn_cast<PHINode>(NewPhi);
		errs()<<"handleNewPhi oldphi:"<<*OldPhi<<"\n";

    for (unsigned PI = 0, PE = PN->getNumIncomingValues(); PI != PE; ++PI) {
      BasicBlock *IBB = PN->getIncomingBlock(PI);
      Value *IncValue = PN->getIncomingValue(PI);  
     	for (BasicBlock::iterator BBit = IBB->begin(), BBend = IBB->end(); 
             	BBit != BBend; ++BBit) {
      	Next = &*BBit;
      }
      IRBuilder<> IRB(Next);
      if (IncValue == PN) continue; //TODO
      Instruction* IValue = dyn_cast<Instruction>(IncValue);  
  		if(isa<Argument>(IncValue) && (ArgMap.count(dyn_cast<Argument>(IncValue)) != 0)){
				errs()<<"TODO: NewPhiMap Arg\n";
    		GetFunArg = M->getOrInsertFunction("getRealFunArg", Int64Ty, Int32Ty, Int64Ty);
  			BitCastInst* BCFunc = new BitCastInst(&F, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", Next);
    		GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
    		Instruction *FuncIdx = IRB.CreateCall(GetAddr, {BCFunc});
    		size_t index =  ArgMap.at(dyn_cast<Argument>(IncValue));
    		Constant* argNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), index); //TODO: Remove this
  			Instruction *Index = IRB.CreateCall( GetFunArg, {argNo, FuncIdx});
        iPHI->addIncoming(Index, IBB);
			}
      else if(RegIdMap.count(IValue) != 0){ //handling registers
        Instruction* I = RegIdMap.at(IValue);
        iPHI->addIncoming(I, IBB);
      }
  		else if (CallInst *CI = dyn_cast<CallInst>(IncValue)){
  			Function *Callee = CI->getCalledFunction();
  			if (Callee) {
     			BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", Next);
      		GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
      		Instruction *CalleeIdx = IRB.CreateCall(GetAddr, {BCCallee});
  				SetRealTemp = M->getOrInsertFunction("getRealReturn", Int64Ty, Int64Ty);
  				Instruction *I = IRB.CreateCall(SetRealTemp, {CalleeIdx});
        	iPHI->addIncoming(I, IBB);
   			}
  		} 
      else if (isa<ConstantFP>(IncValue) || TrackIToFCast.count(IValue) || isa<BitCastInst>(IncValue)) {  
        size_t Index;
        if(ConsMap.count(IncValue) != 0){
          Index = ConsMap.at(IncValue); // it should never fail
        }
        else{
          Index = ConsCount++; 
          ConsMap.insert(std::pair<Value*, size_t>(IncValue, ConsCount));
        }
        Constant* consIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), Index); 
        SetRealConstant = M->getOrInsertFunction("setRealReg", Int64Ty, Int32Ty, IncValue->getType());
        Instruction *NewIns = IRB.CreateCall(SetRealConstant, {consIndex, IncValue});

        iPHI->addIncoming(NewIns, IBB);
      } 
			else if (isa<UndefValue>(IncValue)){
        Constant* cons = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
        iPHI->addIncoming(cons, IBB);
			}
      else{
        errs()<<"handleNewPhi: Error !!! IncValue not found:"<<*OldPhi<<"\n";
      }
    }
		errs()<<"handleNewPhi newphi:"<<*iPHI<<"\n";
  }
}

/**
This create a new phi node for every phi node of type double.
**/
void FPInstrument::handlePhi(Instruction *I, PHINode *PN, Function &F){
  Module *M = F.getParent();
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  IRBuilder<> IRB(I);

  PHINode* iPHI = IRB.CreatePHI (Int64Ty, 2);
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
void FPInstrument::handleOperand(Instruction *I, Instruction **Index, Value* OP, Function &F, 
                                            bool *IsConstant, bool *IsReg){
  IRBuilder<> IRB(I);
  Module *M = F.getParent();

  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type *PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));

  Instruction *OpIns = dyn_cast<Instruction>(OP);
  if (isa<ConstantFP>(OP) || TrackIToFCast.count(OpIns)) {
    *IsConstant = true;
  }
  else if(RegIdMap.count(OpIns) != 0){ //handling registers
    *Index = RegIdMap.at(OpIns);
    *IsReg = true;  
  }
  else if (CallInst *CI = dyn_cast<CallInst>(OP)){
  	Function *Callee = CI->getCalledFunction();
  	if (Callee) {
     	BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
      Instruction *CalleeIdx = IRB.CreateCall(GetAddr, {BCCallee});
  		SetRealTemp = M->getOrInsertFunction("getRealReturn", Int64Ty, Int64Ty);
  		*Index = IRB.CreateCall(SetRealTemp, {CalleeIdx});
    	*IsReg = true;  
   	}
  } 
  else if(isa<Argument>(OP) && (ArgMap.count(dyn_cast<Argument>(OP)) != 0)){
    GetFunArg = M->getOrInsertFunction("getRealFunArg", Int64Ty, Int32Ty, Int64Ty);
  	BitCastInst* BCFunc = new BitCastInst(&F, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
    Instruction *FuncIdx = IRB.CreateCall(GetAddr, {BCFunc});
    size_t index =  ArgMap.at(dyn_cast<Argument>(OP));
    Constant* argNo = ConstantInt::get(Type::getInt32Ty(M->getContext()), index); //TODO: Remove this
  	*Index = IRB.CreateCall( GetFunArg, {argNo, FuncIdx});
   	*IsReg = true;  
  }
  else{
    errs()<<"handleOperand: op not found:"<<*OP<<"\n";
  }
}

/**
It provides unique index to all instructions.
**/
void FPInstrument::handleIns(Instruction *I){
  InsMap.insert(std::pair<Instruction*, size_t>(I, InsCount));
  InsCount++; 
}

void FPInstrument::handleExtractValue(Instruction *I, ExtractValueInst *EVI, Function &F){
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  Type* Int8Ty = Type::getInt8Ty(M->getContext());
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type *PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
	if (EVI->getType()->isStructTy()){
		errs()<<"TODO: handle struct in struct\n";
	}
	if(EVI->getNumIndices() != 1){
		errs()<<"TODO: handle extraction from more than 1 level\n";
	} 
	Value *AggVal = EVI->getAggregateOperand();
	if (AggVal->getType()->isStructTy()) {
		unsigned i = *EVI->idx_begin();
		
//  	Instruction *OpIns = dyn_cast<Instruction>(AggVal);
		if (CallInst *CI = dyn_cast<CallInst>(AggVal)){ //handle math library functions
    	Function *Callee = CI->getCalledFunction();

      BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
      Instruction *CalleeIdx = IRB.CreateCall(GetAddr, {BCCallee});
      Constant* EVIdx = ConstantInt::get(Type::getInt32Ty(M->getContext()), i);
      HandleExtractValue = M->getOrInsertFunction("handleExtractValue", Int64Ty, Int32Ty, Int64Ty);
      Instruction *NewIns = IRB.CreateCall(HandleExtractValue, {EVIdx, CalleeIdx});
  		RegIdMap.insert(std::pair<Instruction*, Instruction*>(EVI, NewIns)); 
    }
		else{
		}
	} else {
	}
}

void FPInstrument::handleSelect(Instruction *I, SelectInst *SI, Function &F){
	
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  Type* Int8Ty = Type::getInt8Ty(M->getContext());
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type *PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Value *OP1 = SI->getOperand(0);
  Value *OP2 = SI->getOperand(1);
  Value *OP3 = SI->getOperand(2);
  //both operands are constants, we are passing it as double value
  //No need to compare this case
  //both operands are registers, passing index 
  Instruction *Op2Ins = dyn_cast<Instruction>(OP2);
  Instruction *Op3Ins = dyn_cast<Instruction>(OP3);
  Value *NewOp2, *NewOp3;
	size_t Index;
	errs()<<"handleSelect:"<<*I<<"\n";
  if (isa<ConstantFP>(OP2) || TrackIToFCast.count(Op2Ins)) {
		if(ConsMap.count(OP2) != 0){
			Index = ConsMap.at(OP2); // it should never fail
		}
		else{
			Index = ConsCount++; 
			ConsMap.insert(std::pair<Value*, size_t>(OP2, ConsCount));
		}
		Constant* consIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), Index); 
		SetRealConstant = M->getOrInsertFunction("setRealReg", Int64Ty, Int32Ty, DoubleTy);
		Instruction *NewIns = IRB.CreateCall(SetRealConstant, {consIndex, OP2});
    NewOp2 = dyn_cast<Value>(NewIns);
  }
	else if(RegIdMap.count(Op2Ins) != 0){ //handling registers
		Instruction *Index = RegIdMap.at(Op2Ins);
		NewOp2 = dyn_cast<Value>(Index);
	}
  else if (FCmpInst *FCI = dyn_cast<FCmpInst>(OP2)){
		NewOp2 = OP2;
	}
  else if (CallInst *CI = dyn_cast<CallInst>(OP2)){
  	Function *Callee = CI->getCalledFunction();
  	if (Callee) {
     	BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
      Instruction *CalleeIdx = IRB.CreateCall(GetAddr, {BCCallee});
  		SetRealTemp = M->getOrInsertFunction("getRealReturn", Int64Ty, Int64Ty);
  		Instruction *Index = IRB.CreateCall(SetRealTemp, {CalleeIdx});
			NewOp2 = dyn_cast<Value>(Index);
   	}
  }
	else{
		errs()<<"handleSelect: Error !!! op2 not found:"<<*OP2<<"\n";
	} 
  if (isa<ConstantFP>(OP3) || TrackIToFCast.count(Op3Ins)) {
		if(ConsMap.count(OP3) != 0){
			Index = ConsMap.at(OP3); // it should never fail
		}
		else{
			Index = ConsCount++; 
			ConsMap.insert(std::pair<Value*, size_t>(OP3, ConsCount));
		}
		Constant* consIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), Index); 
		SetRealConstant = M->getOrInsertFunction("setRealReg", Int64Ty, Int32Ty, OP3->getType());
		Instruction *NewIns = IRB.CreateCall(SetRealConstant, {consIndex, OP3});
    NewOp3 = dyn_cast<Value>(NewIns);
  }
	else if(RegIdMap.count(Op3Ins) != 0){ //handling registers
		Instruction *Index = RegIdMap.at(Op3Ins);
		NewOp3 = dyn_cast<Value>(Index);
	}
  else if (FCmpInst *FCI = dyn_cast<FCmpInst>(OP3)){
		NewOp3 = OP3;
	}
  else if (CallInst *CI = dyn_cast<CallInst>(OP3)){
  	Function *Callee = CI->getCalledFunction();
  	if (Callee) {
     	BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      GetAddr = M->getOrInsertFunction("getAddr", Int64Ty, PtrVoidTy);
      Instruction *CalleeIdx = IRB.CreateCall(GetAddr, {BCCallee});
  		SetRealTemp = M->getOrInsertFunction("getRealReturn", Int64Ty, Int64Ty);
  		Instruction *Index = IRB.CreateCall(SetRealTemp, {CalleeIdx});
			NewOp3 = dyn_cast<Value>(Index);
   	}
  } 
  else{
		errs()<<"handleSelect: Error !!! op3 not found:"<<*OP3<<"\n";
  }
	errs()<<"handleSelect OP1:"<<*OP1<<"\n";
	errs()<<"handleSelect NewOp2:"<<*NewOp2<<"\n";
	errs()<<"handleSelect NewOp3:"<<*NewOp3<<"\n";
  Value *Select = IRB.CreateSelect(OP1, NewOp2, NewOp3); 
  Instruction *NewIns = dyn_cast<Instruction>(Select);
  RegIdMap.insert(std::pair<Instruction*, Instruction*>(SI, NewIns)); 
}
/**
It is called for every fcmp instruction and it creates run time call to compare with respective reals.
We need four kinds of run time handlers - checkBranchCC (both arguments are constant) ,checkBranch (both
arguments are temp), checkBranchCV (operand 1 is constant and operand 2 is temp ).
**/
#if 1
void FPInstrument::handleFcmp(Instruction *I, BasicBlock *BB, FCmpInst *FCI, Function &F){
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Module *M = F.getParent();


  bool IsConstantOp1 = false;
  bool IsConstantOp2 = false;
  bool IsRegOp1 = false;
  bool IsRegOp2 = false;
  
  Instruction *Index1 = 0;
  Instruction *Index2 = 0;
  handleOperand(I, &Index1, FCI->getOperand(0), F, &IsConstantOp1, &IsRegOp1);
  handleOperand(I, &Index2, FCI->getOperand(1), F, &IsConstantOp2, &IsRegOp2);
  Type* FCIOp1Type = FCI->getOperand(0)->getType();
  Type* FCIOp2Type = FCI->getOperand(1)->getType();
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  Type* Int32Ty = Type::getInt32Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type* Int1Ty = Type::getInt1Ty(M->getContext());
  //both operands are constants, we are passing it as double value
  //No need to compare this case
  //both operands are registers, passing index 
  size_t InsIndex;
  InsIndex = InsMap.at(I);
  Constant* ConsInsIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), InsIndex); 

  Constant* OpCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), FCI->getPredicate());
  Constant* ConsIdx = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
	
	size_t LineNo = 0;
	const DebugLoc &Loc = I->getDebugLoc();
	if (Loc)
		LineNo = Loc.getLine();
  Constant* Line = ConstantInt::get(Type::getInt64Ty(M->getContext()), LineNo);
 
	errs()<<"handleFcmp getPredicate:"<<FCI->getPredicate()<<"\n";
  if(IsConstantOp1 && IsConstantOp2){
    HandleOp = M->getOrInsertFunction("checkBranch", VoidTy, FCIOp1Type, Int64Ty, FCIOp1Type, 
                                                      Int64Ty, Int32Ty, Int1Ty, Int32Ty, Int64Ty);
    IRB.CreateCall(HandleOp, {FCI->getOperand(0), ConsIdx, FCI->getOperand(1), ConsIdx, OpCode, I, ConsInsIndex, Line});
  }
  else if(IsRegOp1 && IsRegOp2) {
    HandleOp = M->getOrInsertFunction("checkBranch", VoidTy, FCIOp1Type, Int64Ty, FCIOp1Type, 
                                                      Int64Ty, Int32Ty, Int1Ty, Int32Ty, Int64Ty);
    IRB.CreateCall(HandleOp, {FCI->getOperand(0), Index1, FCI->getOperand(1), Index2, OpCode, I, ConsInsIndex, Line});
  }
  else if(IsConstantOp1 && IsRegOp2){
    HandleOp = M->getOrInsertFunction("checkBranch", VoidTy, FCIOp1Type, Int64Ty, FCIOp1Type, 
                                                      Int64Ty, Int32Ty, Int1Ty, Int32Ty, Int64Ty);
    IRB.CreateCall(HandleOp, {FCI->getOperand(0), ConsIdx, FCI->getOperand(1), Index2, OpCode, I, ConsInsIndex, Line});
  }
  else if(IsRegOp1 && IsConstantOp2){
    HandleOp = M->getOrInsertFunction("checkBranch", VoidTy, FCIOp1Type, Int64Ty, FCIOp1Type, 
                                                      Int64Ty, Int32Ty, Int1Ty, Int32Ty, Int64Ty);
    IRB.CreateCall(HandleOp, {FCI->getOperand(0), Index1, FCI->getOperand(1), ConsIdx, OpCode, I, ConsInsIndex, Line});
  }
  else{
    errs()<<"checkBranch Error!!! operand not found:"<<*I<<"\n";
  }
}
#endif

/**
This is called for every BinOp instruction. It tracks operands indices and call runtime with 
those indices so that equivalent operation can be performed with mpfr.
**/
void FPInstrument::handleOp(Instruction *I, BasicBlock *BB, BinaryOperator* BO, Function &F){
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Module *M = F.getParent();
  Type *BOType = BO->getType();
  Type *Op1Type = BO->getOperand(0)->getType();
  Type *Op2Type = BO->getOperand(1)->getType();
  Type *DoubleTy = Type::getDoubleTy(M->getContext());
  Type *Int8Ty = Type::getInt8Ty(M->getContext());
  Type *Int32Ty = Type::getInt32Ty(M->getContext());
  Type *Int64Ty = Type::getInt64Ty(M->getContext());
  Constant* OpCode = ConstantInt::get(Type::getInt32Ty(M->getContext()), BO->getOpcode());

  bool IsConstantOp1 = false;
  bool IsConstantOp2 = false;
  bool IsRegOp1 = false;
  bool IsRegOp2 = false;

  //get index of ins
  size_t InsIndex;
  InsIndex = InsMap.at(I);
  Constant* ConsInsIndex = ConstantInt::get(Type::getInt32Ty(M->getContext()), InsIndex); 
  Instruction *NewIns; 
  Instruction *Index1 = 0;
  Instruction *Index2 = 0;
  handleOperand(I, &Index1, BO->getOperand(0), F, &IsConstantOp1, &IsRegOp1);
  handleOperand(I, &Index2, BO->getOperand(1), F, &IsConstantOp2, &IsRegOp2);
  Constant* ConsIdx = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
  Constant* TyID = ConstantInt::get(Type::getInt64Ty(M->getContext()), BOType->getTypeID()); 

  //both operands are constants, we are passing it as double value
  if(IsConstantOp1 && IsConstantOp2){
    //both operands are constants
    //have to test case when constant is of type float
    HandleOp = M->getOrInsertFunction("computeReal", Int64Ty, Int32Ty, Int64Ty, Int64Ty, BOType, 
                                                      BOType, BOType, BOType, BOType, Int64Ty, 
																											Int32Ty);
    NewIns = IRB.CreateCall(HandleOp, {OpCode, ConsIdx, ConsIdx, BO->getOperand(0), BO->getOperand(1), 
																														BO->getOperand(0), BO->getOperand(1), BO, TyID, 
                                      ConsInsIndex});
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
    ComputeRealIns.insert(std::pair<size_t, Instruction*>(InsIndex, NewIns)); 
  }
  //both operands are registers, passing index 
  else if(IsRegOp1 && IsRegOp2) {
    HandleOp = M->getOrInsertFunction("computeReal", Int64Ty, Int32Ty, Int64Ty, Int64Ty, BOType, 
                                                      BOType, BOType, BOType, BOType, Int64Ty, Int32Ty);
    NewIns = IRB.CreateCall(HandleOp, {OpCode, Index1, Index2, BO->getOperand(0), BO->getOperand(1), BO->getOperand(0), 
																				BO->getOperand(1), BO, TyID,  
                                      ConsInsIndex});
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
    ComputeRealIns.insert(std::pair<size_t, Instruction*>(InsIndex, NewIns)); 
  }
  else if(IsConstantOp1 && IsRegOp2){
    HandleOp = M->getOrInsertFunction("computeReal", Int64Ty, Int32Ty, Int64Ty, Int64Ty, BOType, 
                                                      BOType, BOType, BOType, BOType, Int64Ty, Int32Ty);
    NewIns = IRB.CreateCall(HandleOp, {OpCode, ConsIdx, Index2, BO->getOperand(0), BO->getOperand(1), BO->getOperand(0), 
																				BO->getOperand(1), BO, TyID, 
                                      ConsInsIndex});
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
    ComputeRealIns.insert(std::pair<size_t, Instruction*>(InsIndex, NewIns)); 
  }
  else if(IsRegOp1 && IsConstantOp2){
    HandleOp = M->getOrInsertFunction("computeReal", Int64Ty, Int32Ty, Int64Ty, Int64Ty, BOType, 
                                                      BOType, BOType, BOType, BOType, Int64Ty, Int32Ty);
    NewIns = IRB.CreateCall(HandleOp, {OpCode, Index1, ConsIdx, BO->getOperand(0), BO->getOperand(1), BO->getOperand(0), 
																				BO->getOperand(1), BO, TyID,
                                     ConsInsIndex});
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, NewIns)); 
    ComputeRealIns.insert(std::pair<size_t, Instruction*>(InsIndex, NewIns)); 
  } //TODO: have to do something here
  else{
    errs()<<"handleOp Error!!! operand not found\n";
    errs()<<"handleOp: I:"<<*I<<"\n";
    errs()<<"handleOp: op0:"<<*BO->getOperand(0)<<"\n";
    errs()<<"handleOp: op1:"<<*BO->getOperand(1)<<"\n";
  }
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
