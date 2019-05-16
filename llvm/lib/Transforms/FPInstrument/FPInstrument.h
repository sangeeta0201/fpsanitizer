//===-llvm/lib/Transforms/FPInstrument.h  - Interface ----------*- C++ -*-===//
//
//
//
//===----------------------------------------------------------------------===//
//
//This pass instruments all floating point instructions and call runtime to do those 
//operations using arbitrary precision. This pass provides a way to check rounding errors
//in floating point applications by running a parallel execution in higher precision.
//
//===----------------------------------------------------------------------===//

#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include <fstream>
#include <queue>

using namespace llvm;

namespace {
struct FPInstrument : public ModulePass {
  
public:
  FPInstrument() : ModulePass(ID) {}

  virtual bool runOnModule(Module &module);
	void handleFuncMainInit(Function &F);
	bool isFPArray(Type *type);
	void initParallel(Function &F);
	void exitParallel(Function &F);
	void cleanGEP(StructType *ST,Instruction *I, BasicBlock *BB,  GetElementPtrInst *GEP, Function &F, size_t index);
  //it returns true if function is in the list of instrumented functions
  bool instrumentFunctions(StringRef FN);
  //its called for every store and set real in shadow memory
  void setReal(Instruction *I, Value *Addr, Value *OP, Function &F);
  //it is same as setReal except its called for SIToFPInst (casting from int to float)
  void setRealCastIToD(Instruction *I, Value *ToAddr, Value *OP, Function &F);
  //it is same as setReal except its called for FPExtInst (casting from float to double)
  void setRealCastFToD(Instruction *I, Value *OP, Function &F);
  //it is called for phi node to create a new phi node
  void handlePhi(Instruction *I, PHINode *PN, Function &F);
  //it fillis new phi node
  void handleNewPhi(Function &F);
  //its called for CallInst to handle functions other than math functions
  void handleCallInst(Instruction *I, CallInst *CI, BasicBlock *BB, Function &F);
  void handleCallPLib(Instruction *I, CallInst *CI, BasicBlock *BB, Function &F);
  //Its called for every BinaryOperator in floating point instruction
  //void handleOp(Instruction *I, BinaryOperator* BO, Function &F);
  void handleOp(Instruction *I, BasicBlock *BB, BinaryOperator* BO, Function &F);
  //void handleOp(BasicBlock *BB, Function &F);
  //this is called inside from handleOp to handle each operand, it it could be constant, temp or loaded from memory
  Constant* handleOperand(Instruction *I, Value* OP, Function &F, Value **Index, bool *flag);
  //it gives unique index to every instruction
  void handleIns(Function &F);
  void handleCRIns();
  //its called for every FCmpInst
  void handleFcmp(Instruction *I, BasicBlock *BB, FCmpInst *FCI, Function &F);
  //its called for every math library functions with one argument
  void handleMathFunc(Instruction *I, BasicBlock *BB, CallInst *CI, Function &F, int funcCode); 
  //its called for every math library functions with 3 arguments
  void handleMathFunc3Args(Instruction *I, BasicBlock *BB, CallInst *CI, Function &F, int funcCode);
  //it creates a call to runtime to print register real value
  void createPrintFunc(Instruction *I, CallInst *CI, Function &F); 
  //it creates call to runtime for clean up and printing
  void handleMainRet(Instruction *I, Function &F);
  //this function matches return value of callee to the caller
  void handleFuncReturn(Instruction *I, ReturnInst *RI, Function &F);
  //this function looks one instruction ahead and return it
  Instruction* getNextInstruction(Instruction *I, BasicBlock *BB);
  void handleFuncExit(Instruction *I, ReturnInst *RI, Function &F);  
  void handleFuncInit(Function &F);  
  void handleAlloca(Instruction *I, BasicBlock *BB, AllocaInst *A, Function &F);  void handleCleanup(Instruction *I, ReturnInst *RI, Function &F); 
  void handleSelect(Instruction *I, BasicBlock *BB, SelectInst *SI, Function &F);
  void handleLoad(Instruction *I, LoadInst *LI, BasicBlock *BB, Function &F, bool flag);
	void instrumentAllFunctions(std::string FN);
	void handleExtractValue(Instruction *I, ExtractValueInst *EVI, Function &F);
	void handleLLVMMemcpy(Instruction *I, CallInst *CI, Function &F);
	void handleLLVMMemset(Instruction *I, CallInst *CI, Function &F);
	void handleMalloc(Instruction *I,  BasicBlock *BB, CallInst *CI, Function &F);
	void handleCalloc(Instruction *I,  BasicBlock *BB, CallInst *CI, Function &F);
	void handleFread(Instruction *I,  BasicBlock *BB, CallInst *CI, Function &F);
	void handleFloatToInt(Instruction *I, BasicBlock *BB, FPToSIInst *FSI, Function &F);
	bool search(Type *t, std::string str);
  static char ID; // Pass identification, replacement for typeid
private:
	std::queue<StringRef> FunctionList;
  SmallVector<Function*, 8> AllFuncList;
  SmallVector<Instruction*, 8> AllInsList;
  SmallVector<Instruction*, 8> AllRetList;
  SmallVector<Instruction*, 8> AllBinOpList;
  SmallVector<User*, 8> AllBrList;
  SmallVector<ReturnInst*, 8> AllReturn;
  std::map<Function*, Instruction*> AllRet;
  std::map<Instruction*, Instruction*> TrackIToFCast;
  //this is used to track address of a variable loaded from memory 
  //this is used to track reg index
  std::map<Instruction*, Instruction*> RegIdMap;
  std::map<Instruction*, Instruction*> LoadMap;
  //it is used for constant used in phi node, since phi node is of type size then we need to store
  //floating point constant in shadow memory and get its index in size_t. If we will leave constant
  //as it is then there will type mismatch because constant would be of type double and if run time 
  //function is called in another branch of phi node to do fp using mpfr then it will return index 
  //of result in size_t.
  std::map<Value*, size_t> ConsMap;
  //this is used to track index of every instruction
  std::map<Instruction*, size_t> InsMap;
  std::map<Instruction*, size_t> InsCRMap;
  std::map<Function*, size_t> FunRetMap;
  std::map<Function*, size_t> FunInsMap;
  //this is used to save mapping of old phi node and new phi node
  std::map<Instruction*, Instruction*> NewPhiMap;
  //this is used to give unique index to every argument of the function. Since we won't know address
  //of the argument or index of the argument in callee. Using index and fucntion address we can ask 
  //runtime for its address or index. 
  std::map<Argument*, size_t> ArgMap;
  //this is index for constants 
	size_t TotalIns = 0;
  size_t ConsCount = 0;
  //this is index for instructions
  size_t InsCount = 1;
  size_t InsCRCount = 0;
  //these are handlers for run time functions
  std::map<size_t, Instruction*> ComputeRealIns;
  Value* SetRealConstant;
  Value* SetRealTemp;
  Value* HandleOp;
  Value* HandlePhi[100];
  Value* HandleFunc;
  Value* SetRealFunArg;
  Value* AddFunArg;
  Value* SetRealCastIToD;
  Value* SetRealCastFToD;
  Value* SetRealReg;
  Value* GetRegIndex;
  Value* PrintOp;
  Value* Finish;
  Value* HandleReturn;
  Value* HandleAlloca;
  Value* FuncInit;
  Value* FuncExit;
  Value* GetAddr;
  Value* HandleExtractValue;
	Value* GetFunArg;
	BitCastInst *BCFunc;
	Instruction *FuncIdx;
};
}

