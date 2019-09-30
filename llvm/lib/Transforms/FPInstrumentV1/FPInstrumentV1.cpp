#include "FPInstrumentV1.h"
#include "llvm/IR/CallSite.h"  
#include "llvm/IR/ConstantFolder.h"
#include "llvm/ADT/SCCIterator.h" 
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringRef.h"

#define DUMMY 0
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

static const char *const addFunArg = "__add_fun_arg_";  
static const char *const computeReal = "__compute_real_d_";  

bool FPInstrumentV1::runOnModule(Module &M) {
 
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    if (F.isDeclaration()) continue;
		
		bool flag = false;
		for (auto &BB : F) {
			for (auto &I : BB) {
				if (BinaryOperator* BO = dyn_cast<BinaryOperator>(&I)){
          switch(BO->getOpcode()) {
            case Instruction::FAdd:                                                                        
            case Instruction::FSub:
            case Instruction::FMul:
            case Instruction::FDiv:{
							flag = true;
            }  // we handle binary operations on fp
          }
       } 
			else if (CallInst *CI = dyn_cast<CallInst>(&I)){ //handle math library functions
          Function *Callee = CI->getCalledFunction();
          if (Callee) {
            std::string name = Callee->getName();
            //TODO: find some better way to do it
            if(name == "sqrt" || name == "llvm.sqrt.f64" || name == "tan" || 
								name == "sin" || name == "llvm.sin.f64" || 
								name == "cos" || name == "llvm.cos.f64" || 
								name == "atan" || name == "llvm.fma.f64" ||
								name == "llvm.fabs.f64" || name == "log" || name == "asin"){
							flag = true;
						}
            if(name == "malloc") {
              handleMalloc(&I, &BB, CI, F);
            }
            if(name == "exit") {
            	handleMainRet(&I, F);
            }
					}
				}
			}
		}
		if(flag){
			std::string name = F.getName();
    	instrumentAllFunctions(name);
		}	
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
        if (dyn_cast<FCmpInst>(&I))
						AllInsList.push_back(&I);
        if (AllocaInst *A = dyn_cast<AllocaInst>(&I)){
        	handleAlloca(&I, A, &BB, *F);
				}
        if (LoadInst *Load = dyn_cast<LoadInst>(&I)){
        	handleLoad(&I, Load, &BB, *F, true);
				}
				else if (StoreInst *Store = dyn_cast<StoreInst>(&I)){
					if(Store->getType()->getTypeID() == Type::DoubleTyID || Store->getType()->getTypeID() == Type::FloatTyID)
						AllInsList.push_back(&I);
				}
      	else if (SelectInst *SI = dyn_cast<SelectInst>(&I)){
					Type *SIType = SI->getType();
					if(SIType->getTypeID() == Type::DoubleTyID || SIType->getTypeID() == Type::FloatTyID){
						AllInsList.push_back(&I);
					}
				}	
				else if(ExtractValueInst *EVI = dyn_cast<ExtractValueInst>(&I)){
					if(EVI->getType()->getTypeID() == Type::DoubleTyID || Load->getType()->getTypeID() == Type::FloatTyID)
						AllInsList.push_back(&I);
				}
				else if (BinaryOperator* BO = dyn_cast<BinaryOperator>(&I)){
					switch(BO->getOpcode()) {
            case Instruction::FAdd:                                                                        
            case Instruction::FSub:
            case Instruction::FMul:
            case Instruction::FDiv:{
							AllInsList.push_back(&I);
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
          //TODO: find some better way to do it
          if(name == "sqrt" || name == "llvm.sqrt.f64" || name == "llvm.floor.f64"
            	|| name == "tan" || name == "sin" || name == "llvm.sin.f64" 
            	|| name == "cos" || name == "llvm.cos.f64" || name == "atan"
            	|| name == "llvm.fma.f64" || name == "llvm.fabs.f64" || name == "log" || name == "asin"){
							AllInsList.push_back(&I);
          }
  				else{
						if(instrumentFunctions(name))
							AllInsList.push_back(&I);
					}
       	}
				else
					AllInsList.push_back(&I); //if callee is null, then it can be function pointer
				}
        else if(PHINode *PN = dyn_cast<PHINode>(&I)){
          Type *phi_type = PN->getType();
          if(phi_type->getTypeID() == Type::DoubleTyID || phi_type->getTypeID() == Type::FloatTyID)
						AllInsList.push_back(&I);
				}
    	}
  	}
    handleIns(*F); 
		AllInsList.clear();
		InsCount = 1;
  }
  //Before return instruction in main, I am calling function which should clean up shadow mem and get average error for
  //all fp computation
  for (Function *F : AllFuncList) {
    if (F->isDeclaration()) continue;
			if(F->getName() == "main")
    		handleFuncMainInit(*F);
			else
				handleFuncInit(*F);
    //insert call to init
  }
  for (Module::iterator Mit = M.begin(), Mend = M.end(); Mit != Mend; ++Mit) {
    Function &F = *Mit;
    for (auto &BB : F) {
      for (auto &I : BB) {
        if (dyn_cast<ReturnInst>(&I))
        {
          if(F.getName() == "main"){
            handleMainRet(&I, F);
          } 
        }
      }
    }
	}
//All functions in	AllFuncList have func_init
  //All function arguments are given unique index and stored in ArgMap
#if 1
  size_t count = 1;
  for (Function *F : AllFuncList) {
		if(FunInsMap.count(F) == 0 )
			continue;
    for (Function::arg_iterator ait = F->arg_begin(), aend = F->arg_end();
                ait != aend; ++ait) {
      Argument *A = &*ait;
      ArgMap.insert(std::pair<Argument*, size_t>(A, count));
      count++;
    } 
		count = 1; //0 is reserved for constants, args from 2, and 1 for return
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
          	//handleLoad(&I, Load, &BB, *F, false);
        }
        if (dyn_cast<FPTruncInst>(&I)){ // it means we have new fp
          //we don't have to stop real computation if fptruc cast from double to float
          //if cast if from double to float then we need to find corresponding real value of double 
          //and save it in LoadMap, so whereever cast is used we will use corresponding real
       		//TODO:   
				TrackIToFCast.insert(std::pair<Instruction*, Instruction*>(&I, &I)); 
       }
       else if (StoreInst *Store = dyn_cast<StoreInst>(&I)){
          Value *Addr = Store->getPointerOperand();
					Value *OP = Store->getOperand(0);
					if(TrackIToFCast.count(dyn_cast<Instruction>(OP))){
        		Value *OP1 = dyn_cast<Instruction>(OP)->getOperand(0);
          	setReal(&I, Addr, OP1, *F); //For every store we set real value in shadowmap
       		}
					else
          	setReal(&I, Addr, OP, *F); //For every store we set real value in shadowmap
			}
      else if (FPToSIInst *FSI = dyn_cast<FPToSIInst>(&I)){
      	handleFloatToInt(&I, &BB, FSI, *F); //For every store we set real value in shadowmap
			}
      else if (dyn_cast<SIToFPInst>(&I)){ // it means we have new fp
				TrackIToFCast.insert(std::pair<Instruction*, Instruction*>(&I, &I)); 
			}
			else if (dyn_cast<UIToFPInst>(&I)){ // it means we have new fp
				TrackIToFCast.insert(std::pair<Instruction*, Instruction*>(&I, &I)); 
			}
			else if (dyn_cast<FPExtInst>(&I)){ // it means we have new fp
				TrackIToFCast.insert(std::pair<Instruction*, Instruction*>(&I, &I)); 
			}
      else if (SelectInst *SI = dyn_cast<SelectInst>(&I)){
				Type *SIType = SI->getType();
				if(SIType->getTypeID() == Type::DoubleTyID || SIType->getTypeID() == Type::FloatTyID){
					handleSelect(&I, &BB, SI, *F); //For every store we set real value in shadowmap
				}
			}	
			if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&I)) {
				// Dump the GEP instruction
            Value* firstOperand = GEP->getOperand(0);
            Type* type = firstOperand->getType();
						
        		if (dyn_cast<AllocaInst>(firstOperand)){
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
    					//AllBinOpList.push_back(&I);
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
//			else if(ExtractValueInst *EVI = dyn_cast<ExtractValueInst>(&I)){
				//handleExtractValue(&I, EVI, *F);
	//		}
			else if (CallInst *CI = dyn_cast<CallInst>(&I)){ //handle math library functions
          Function *Callee = CI->getCalledFunction();
          if (Callee) {
            std::string name = Callee->getName();
            //TODO: find some better way to do it
            int FuncCode = 0;
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
            if(name == "llvm.memset.p0i8.i64") {
              handleLLVMMemset(&I, CI, *F);
            }
            if(name == "malloc") {
              //handleMalloc(&I, &BB, CI, *F);
            }
            if(name == "bio_fread") {
              handleFread(&I, &BB, CI, *F);
            }
            if(name == "calloc" || name == "__ckd_calloc__" ) {
              handleCalloc(&I, &BB, CI, *F);
            }
            if(name == "free") {
              //handleFree(&I, &BB, CI, *F);
            }
            else{
              handleCallInst(&I, CI, &BB, *F); // handle other functions in app
            }
          }
/*					else{
							errs()<<"Callee:"<<I<<"\n";
						//if(!Callee->getReturnType()->isVoidTy() || !Callee->getReturnType()->isIntegerTy()){
  						Instruction *Next = getNextInstruction(&I, &BB);
  						IRBuilder<> IRBN(Next);
  						Module *M = F->getParent();
  						Type* Int64Ty = Type::getInt64Ty(M->getContext());
  						Type* VoidTy = Type::getVoidTy(M->getContext());
							if(InsMap.count(CI) != 0){
  							size_t InsIndex;
  							InsIndex = InsMap.at(CI);
  							Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 

								FuncInit = M->getOrInsertFunction("__copy_return", VoidTy, Int64Ty, CI->getType());
								IRBN.CreateCall(FuncInit, {ConsInsIndex, CI});
							}
						//}
					}*/
        }
        if (FCmpInst *FCI = dyn_cast<FCmpInst>(&I)){
          handleFcmp(&I, &BB, FCI, *F);
        }

      }
//			if(AllBinOpList.size() > 0)
  //    	handleOp(&BB, *F);
  //  	AllBinOpList.clear();
    }
    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (ReturnInst *RI = dyn_cast<ReturnInst>(&I))
        {
          if(F->getName() != "main"){
          	handleFuncExit(&I, RI, *F);
          } 
        }
      }
    }
    handleNewPhi(*F);
    NewPhiMap.clear(); 
  }
	errs()<<"Total slots required for this bm:"<<TotalIns<<"\n";
	//M.dump();
#endif
  return true;
}

void FPInstrumentV1::handleFuncMainInit(Function &F){
  Function::iterator Fit = F.begin();
  BasicBlock &BB = *Fit; 
  BasicBlock::iterator BBit = BB.begin();
  Instruction *First = &*BBit;

  Module *M = F.getParent();
  IRBuilder<> IRB(First);

  Type* VoidTy = Type::getVoidTy(M->getContext());
	Type* Int64Ty = Type::getInt64Ty(M->getContext());

  Finish = M->getOrInsertFunction("__init", VoidTy, Int64Ty);
	size_t TotIns = 0;
	if(FunInsMap.count(&F) != 0 )
		TotIns = FunInsMap.at(&F);

  Constant* ConsTotIns = ConstantInt::get(Type::getInt64Ty(M->getContext()), TotIns); 
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
 	IRB.CreateCall(Finish, {});
#else
  IRB.CreateCall(Finish, {ConsTotIns});
#endif
}

void FPInstrumentV1::cleanGEP(StructType *ST,Instruction *I, BasicBlock *BB,  GetElementPtrInst *GEP, Function &F, size_t index) { 
	Instruction *Next = getNextInstruction(I, BB);
	IRBuilder<> IRB(Next);
	//Type* VoidTy = Type::getVoidTy(M->getContext());
	//Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
	//Type* Int64Ty = Type::getInt64Ty(M->getContext());
 	size_t count = -1; 
	for(StructType::element_iterator it = ST->element_begin(); it != ST->element_end(); it++) {
		count++;
		if(count == index){
			if((*it)->getTypeID() == Type::DoubleTyID || (*it)->getTypeID() == Type::FloatTyID){
		//		BitCastInst* BCToAddr = new BitCastInst(GEP, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", Next);
	//			GetAddr = M->getOrInsertFunction("__get_addr", Int64Ty, PtrVoidTy);
//				Instruction *ToAddrIdx = IRB.CreateCall(GetAddr, {BCToAddr});
//				HandleAlloca = M->getOrInsertFunction("handleAlloca", VoidTy, Int64Ty);
	//			IRB.CreateCall(HandleAlloca, {ToAddrIdx});
			}
		}
	}
}

bool FPInstrumentV1::isFPArray(Type *type) {
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

void FPInstrumentV1::instrumentAllFunctions(std::string FN) {
/*
	std::ofstream myfile;
	myfile.open("functions.txt", std::ios::out|std::ios::app);
  if (myfile.is_open())
  {
    myfile <<FN;
    myfile << "\n";
    myfile.close();
  }
*/
}

//take name of the function and check if it is in list of functions given by 
//developer and return true else false.
bool FPInstrumentV1::instrumentFunctions(StringRef FN) {
  std::ifstream infile("functions.txt");
  std::string line;
  while (std::getline(infile, line)) {
		if (FN.compare(line) == 0){
//    if(FN.find(line) != StringRef::npos){
      return true;
    }
  }
  return false;
}

//creates a finish call to run time
void FPInstrumentV1::handleMainRet(Instruction *I, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Type* VoidTy = Type::getVoidTy(M->getContext());
  //const DebugLoc &Loc = I->getDebugLoc();

  //auto *Scope = cast<DIScope>(Loc->getScope());
  //std::string fileName = Scope->getFilename();
	//char * name = const_cast<char*>(fileName.c_str());
  //errs()<<"fileName:"<<fileName<<"\n";
  //errs()<<"fileName:"<<name<<"\n";
 // TODO:Send name of file
  Finish = M->getOrInsertFunction("__finish", VoidTy);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
  IRB.CreateCall(Finish, {});
#endif
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
void FPInstrumentV1::setReal(Instruction *I, Value *ToAddr, Value *OP, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Type *OpTy = OP->getType();
	bool flag = false;
	Type *StoreTy = I->getOperand(0)->getType();
  if (BitCastInst *BI = dyn_cast<BitCastInst>(ToAddr)){
		Type *BITy = BI->getOperand(0)->getType();
		if(BITy->getPointerElementType()->getTypeID() == Type::FloatTyID || BITy->getPointerElementType()->getTypeID() == Type::DoubleTyID){
			flag = true;
		}
		else if(BITy->getPointerElementType()->getTypeID() == Type::StructTyID){
			StructType *STyL = cast<StructType>(BITy->getPointerElementType());
			int num = STyL->getNumElements();
			for(int i = 0; i < num; i++) {
    		if(STyL->getElementType(i)->getTypeID() == Type::DoubleTyID || STyL->getElementType(i)->getTypeID() == Type::FloatTyID)
					flag = true;
  		}
		}
	}
	if(StoreTy->getTypeID() == Type::DoubleTyID || StoreTy->getTypeID() == Type::FloatTyID){
		flag = true;
	}
	if(flag){
  	BitCastInst* BCToAddr = new BitCastInst(ToAddr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);

  	Type* Int64Ty = Type::getInt64Ty(M->getContext());
  	Type* VoidTy = Type::getVoidTy(M->getContext());
  	Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  	if(OpTy->getTypeID() == Type::PointerTyID){
    //if its not a constant, not a temp, then it could be a pointer, 
    //since we already have address of variable inside pointer, we will pass it to runtime 
  	}else if(isa<Argument>(OP) && (ArgMap.count(dyn_cast<Argument>(OP)) != 0)){
    	size_t index =  ArgMap.at(dyn_cast<Argument>(OP));
    	SetRealFunArg = M->getOrInsertFunction("__set_real_fun_arg", VoidTy, Int64Ty, PtrVoidTy, PtrVoidTy, OpTy);
  		BitCastInst* BCFunc = new BitCastInst(&F, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
    	Constant* argNo = ConstantInt::get(Type::getInt64Ty(M->getContext()), index); //TODO: Remove this
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else	
 	IRB.CreateCall(SetRealFunArg, {argNo, BCFunc, BCToAddr, OP});
#endif
  	}
  	else if (isa<ConstantFP>(OP)) {
//    	if its constant we don't need to look for its address, we need to create new shadow space for this constant
			//Do not comment this
			if(OpTy->getTypeID() == Type::FloatTyID){
    		SetRealConstant = M->getOrInsertFunction("__set_real_cons_f", VoidTy, PtrVoidTy, OpTy);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else	
  IRB.CreateCall(SetRealConstant, {BCToAddr, OP});
#endif
			}
			else if(OpTy->getTypeID() == Type::DoubleTyID){
    		SetRealConstant = M->getOrInsertFunction("__set_real_cons_d", VoidTy, PtrVoidTy, OpTy);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
  IRB.CreateCall(SetRealConstant, {BCToAddr, OP});
#endif
			}

  	}
  	else{
    	//if its not a constant, then it could be temp, temp mapping is stored in LoadMap

    	Instruction *OpIns = dyn_cast<Instruction>(I->getOperand(0));
    	SetRealTemp = M->getOrInsertFunction("__set_real", VoidTy, PtrVoidTy, Int64Ty, OpTy);

    	if(RegIdMap.count(OpIns) != 0){ //handling registers
/*
      	Instruction *Index = RegIdMap.at(OpIns);
				#if DUMMY
  				Finish = M->getOrInsertFunction("__dummy", VoidTy);
  				IRB.CreateCall(Finish, {});
				#else
					IRB.CreateCall(SetRealTemp, {BCToAddr, Index, OP});
				#endif
*/
    	}
    	else if(InsMap.count(OpIns) != 0){ //handling registers
/*
      	size_t index = InsMap.at(OpIns);
  			Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), index); 
				#if DUMMY
  				Finish = M->getOrInsertFunction("__dummy", VoidTy);
  				IRB.CreateCall(Finish, {});
				#else
					IRB.CreateCall(SetRealTemp, {BCToAddr, ConsInsIndex, OP});
				#endif
*/
    	}
    	else{
        	errs()<<"setReal: Error !!! setReal: not a pointer, not a constant, not in load map and not a func arg\n";
        	errs()<<"setReal:"<<*OP<<"\n";
        	errs()<<"setReal:"<<*I<<"\n";

					if(OpTy->getTypeID() == Type::FloatTyID){
    				SetRealConstant = M->getOrInsertFunction("__set_real_cons_f", VoidTy, PtrVoidTy, OpTy);
					#if DUMMY
  					Finish = M->getOrInsertFunction("__dummy", VoidTy);
 	 					IRB.CreateCall(Finish, {});
					#else
						IRB.CreateCall(SetRealConstant, {BCToAddr, OP});
					#endif
					}
					else if(OpTy->getTypeID() == Type::DoubleTyID){
    				SetRealConstant = M->getOrInsertFunction("__set_real_cons_d", VoidTy, PtrVoidTy, OpTy);
						#if DUMMY
  						Finish = M->getOrInsertFunction("__dummy", VoidTy);
	  					IRB.CreateCall(Finish, {});
						#else
							IRB.CreateCall(SetRealConstant, {BCToAddr, OP});
						#endif
					}
        	//it means that ita variables passed through call by val, address of this valiable is stored in 
        	//funArg with the address of a called function 
        	//TODO look for better way to check if its arg passed by value
      	}
  	}
	}
}

void FPInstrumentV1::handleLLVMMemset(Instruction *I, CallInst *CI, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

  Value *Dst = CI->getArgOperand(0);
	Value *Size = CI->getArgOperand(2);
  BitCastInst* BCDst = new BitCastInst(Dst, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  BitCastInst* BCSize = new BitCastInst(Size, Type::getInt64Ty(M->getContext()),"", I);
    
	SetRealTemp = M->getOrInsertFunction("__handle_memset", VoidTy, PtrVoidTy, Int64Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(SetRealTemp, {BCDst, BCSize});
#endif
}
/**
This is called for fpext. The 'fpext' instruction extends the value from a smaller 
floating point type to a larger floating point type. We need to find small fp stored 
in LoadMap and link the fpext instruction with it.
**/
/*
void FPInstrumentV1::setRealCastFToD(Instruction *I, Value *OP, Function &F){
  IRBuilder<> IRB(I);
  Instruction *OpIns = dyn_cast<Instruction>(I->getOperand(0));
  if(RegIdMap.count(OpIns) != 0){
    Instruction *realI = RegIdMap.at(OpIns);
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, realI));
  } 
  else{
    RegIdMap.insert(std::pair<Instruction*, Instruction*>(I, I));
  }
}

void FPInstrumentV1::handleFree(Instruction *I,  BasicBlock *BB, CallInst *CI, Function &F){
	Module *M = F.getParent();
	Instruction *Next = getNextInstruction(I, BB);
	IRBuilder<> IRB(Next);
  Function *Callee = CI->getCalledFunction();

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

	Value *Addr = CI->getArgOperand(0);
 	BitCastInst* BCToAddr = new BitCastInst(CI, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
	//SetRealTemp = M->getOrInsertFunction("handleFree", VoidTy, PtrVoidTy, Int64Ty);
//	IRB.CreateCall(SetRealTemp, {CI, Size});
}
*/
/*
void FPInstrumentV1::handleMalloc(Instruction *I, BasicBlock *BB, CallInst *CI, Function &F){
  Module *M = F.getParent();
	Instruction *Next = getNextInstruction(I, BB);
	IRBuilder<> IRB(Next);
  Function *Callee = CI->getCalledFunction();

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

  Value *Dst = CI->getArgOperand(0);
	Value *Size = CI->getArgOperand(1);
	
	for (Use &U : CI->uses()) {
    User *UR = U.getUser();
    if (StoreInst *Store = dyn_cast<StoreInst>(UR)){
			Value *Addr = Store->getPointerOperand();
  		BitCastInst* BCToAddr = new BitCastInst(Addr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  		BitCastInst* BCSize = new BitCastInst(Size, Type::getInt64Ty(M->getContext()),"", I);
 			GetAddr = M->getOrInsertFunction("__get_addr", Int64Ty, PtrVoidTy);
  		Instruction *DstIdx = IRB.CreateCall(GetAddr, {BCToAddr});

			SetRealTemp = M->getOrInsertFunction("handleLLVMMalloc", VoidTy, Int64Ty, Int64Ty, Int64Ty);
			IRB.CreateCall(SetRealTemp, {DstIdx, BCSize});
		}
  } 
 // BitCastInst* BCSize = new BitCastInst(Size, Type::getInt64Ty(M->getContext()),"", I);
    
 // GetAddr = M->getOrInsertFunction("__get_addr", Int64Ty, PtrVoidTy);
 // Instruction *DstIdx = IRB.CreateCall(GetAddr, {BCDst});

//	SetRealTemp = M->getOrInsertFunction("handleLLVMMalloc", VoidTy, Int64Ty, Int64Ty, Int64Ty);
//	IRB.CreateCall(SetRealTemp, {DstIdx, BCSize});
}
*/
void FPInstrumentV1::handleFread(Instruction *I,  BasicBlock *BB, CallInst *CI, Function &F){
	Module *M = F.getParent();
	Instruction *Next = getNextInstruction(I, BB);
	IRBuilder<> IRB(Next);

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int32Ty = Type::getInt32Ty(M->getContext());

	Value *Addr = CI->getArgOperand(0);
	Value *Size1 = CI->getArgOperand(1);
	Value *Size2 = CI->getArgOperand(2);
	SetRealTemp = M->getOrInsertFunction("handleCalloc", VoidTy, PtrVoidTy, Int32Ty, Int32Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(SetRealTemp, {Addr, Size1, Size2});
#endif
}

void FPInstrumentV1::handleCalloc(Instruction *I,  BasicBlock *BB, CallInst *CI, Function &F){
	Module *M = F.getParent();
	Instruction *Next = getNextInstruction(I, BB);
	IRBuilder<> IRB(Next);

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

	Value *Size1 = CI->getArgOperand(0);
	Value *Size2 = CI->getArgOperand(1);
	SetRealTemp = M->getOrInsertFunction("__handle_calloc", VoidTy, PtrVoidTy, Int64Ty, Int64Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(SetRealTemp, {CI, Size1, Size2});
#endif
}

void FPInstrumentV1::handleMalloc(Instruction *I,  BasicBlock *BB, CallInst *CI, Function &F){
	errs()<<"****handleMalloc\n";
	Module *M = F.getParent();
	Instruction *Next = getNextInstruction(I, BB);
	IRBuilder<> IRB(Next);

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

	Value *Size = CI->getArgOperand(0);
	SetRealTemp = M->getOrInsertFunction("new_malloc", PtrVoidTy, Int64Ty, Int64Ty);
	Value *Index = IRB.CreatePointerCast(CI, Type::getInt64Ty(M->getContext())); 
/*
	size_t constIntValue;
	if (ConstantInt* CI = dyn_cast<ConstantInt>(Size)) {
  	if (CI->getBitWidth() <= 64) {
    	constIntValue = CI->getSExtValue();
			constIntValue = constIntValue*32;
  	}
	}
*/
//  Constant* NewSize = ConstantInt::get(Type::getInt64Ty(M->getContext()), constIntValue); 
	Instruction *INew = IRB.CreateCall(SetRealTemp, {Index, Size});
	MallocList.push_back(INew);
}

void FPInstrumentV1::handleLLVMMemcpy(Instruction *I, CallInst *CI, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

  Value *Dst = CI->getArgOperand(0);
  Value *Src = CI->getArgOperand(1);
	Value *Size = CI->getArgOperand(2);
  BitCastInst* BCDst = new BitCastInst(Dst, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  BitCastInst* BCSrc = new BitCastInst(Src, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
  BitCastInst* BCSize = new BitCastInst(Size, Type::getInt64Ty(M->getContext()),"", I);
    
	SetRealTemp = M->getOrInsertFunction("__handle_memcpy", VoidTy, PtrVoidTy, PtrVoidTy, Int64Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(SetRealTemp, {BCDst,BCSrc, BCSize});
#endif
}

/**
To print real value of register(temporary) we need to call runtime function with the index of
register.
**/
void FPInstrumentV1::createPrintFunc(Instruction *I, CallInst *CI, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Function *Callee = CI->getCalledFunction();
  if (!instrumentFunctions(Callee->getName())) return;

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* DoubleTy = Type::getDoubleTy(M->getContext()); 

  Value *OP = CI->getArgOperand(0);
  Instruction* OpIns = dyn_cast<Instruction>(OP);  
  if(InsMap.count(OpIns) != 0){ //if operand 1 is reg
    size_t Idx = InsMap.at(OpIns);
		
  	Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), Idx); 
		
    PrintOp = M->getOrInsertFunction("printRegValue", VoidTy, DoubleTy, DoubleTy);
    IRB.CreateCall(PrintOp, {ConsInsIndex, OP});
  }
}
/**
This function is called for every call instruction to create call to run time function __add_fun_arg.
It passes the argument number, function address and argument address to __add_fun_arg. __add_fun_arg stores
function address and argument number as index of argument address in a map. When called function is 
parsed it will ask this map for address of the argument using index(function address and argument number).
**/
void FPInstrumentV1::handleCallInst(Instruction *I, CallInst *CI, BasicBlock *BB, Function &F){
	
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRBN(Next);

  Function *Callee = CI->getCalledFunction();
  if (!instrumentFunctions(Callee->getName())) return;

  Type *Int1Ty = Type::getInt1Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type* VoidTy = Type::getVoidTy(M->getContext());

	if(!Callee->getReturnType()->isVoidTy() && !Callee->getReturnType()->isIntegerTy()){
  	size_t InsIndex;
		if(InsMap.count(CI) == 0){
			errs()<<"Error!!! handleCallInst:CI:"<<*CI<<" F.getName()"<<F.getName()<<"\n";
		}
		if(InsMap.count(CI) != 0){
  		InsIndex = InsMap.at(CI);
  		Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 

			FuncInit = M->getOrInsertFunction("__copy_return", VoidTy, Int64Ty, CI->getType());
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRBN.CreateCall(FuncInit, {ConsInsIndex, CI});
#endif
		}
	}

  Constant* ConsTrue = ConstantInt::get(Type::getInt1Ty(M->getContext()), 1); 
  Constant* ConsFalse = ConstantInt::get(Type::getInt1Ty(M->getContext()), 0); 
  size_t NumOperands = CI->getNumArgOperands();
  Value *Op[NumOperands];
	size_t count = 0;
	SmallVector<Type *, 4> Args;
	SmallVector<Value*, 8> ArgsV;
	Type *OpTy[NumOperands];
  for(int i = NumOperands - 1; i >= 0; i--){
    	Op[i] = CI->getArgOperand(i);
    	OpTy[i] = Op[i]->getType(); // this should be of float
		if(OpTy[i]->getTypeID() == Type::DoubleTyID || OpTy[i]->getTypeID() == Type::FloatTyID){
			count++;
			Args.push_back(Int64Ty);
			Args.push_back(Int64Ty);
			Args.push_back(Op[i]->getType());
			Args.push_back(Int1Ty);

//    if(OpTy[i]->getTypeID() != Type::PointerTyID){
      Instruction *OpIns = dyn_cast<Instruction>(Op[i]);
			if(RegIdMap.count(OpIns) != 0){ //phi node
  			Instruction *InsIndex = RegIdMap.at(OpIns);
      	Constant* ArgNo = ConstantInt::get(Type::getInt64Ty(M->getContext()), i+1);
				ArgsV.push_back(ArgNo); 
				ArgsV.push_back(InsIndex); 
				ArgsV.push_back(Op[i]); 
				ArgsV.push_back(ConsFalse); 
		
			}
			else if(LoadMap.count(OpIns) != 0){ //phi node
  			Instruction *InsIndex = LoadMap.at(OpIns);
      	Constant* ArgNo = ConstantInt::get(Type::getInt64Ty(M->getContext()), i+1);
				ArgsV.push_back(ArgNo); 
				ArgsV.push_back(InsIndex); 
				ArgsV.push_back(Op[i]); 
				ArgsV.push_back(ConsTrue); 
		
			}
      else if(InsMap.count(OpIns) != 0){
  			size_t Idx = InsMap.at(OpIns);
        Constant* OpIdx = ConstantInt::get(Type::getInt64Ty(M->getContext()), Idx);
      	Constant* ArgNo = ConstantInt::get(Type::getInt64Ty(M->getContext()), i+1);
				ArgsV.push_back(ArgNo); 
				ArgsV.push_back(OpIdx); 
				ArgsV.push_back(Op[i]); 
				ArgsV.push_back(ConsFalse); 
      }
      else {//if (isa<ConstantFP>(Op[i]) || TrackIToFCast.count(dyn_cast<Instruction>(Op[i]))) {
        Constant* OpIdx = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0);
      	Constant* ArgNo = ConstantInt::get(Type::getInt64Ty(M->getContext()), i+1);
				ArgsV.push_back(ArgNo); 
				ArgsV.push_back(OpIdx); 
				ArgsV.push_back(Op[i]); 
				ArgsV.push_back(ConsFalse); 
      }
//			else
//				errs()<<"Error!!! handleFunc op not found\n";
  //  }
  }
	}
	if(count > 0){
		const std::string Suffix = itostr(count); 
  	AddFunArg = M->getOrInsertFunction(addFunArg + Suffix, FunctionType::get(IRB.getVoidTy(), Args, false));
		IRB.CreateCall(AddFunArg, ArgsV);
	}
}

void FPInstrumentV1::handleFuncInit(Function &F){
  Function::iterator Fit = F.begin();
  BasicBlock &BB = *Fit; 
  BasicBlock::iterator BBit = BB.begin();
  Instruction *First = &*BBit;

  Module *M = F.getParent();
  IRBuilder<> IRB(First);
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
 	
	//Constant *fname = ConstantDataArray::getString(M->getContext(),"hi", true);
  //Value *FBloc = new GlobalVariable(*M, fname->getType(), true, GlobalValue::InternalLinkage, fname, "fBloc");
 
	FuncInit = M->getOrInsertFunction("__func_init", VoidTy, Int64Ty);
	size_t TotIns = FunInsMap.at(&F);
  Constant* ConsTotIns = ConstantInt::get(Type::getInt64Ty(M->getContext()), TotIns); 
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(FuncInit, {ConsTotIns});
#endif
}
/*
void FPInstrumentV1::handleFuncExit(Instruction *I, ReturnInst *RI, Function &F){

  Module *M = F.getParent();
  IRBuilder<> IRB(I);

  if (!instrumentFunctions(F.getName())) return;
  Type* VoidTy = Type::getVoidTy(M->getContext());

	FuncExit = M->getOrInsertFunction("__func_exit", VoidTy);
	IRB.CreateCall(FuncExit, {});
}
*/
void FPInstrumentV1::handleFuncExit(Instruction *I, ReturnInst *RI, Function &F){
	Module *M = F.getParent();
  IRBuilder<> IRB(I);
	Instruction *Index;

  if (!instrumentFunctions(F.getName())) return;
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
	if (RI->getNumOperands() != 0){
		Value *OP = RI->getOperand(0);
		Instruction *OpIns = dyn_cast<Instruction>(OP);
			if(RegIdMap.count(OpIns) != 0){ //phi node
  			Instruction *InsIndex = RegIdMap.at(OpIns);
  			FuncExit = M->getOrInsertFunction("__func_exit", VoidTy, Int64Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(FuncExit, {InsIndex});
#endif
			}
			else if(InsMap.count(OpIns) != 0) {
  			size_t InsIndex;
  			InsIndex = InsMap.at(OpIns);
  			Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 
  			FuncExit = M->getOrInsertFunction("__func_exit", VoidTy, Int64Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(FuncExit, {ConsInsIndex});
#endif
			}
			else{
  			Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
  			FuncExit = M->getOrInsertFunction("__func_exit", VoidTy, Int64Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(FuncExit, {ConsInsIndex});
#endif
			}
	}
			else{
  			Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
  			FuncExit = M->getOrInsertFunction("__func_exit", VoidTy, Int64Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(FuncExit, {ConsInsIndex});
#endif
			}
}

void FPInstrumentV1::handleLoad(Instruction *I, LoadInst *LI, BasicBlock *BB, Function &F, bool flag){
  Module *M = F.getParent();
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Type* PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Type* Int1Ty = Type::getInt1Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
	
	Type *load_type = LI->getType();

	bool BTFlagF = false;
	bool BTFlagD = false;
  Value *Addr = LI->getPointerOperand();
  if (BitCastInst *BI = dyn_cast<BitCastInst>(Addr)){
		if(BI->getOperand(0)->getType()->getPointerElementType()->getTypeID() == Type::DoubleTyID)
			BTFlagD = true;
		if(BI->getOperand(0)->getType()->getPointerElementType()->getTypeID() == Type::FloatTyID)
			BTFlagF = true;
	}
  if (BitCastInst *BI = dyn_cast<BitCastInst>(Addr)){
		Type *BITy = BI->getOperand(0)->getType();
		if(BITy->getPointerElementType()->getTypeID() == Type::StructTyID){
			StructType *STyL = cast<StructType>(BITy->getPointerElementType());
			int num = STyL->getNumElements();
			for(int i = 0; i < num; i++) {
    		if(STyL->getElementType(i)->getTypeID() == Type::DoubleTyID)
					BTFlagD = true;
				if(STyL->getElementType(i)->getTypeID() == Type::FloatTyID)
					BTFlagF = true;
  		}
		}
	}
	if(flag){
		if(load_type->getTypeID() == Type::FloatTyID || load_type->getTypeID() == Type::DoubleTyID || BTFlagD || BTFlagF){
		//	AllInsList.push_back(I);
			Value *Index = IRB.CreatePointerCast(Addr, Type::getInt64Ty(M->getContext())); 
			if(!isa<Instruction>(Index)){
  			BitCastInst* BCToAddr = new BitCastInst(Addr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
				Index = IRB.CreatePointerCast(BCToAddr, Type::getInt64Ty(M->getContext())); 
			}
  		LoadMap.insert(std::pair<Instruction*, Instruction*>(LI, dyn_cast<Instruction>(Index))); 
			//F.dump();
		}
	}
	else{
  	BitCastInst* BCToAddr = new BitCastInst(Addr, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
		if(load_type->getTypeID() == Type::FloatTyID || BTFlagF){
  		size_t InsIndex;
  		InsIndex = InsMap.at(I);
  		Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 
  		Constant* CBTFlagF = ConstantInt::get(Type::getInt1Ty(M->getContext()), BTFlagF);
  		GetAddr = M->getOrInsertFunction("__load_f", VoidTy, PtrVoidTy, Int64Ty, load_type, Int1Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(GetAddr, {BCToAddr, ConsInsIndex, LI, CBTFlagF});
#endif
		}
		else if(load_type->getTypeID() == Type::DoubleTyID || BTFlagD){
  		size_t InsIndex;
			if(InsMap.count(I) != 0){
  			InsIndex = InsMap.at(I);
  			Constant* CBTFlagD = ConstantInt::get(Type::getInt1Ty(M->getContext()), BTFlagD);
  			Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 
  			GetAddr = M->getOrInsertFunction("__load_d", VoidTy, PtrVoidTy, Int64Ty, load_type, Int1Ty);
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(GetAddr, {BCToAddr, ConsInsIndex, LI, CBTFlagD});
#endif
			}
			else
				errs()<<"Error!!! __load_d I:"<<*I<<"\n";
		}
	}
//	else
	//	errs()<<"handleLoad load not instrumented:"<<*I<<"\n"; 
}
void FPInstrumentV1::handleAlloca(Instruction *I, AllocaInst *A, BasicBlock *BB, Function &F){
  Module *M = F.getParent();
  IRBuilder<> IRB(I);
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type *PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
	AllocaInst *newTarget = new AllocaInst(mpfr_t, 0, 0, "new", A);
//	Value *OldIndex = IRB.CreatePointerCast(A, Type::getInt64Ty(M->getContext())); 
//	Value *NewIndex = IRB.CreatePointerCast(newTarget, Type::getInt64Ty(M->getContext())); 
	//AllocaMap.insert(std::pair<Instruction*, Instruction*>(dyn_cast<Instruction>(OldIndex), dyn_cast<Instruction>(NewIndex))); 
	AllocaMap.insert(std::pair<Instruction*, Instruction*>(A, newTarget)); 
}
/*
void FPInstrumentV1::handleAlloca(Instruction *I, BasicBlock *BB, AllocaInst *A, Function &F){
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
							errs()<<"This alloca is used to return so this should be freed at callee :"<<*RI<<"\n";	
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

  GetAddr = M->getOrInsertFunction("__get_addr", Int64Ty, PtrVoidTy);
  Instruction *ToAddrIdx = IRB.CreateCall(GetAddr, {BCToAddr});

  HandleAlloca = M->getOrInsertFunction("handleAlloca", VoidTy, Int64Ty);
  
  IRB.CreateCall(HandleAlloca, {ToAddrIdx});
}
*/
//We need to call runtime function once floating point computation is executed, since
//we need to pass computed result to runtime to compare. To do that we need to instrument
//call after insted of before.
Instruction* FPInstrumentV1::getNextInstruction(Instruction *I, BasicBlock *BB){
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
void FPInstrumentV1::handleMathFunc3Args(Instruction *I, BasicBlock *BB, CallInst *CI, Function &F, int FuncCode){
  if(FuncCode == 0){
    return;
  }
  Instruction *Next = getNextInstruction(I, BB);

  IRBuilder<> IRB(Next);
  Module *M = F.getParent();
  Type* DoubleTy = Type::getDoubleTy(M->getContext()); 
  Type* Int64Ty = Type::getInt64Ty(M->getContext());

  Value *OP1 = CI->getOperand(0);
  Value *OP2 = CI->getOperand(1);
  Value *OP3 = CI->getOperand(2);

  size_t InsIndex;
  InsIndex = InsMap.at(I);
  Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 

	Value *Index1;
	Value *Index2;
	Value *Index3;
	bool isReg1 = false;
	bool isReg2 = false;
	bool isReg3 = false;

  Constant* ConsIdx1 = handleOperand(I, CI->getOperand(0), F, &Index1, &isReg1);
  Constant* ConsIdx2 = handleOperand(I, CI->getOperand(1), F, &Index2, &isReg2);
  Constant* ConsIdx3 = handleOperand(I, CI->getOperand(2), F, &Index3, &isReg3);

  Constant* ConsFuncCode = ConstantInt::get(Type::getInt64Ty(M->getContext()), FuncCode);

  HandleFunc = M->getOrInsertFunction("handleMathFunc3Args", Int64Ty, Int64Ty, DoubleTy, Int64Ty, 
                                                  DoubleTy, Int64Ty, DoubleTy, Int64Ty, DoubleTy, Int64Ty);
	
	//TODO 0302
  //IRB.CreateCall(HandleFunc, {ConsFuncCode, OP1, ConsIdx1, OP2, ConsIdx2, OP3, ConsIdx3, 
    //                                                CI, ConsInsIndex});
}
/**
This function is called for math library functions. Argument to these functions can be a constant,
temp loaded from memory, temp - result of another fp instruction, temp - register. We need to find 
address of temp loaded from memory or index for register and call runtime with the indices to perform
mpfr equivalent function.
**/
void FPInstrumentV1::handleMathFunc(Instruction *I, BasicBlock *BB, CallInst *CI, Function &F, int FuncCode){
  if(FuncCode == 0){
    return;
  }
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Module *M = F.getParent();
  Type* VoidTy = Type::getVoidTy(M->getContext());

  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Value *OP = CI->getOperand(0);

  size_t InsIndex;
  InsIndex = InsMap.at(I);
  Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 
  Constant* ConsFuncCode = ConstantInt::get(Type::getInt64Ty(M->getContext()), FuncCode);
  Constant* ConsZero = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0);
  Function *Callee = CI->getCalledFunction();

  Type *OpTy = OP->getType();

  Instruction *OpIns = dyn_cast<Instruction>(OP);
	Value *Index1;
	bool isReg1 = false;
	
  Constant* ConsIdx1 = handleOperand(I, OP, F, &Index1, &isReg1);

	if(OpTy->getTypeID() == Type::FloatTyID){
  	HandleFunc = M->getOrInsertFunction("__handle_math_f", VoidTy, Int64Ty, Int64Ty, OpTy, Int64Ty, OpTy, Int64Ty);
	}
	else if(OpTy->getTypeID() == Type::DoubleTyID){
  	HandleFunc = M->getOrInsertFunction("__handle_math_d", VoidTy, Int64Ty, OpTy, Int64Ty, OpTy, Int64Ty);
	}
	if(isReg1){
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(HandleFunc, {ConsFuncCode, OP, Index1, CI, ConsInsIndex});
#endif
	}
	else{
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(HandleFunc, {ConsFuncCode, OP, ConsIdx1, CI, ConsInsIndex});
#endif
	}
}
/**
It handles new phi instruction created before of type size_t. If incoming value is constant then it calls
run time function setRealReg and provides index of the constant and value of the constant.
setRealReg creates the entry in shadow memory with this index and value and return index.
If incoming value is register then we find the index in RegIdMap and add it to new phi node. 
**/
void FPInstrumentV1::handleNewPhi(Function &F){
  Module *M = F.getParent();
  Instruction* Next;
  for(auto it = NewPhiMap.begin(); it != NewPhiMap.end(); ++it)
  {
    Instruction* OldPhi = it->first;
    Instruction* NewPhi = it->second;
    PHINode *PN = dyn_cast<PHINode>(OldPhi);
    PHINode* iPHI = dyn_cast<PHINode>(NewPhi);

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
    		size_t Idx =  ArgMap.at(dyn_cast<Argument>(IncValue));
				Constant* argNo = ConstantInt::get(Type::getInt64Ty(M->getContext()), Idx); //TODO: Remove this
				iPHI->addIncoming(argNo, IBB);
			}
			else if(RegIdMap.count(IValue) != 0){ //phi node
  			Instruction *InsIndex = RegIdMap.at(IValue);
        iPHI->addIncoming(InsIndex, IBB);
			}
			else if(LoadMap.count(IValue) != 0){ //phi node
  			Instruction *InsIndex = LoadMap.at(IValue);
        iPHI->addIncoming(InsIndex, IBB);
			}
      else if(InsMap.count(IValue) != 0){ //handling registers
  			size_t Idx = InsMap.at(dyn_cast<Instruction>(IValue));
        Constant* consIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), Idx); 
        iPHI->addIncoming(consIndex, IBB);
      }
      else if (isa<ConstantFP>(IncValue) || TrackIToFCast.count(IValue) || isa<BitCastInst>(IncValue)) {  
        Constant* consIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
        iPHI->addIncoming(consIndex, IBB);
      } 
			else if (isa<UndefValue>(IncValue)){
        Constant* cons = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
        iPHI->addIncoming(cons, IBB);
			}
      else{
        errs()<<"handleNewPhi: Error !!! IncValue not found:"<<*OldPhi<<"\n";
        errs()<<"handleNewPhi: IncValue:"<<*IncValue<<"\n";
        Constant* cons = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
        iPHI->addIncoming(cons, IBB);
      }
    }
  }
}

/**
This create a new phi node for every phi node of type double.
**/
void FPInstrumentV1::handlePhi(Instruction *I, PHINode *PN, Function &F){
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
Constant* FPInstrumentV1::handleOperand(Instruction *I, Value* OP, Function &F, 
																			Value **Index, bool *isReg){
  IRBuilder<> IRB(I);
  Module *M = F.getParent();

	size_t Idx = 0;

	Constant* ConsInsIndex;
  Instruction *OpIns = dyn_cast<Instruction>(OP);

  if (isa<ConstantFP>(OP) || TrackIToFCast.count(OpIns)) {
  	ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), Idx); 
	}
	else if(isa<Argument>(OP) && (ArgMap.count(dyn_cast<Argument>(OP)) != 0)){
    Idx =  ArgMap.at(dyn_cast<Argument>(OP));
  	ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), Idx); 
  }
  else if(InsMap.count(dyn_cast<Instruction>(OP)) != 0){
  	Idx = InsMap.at(dyn_cast<Instruction>(OP));
  	ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), Idx); 
  }
	else if(LoadMap.count(dyn_cast<Instruction>(OP)) != 0){ 
		errs()<<"handleOperand\n";
  	Instruction *Idx = LoadMap.at(dyn_cast<Instruction>(OP));
		*Index = dyn_cast<Value>(Idx);
		*isReg = true;
		errs()<<"Idx:"<<*Idx<<"\n";
  	Value *Addr = dyn_cast<LoadInst>(OP)->getPointerOperand();
		errs()<<"A first:"<<AllocaMap.begin()->first;
		errs()<<"A sec"<<AllocaMap.begin()->second;
		errs()<<"AllocaMap.count(Idx):"<<AllocaMap.count(dyn_cast<Instruction>(Addr))<<"\n";
		if(AddrMap.count(OP) != 0)
			Value *Idx = AddrMap.at(dyn_cast<Instruction>(OP));
		else if(AllocaMap.count(dyn_cast<Instruction>(Addr)) != 0){
			errs()<<"AllocaMap\n";
			Value *Idx = AllocaMap.at(dyn_cast<Instruction>(Addr));
			*Index = IRB.CreatePointerCast(Idx, Type::getInt64Ty(M->getContext())); 
			*isReg = true;
/*
			if(ConstantInt* Cold = dyn_cast<ConstantInt>(Dest)){
			errs()<<"AllocaMap 1\n";
    		size_t intStartOldAddr = Cold->getSExtValue();
  			ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), intStartOldAddr); 
			}
*/
			}
		}
		else{
			errs()<<"Error !!! operand not found I:"<<*I<<" OP:"<<*OP<<"\n";
  		ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), Idx); 
		}
		return ConsInsIndex;
}

/**
It provides unique index to all instructions.
**/
void FPInstrumentV1::handleIns(Function &F){
	for (Function::arg_iterator ait = F.arg_begin(), aend = F.arg_end();
                ait != aend; ++ait) {
  		InsCount++; 
	} 
  for (Instruction *I : AllInsList) {
//			errs()<<"handleIns:"<<*I<<"\n";
  		InsMap.insert(std::pair<Instruction*, size_t>(I, InsCount));
  		InsCount++; 
	}
  FunInsMap.insert(std::pair<Function*, size_t>(&F, InsCount));
	TotalIns += InsCount; 
	errs()<<"Total slots required for this function:"<<F.getName()<<":"<<InsCount<<"\n";
}
/*
void FPInstrumentV1::handleExtractValue(Instruction *I, ExtractValueInst *EVI, Function &F){
  IRBuilder<> IRB(I);
  Module *M = F.getParent();
  Type* DoubleTy = Type::getDoubleTy(M->getContext());
  Type* Int8Ty = Type::getInt8Ty(M->getContext());
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type *PtrVoidTy = PointerType::getUnqual(Type::getInt8Ty(M->getContext()));
	if (EVI->getType()->isStructTy()){
	}
	if(EVI->getNumIndices() != 1){
		errs()<<"TODO: handle extraction from more than 1 level\n";
	} 
	Value *AggVal = EVI->getAggregateOperand();
	if (AggVal->getType()->isStructTy()) {
		unsigned i = *EVI->idx_begin();
		errs()<<"Extracting from struct\n";
		
//  	Instruction *OpIns = dyn_cast<Instruction>(AggVal);
		if (CallInst *CI = dyn_cast<CallInst>(AggVal)){ //handle math library functions
    	Function *Callee = CI->getCalledFunction();

      BitCastInst* BCCallee = new BitCastInst(Callee, PointerType::getUnqual(Type::getInt8Ty(M->getContext())),"", I);
      GetAddr = M->getOrInsertFunction("__get_addr", Int64Ty, PtrVoidTy);
      Instruction *CalleeIdx = IRB.CreateCall(GetAddr, {BCCallee});
      Constant* EVIdx = ConstantInt::get(Type::getInt64Ty(M->getContext()), i);
      HandleExtractValue = M->getOrInsertFunction("handleExtractValue", Int64Ty, Int64Ty, Int64Ty);
      Instruction *NewIns = IRB.CreateCall(HandleExtractValue, {EVIdx, CalleeIdx});
  		RegIdMap.insert(std::pair<Instruction*, Instruction*>(EVI, NewIns)); 
    }
		else{
			errs()<<"ExtractValue: not found in regMap\n";
		}
	} else {
			errs()<<"Extracting from an array\n";
	}
}
*/
void FPInstrumentV1::handleFloatToInt(Instruction *I, BasicBlock *BB, FPToSIInst *FSI, Function &F){
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Module *M = F.getParent();

	Value *Index1;
	bool isReg = false;
  Constant* ConsIdx1 = handleOperand(I, FSI->getOperand(0), F, &Index1, &isReg);

  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type* VoidTy = Type::getVoidTy(M->getContext());

  //both operands are constants, we are passing it as double value
  //No need to compare this case
  //both operands are registers, passing index 

	size_t LineNo = 0;
	const DebugLoc &Loc = I->getDebugLoc();
	if (Loc)
		LineNo = Loc.getLine();
  Constant* Line = ConstantInt::get(Type::getInt64Ty(M->getContext()), LineNo);

	HandleOp = M->getOrInsertFunction("__handle_f_to_sint", VoidTy, Int64Ty, FSI->getType(), Int64Ty);
	if(isReg){
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(HandleOp, {Index1, FSI, Line});
#endif
	}
	else{
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(HandleOp, {ConsIdx1, FSI, Line});
#endif
	}
}

void FPInstrumentV1::handleSelect(Instruction *I, BasicBlock *BB, SelectInst *SI, Function &F){
	
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Module *M = F.getParent();
  Value *OP1 = SI->getOperand(0);
  Value *OP2 = SI->getOperand(1);
  Value *OP3 = SI->getOperand(2);
  //both operands are constants, we are passing it as double value
  //No need to compare this case
  //both operands are registers, passing index 
  Instruction *Op2Ins = dyn_cast<Instruction>(OP2);
  Instruction *Op3Ins = dyn_cast<Instruction>(OP3);
  Value *NewOp2, *NewOp3;
  if (isa<ConstantFP>(OP2) || TrackIToFCast.count(Op2Ins)) {
		Constant* consIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
    NewOp2 = dyn_cast<Value>(consIndex);
  }
	else if(RegIdMap.count(Op2Ins) != 0){ //phi node
 		NewOp2 = RegIdMap.at(Op2Ins);
	}
	else if(LoadMap.count(Op2Ins) != 0){ //phi node
 		NewOp2 = LoadMap.at(Op2Ins);
	}
	else if(InsMap.count(Op2Ins) != 0){ //handling registers
		size_t Index = InsMap.at(Op2Ins);
  	Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), Index); 
		NewOp2 = dyn_cast<Value>(ConsInsIndex);
	}
  else if (dyn_cast<FCmpInst>(OP2)){
		NewOp2 = OP2;
	}
	else if(isa<Argument>(OP2) && (ArgMap.count(dyn_cast<Argument>(OP2)) != 0)){
    	size_t index =  ArgMap.at(dyn_cast<Argument>(OP2));
    	Constant* argNo = ConstantInt::get(Type::getInt64Ty(M->getContext()), index); //TODO: Remove this
			NewOp2 = dyn_cast<Value>(argNo);
	}
	else{
		errs()<<"handleSelect: Error !!! op2 not found:"<<*OP2<<"\n";
	} 
  if (isa<ConstantFP>(OP3) || TrackIToFCast.count(Op3Ins)) {
		Constant* consIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 
    NewOp3 = dyn_cast<Value>(consIndex);
  }
	else if(RegIdMap.count(Op3Ins) != 0){ //phi node
 		NewOp3 = RegIdMap.at(Op3Ins);
	}
	else if(LoadMap.count(Op3Ins) != 0){ //phi node
 		NewOp3 = LoadMap.at(Op3Ins);
	}
	else if(InsMap.count(Op3Ins) != 0){ //handling registers
		size_t Index = InsMap.at(Op3Ins);
  	Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), Index); 
		NewOp3 = dyn_cast<Value>(ConsInsIndex);
	}
  else if (dyn_cast<FCmpInst>(OP3)){
		NewOp3 = OP3;
	}
	else if(isa<Argument>(OP3) && (ArgMap.count(dyn_cast<Argument>(OP3)) != 0)){
    	size_t index =  ArgMap.at(dyn_cast<Argument>(OP3));
    	Constant* argNo = ConstantInt::get(Type::getInt64Ty(M->getContext()), index); //TODO: Remove this
			NewOp3 = dyn_cast<Value>(argNo);
	}
  else{
		errs()<<"handleSelect: Error !!! op3 not found:"<<*OP3<<"\n";
  }
  Value *Select = IRB.CreateSelect(OP1, NewOp2, NewOp3); 
  Instruction *NewIns = dyn_cast<Instruction>(Select);

  RegIdMap.insert(std::pair<Instruction*, Instruction*>(SI, NewIns)); 
/*
  size_t InsIndex;
  InsIndex = InsMap.at(I);
  Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 

	HandleOp = M->getOrInsertFunction("__handle_select", VoidTy, Int64Ty, Int64Ty, SIType); 
	NewIns = IRB.CreateCall(HandleOp, {Select, ConsInsIndex, SI}); 
*/
}
/**
It is called for every fcmp instruction and it creates run time call to compare with respective reals.
We need four kinds of run time handlers - checkBranchCC (both arguments are constant) ,checkBranch (both
arguments are temp), checkBranchCV (operand 1 is constant and operand 2 is temp ).
**/
#if 1
void FPInstrumentV1::handleFcmp(Instruction *I, BasicBlock *BB, FCmpInst *FCI, Function &F){
  Instruction *Next = getNextInstruction(I, BB);
  IRBuilder<> IRB(Next);
  Module *M = F.getParent();

	Value *Index1;
	Value *Index2;
	bool isReg1 = false;
	bool isReg2 = false;

  Type* VoidTy = Type::getVoidTy(M->getContext());
  Constant* ConsIdx1 = handleOperand(I, FCI->getOperand(0), F, &Index1, &isReg1);
  Constant* ConsIdx2 = handleOperand(I, FCI->getOperand(1), F, &Index2, &isReg2);
  Type* FCIOp1Type = FCI->getOperand(0)->getType();
  Type* Int64Ty = Type::getInt64Ty(M->getContext());
  Type* Int1Ty = Type::getInt1Ty(M->getContext());

  //both operands are constants, we are passing it as double value
  //No need to compare this case
  //both operands are registers, passing index 
  size_t InsIndex;
  InsIndex = InsMap.at(I);

	size_t LineNo = 0;
	const DebugLoc &Loc = I->getDebugLoc();
	if (Loc)
		LineNo = Loc.getLine();
  Constant* Line = ConstantInt::get(Type::getInt64Ty(M->getContext()), LineNo);

  Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 

  Constant* OpCode = ConstantInt::get(Type::getInt64Ty(M->getContext()), FCI->getPredicate());

	HandleOp = M->getOrInsertFunction("__check_branch", Int1Ty, FCIOp1Type, Int64Ty, FCIOp1Type, 
                                                      Int64Ty, Int64Ty, Int1Ty, Int64Ty, Int64Ty);
	if(isReg1 && isReg2){
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
		IRB.CreateCall(HandleOp, {FCI->getOperand(0), Index1, FCI->getOperand(1), Index2, 
																			OpCode, I, ConsInsIndex, Line});
#endif
	}
	else if(isReg1){
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
		IRB.CreateCall(HandleOp, {FCI->getOperand(0), Index1, FCI->getOperand(1), ConsIdx2, 
																				OpCode, I, ConsInsIndex, Line});
#endif
	}
	else if(isReg2){
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(HandleOp, {FCI->getOperand(0), ConsIdx1, FCI->getOperand(1), Index2, 
																			OpCode, I, ConsInsIndex, Line});
#endif
	}
	else{
#if DUMMY
  Finish = M->getOrInsertFunction("__dummy", VoidTy);
  IRB.CreateCall(Finish, {});
#else
	IRB.CreateCall(HandleOp, {FCI->getOperand(0), ConsIdx1, FCI->getOperand(1), ConsIdx2, 
																			OpCode, I, ConsInsIndex, Line});
#endif
	}
	for (Use &U : FCI->uses()) {
    User *UR = U.getUser();

    AllBrList.push_back(UR);
	}
#if 0
  for (User *UR : AllBrList) {
		if (BranchInst *Br = dyn_cast<BranchInst>(UR)){
  		IRBuilder<> IRB(dyn_cast<Instruction>(Br));
			errs()<<"handleFCM NewIns:"<<*NewIns<<"\n";	
			Value *NewBr = IRB.CreateCondBr(NewIns, Br->getSuccessor(0), Br->getSuccessor(1));
			Br->eraseFromParent();
	//		F.dump();
//			errs()<<"handleFCM Br:"<<*NewBr<<"\n";	
		}
	}
  AllBrList.clear();
#endif
}
#endif

/**
This is called for every BinOp instruction. It tracks operands indices and call runtime with 
those indices so that equivalent operation can be performed with mpfr.
**/
void FPInstrumentV1::handleOp(Instruction *I, BasicBlock *BB, BinaryOperator* BO, Function &F){
  Instruction *Next = getNextInstruction(I, BB);
	Instruction *StoreIns;
  IRBuilder<> IRB(Next);
  Module *M = F.getParent();
  Type *BOType = BO->getType();
  Type *Int1Ty = Type::getInt1Ty(M->getContext());
  Type *Int64Ty = Type::getInt64Ty(M->getContext());
  Type* VoidTy = Type::getVoidTy(M->getContext());
  Constant* OpCode = ConstantInt::get(Type::getInt64Ty(M->getContext()), BO->getOpcode());

  size_t InsIndex;
	
  InsIndex = InsMap.at(I);

  Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 
  Constant* ConsTrue = ConstantInt::get(Type::getInt1Ty(M->getContext()), 1); 
  Constant* ConsFalse = ConstantInt::get(Type::getInt1Ty(M->getContext()), 0); 
  Constant* ConsDest = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 

	Value *Index1;
	Value *Index2;
	bool isReg1 = false;
	bool isReg2 = false;
	bool storeFlag = false;
  Constant* ConsIdx1 = handleOperand(I, BO->getOperand(0), F, &Index1, &isReg1);
  Constant* ConsIdx2 = handleOperand(I, BO->getOperand(1), F, &Index2, &isReg2);

	Value *Dest = dyn_cast<Value>(ConsDest);
	for (Use &U : BO->uses()) {
    User *UR = U.getUser();
		if (StoreInst *Store = dyn_cast<StoreInst>(UR)){
    	Value *Addr = Store->getPointerOperand();
			StoreIns = dyn_cast<Instruction>(UR);
			storeFlag = true;
  		IRBuilder<> IRBB(StoreIns);
			Dest = IRBB.CreatePointerCast(Addr, Type::getInt64Ty(M->getContext())); 
		}
	}

	if(BOType->getTypeID() == Type::FloatTyID){
		HandleOp = M->getOrInsertFunction("__compute_real_f", VoidTy, Int64Ty, Int1Ty, Int1Ty, Int64Ty, Int64Ty, BOType, 
                                                      BOType, BOType, Int64Ty, Int64Ty);
	}
	else if(BOType->getTypeID() == Type::DoubleTyID){
		HandleOp = M->getOrInsertFunction("__compute_real_d", VoidTy, Int64Ty, Int1Ty, Int1Ty, Int64Ty, Int64Ty, BOType, 
                                                      BOType, BOType, Int64Ty, Int64Ty);
	}
	if(isReg1 && isReg2){
		errs()<<"isReg1 && isReg2\n";
			if(storeFlag){
  			IRBuilder<> IRBB(StoreIns);
				IRBB.CreateCall(HandleOp, {OpCode, ConsTrue, ConsTrue, Index1, Index2, BO->getOperand(0), BO->getOperand(1), BO, ConsInsIndex, Dest});
			}
			else{

				IRB.CreateCall(HandleOp, {OpCode, ConsTrue, ConsTrue, Index1, Index2, BO->getOperand(0), BO->getOperand(1), BO, ConsInsIndex, Dest});
			}
	}
	else if(isReg1){
		errs()<<"isReg1\n";
			if(storeFlag){
  			IRBuilder<> IRBB(StoreIns);
				IRBB.CreateCall(HandleOp, {OpCode, ConsTrue, ConsFalse, Index1, ConsIdx2, BO->getOperand(0), BO->getOperand(1), BO, ConsInsIndex, Dest});
			}
			else
				IRB.CreateCall(HandleOp, {OpCode, ConsTrue, ConsFalse, Index1, ConsIdx2, BO->getOperand(0), BO->getOperand(1), BO, ConsInsIndex, Dest});
	}
	else if(isReg2){
		errs()<<"isReg2\n";
			if(storeFlag){
  			IRBuilder<> IRBB(StoreIns);
				IRBB.CreateCall(HandleOp, {OpCode, ConsFalse, ConsTrue, ConsIdx1, Index2, BO->getOperand(0), BO->getOperand(1), BO, ConsInsIndex, Dest});
			}
			else
				IRB.CreateCall(HandleOp, {OpCode, ConsFalse, ConsTrue, ConsIdx1, Index2, BO->getOperand(0), BO->getOperand(1), BO, ConsInsIndex, Dest});
	}
	else{
		errs()<<"else\n";
			if(storeFlag){
  			IRBuilder<> IRBB(StoreIns);
				IRBB.CreateCall(HandleOp, {OpCode, ConsFalse, ConsFalse, ConsIdx1, ConsIdx2, BO->getOperand(0), BO->getOperand(1), BO, ConsInsIndex, Dest});
			}
			else
				IRB.CreateCall(HandleOp, {OpCode, ConsFalse, ConsFalse, ConsIdx1, ConsIdx2, BO->getOperand(0), BO->getOperand(1), BO, ConsInsIndex, Dest});
	}
		F.dump();
}
/*
void FPInstrumentV1::handleOp(BasicBlock *BB, Function &F){
  Module *M = F.getParent();
  Type *Int1Ty = Type::getInt1Ty(M->getContext());
  Type *Int64Ty = Type::getInt64Ty(M->getContext());
  Type* VoidTy = Type::getVoidTy(M->getContext());
  size_t InsIndex;


  Constant* ConsTrue = ConstantInt::get(Type::getInt1Ty(M->getContext()), 1); 
  Constant* ConsFalse = ConstantInt::get(Type::getInt1Ty(M->getContext()), 0); 
  Constant* ConsDest = ConstantInt::get(Type::getInt64Ty(M->getContext()), 0); 


	SmallVector<Type *, 4> Args;
	SmallVector<Value*, 8> ArgsV;
	BinaryOperator* BO;
  for (Instruction *I : AllBinOpList) {
  	IRBuilder<> IRB(I);
		BO = dyn_cast<BinaryOperator>(I);
  	Type *BOType = BO->getType();

  	Constant* OpCode = ConstantInt::get(Type::getInt64Ty(M->getContext()), BO->getOpcode());

		Value *Dest = dyn_cast<Value>(ConsDest);
		for (Use &U : BO->uses()) {
    	User *UR = U.getUser();
			errs()<<"UR:"<<*UR<<"\n";
			if (StoreInst *Store = dyn_cast<StoreInst>(UR)){
				errs()<<"not store;";
    		Value *Addr = Store->getPointerOperand();
				Dest = IRB.CreatePointerCast(Addr, Type::getInt64Ty(M->getContext())); 
			}
		}

		Args.push_back(Int64Ty);
		Args.push_back(Int1Ty);
		Args.push_back(Int1Ty);
		Args.push_back(Int64Ty);
		Args.push_back(Int64Ty);
		Args.push_back(BOType);
		Args.push_back(BOType);
		Args.push_back(BOType);
		Args.push_back(Int64Ty);
		Args.push_back(Int64Ty);
	
  	InsIndex = InsMap.at(I);

  	Constant* ConsInsIndex = ConstantInt::get(Type::getInt64Ty(M->getContext()), InsIndex); 

		Value *Index1;
		Value *Index2;
		bool isReg1 = false;
		bool isReg2 = false;
  	Constant* ConsIdx1 = handleOperand(I, BO->getOperand(0), F, &Index1, &isReg1);
  	Constant* ConsIdx2 = handleOperand(I, BO->getOperand(1), F, &Index2, &isReg2);


		if(isReg1 && isReg2){
			ArgsV.push_back(OpCode); 
			ArgsV.push_back(ConsTrue); 
			ArgsV.push_back(ConsTrue); 
			ArgsV.push_back(Index1); 
			ArgsV.push_back(Index2); 
			
		}
		else if(isReg1){
			ArgsV.push_back(OpCode); 
			ArgsV.push_back(ConsTrue); 
			ArgsV.push_back(ConsFalse); 
			ArgsV.push_back(Index1); 
			ArgsV.push_back(ConsIdx2); 
		}
		else if(isReg2){
			ArgsV.push_back(OpCode); 
			ArgsV.push_back(ConsFalse); 
			ArgsV.push_back(ConsTrue); 
			ArgsV.push_back(ConsIdx1); 
			ArgsV.push_back(Index2); 
		}
		else{
			ArgsV.push_back(OpCode); 
			ArgsV.push_back(ConsFalse); 
			ArgsV.push_back(ConsFalse); 
			ArgsV.push_back(ConsIdx1); 
			ArgsV.push_back(ConsIdx2); 
		}

		ArgsV.push_back(BO->getOperand(0)); 
		ArgsV.push_back(BO->getOperand(1)); 
		ArgsV.push_back(BO); 
		ArgsV.push_back(ConsInsIndex); 
		ArgsV.push_back(Dest); 
	}
	//HandleOp = M->getOrInsertFunction("__compute_real_d", VoidTy, Int64Ty, Int1Ty, Int1Ty, Int64Ty, Int64Ty, BOType, 
    //                                                  BOType, BOType, Int64Ty, Int64Ty);
  Instruction *Next = getNextInstruction(dyn_cast<Instruction>(BO), BB);
  IRBuilder<> IRBB(Next);
	const std::string Suffix = itostr( AllBinOpList.size()); 
 	AddFunArg = M->getOrInsertFunction(computeReal + Suffix, FunctionType::get(IRBB.getVoidTy(), Args, false));	
	IRBB.CreateCall(AddFunArg, ArgsV);
}
*/
void addFPPass(const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
  PM.add(new FPInstrumentV1());
}

RegisterStandardPasses SOpt(PassManagerBuilder::EP_OptimizerLast,
                        addFPPass);
RegisterStandardPasses S(PassManagerBuilder::EP_EnabledOnOptLevel0,
                         addFPPass);

char FPInstrumentV1::ID = 0;
static const RegisterPass<FPInstrumentV1> Y("fpv1", "instrument fp operations", false, false);