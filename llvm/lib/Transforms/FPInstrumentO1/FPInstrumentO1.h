//===-llvm/lib/Transforms/FPInstrumentO1.h  - Interface ----------*- C++ -*-===//
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
struct FPInstrumentO1 : public ModulePass {
  
public:
  FPInstrumentO1() : ModulePass(ID) {}

  virtual bool runOnModule(Module &module);
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
  void handleFunc(Instruction *I, CallInst *CI, Function &F);
  //Its called for every BinaryOperator in floating point instruction
  //void handleOp(Instruction *I, BinaryOperator* BO, Function &F);
  void handleOp(Instruction *I, BasicBlock *BB, BinaryOperator* BO, Function &F);
  //this is called inside from handleOp to handle each operand, it it could be constant, temp or loaded from memory
  void handleOperand(Instruction *I, Instruction **Index, Value* OP, Function &F, bool *IsConstant, bool *IsReg);
  //it gives unique index to every instruction
  void handleIns(Instruction *I);
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
  void handleFuncExit(Instruction *I, BasicBlock *BB, Function &F);  
  void handleFuncInit(Function &F);  
  void handleAlloca(Instruction *I, BasicBlock *BB, AllocaInst *A, Function &F);  void handleCleanup(Instruction *I, ReturnInst *RI, Function &F); 
  void handleSelect(Instruction *I, SelectInst *SI, Function &F);
  void handleLoad(Instruction *I, LoadInst *LI, Function &F);
  static char ID; // Pass identification, replacement for typeid
private:
  SmallVector<Function*, 8> AllFuncList;
  SmallVector<Function*, 8> AllMalloc;
  std::map<Instruction*, Instruction*> TrackIToFCast;
  //this is used to track address of a variable loaded from memory 
  std::map<Instruction*, Value*> LoadMap;
  std::map<Instruction*, Instruction*> AddrMap;
  std::map<Instruction*, Instruction*> MallocMap;
  //this is used to track reg index
  std::map<Instruction*, Instruction*> RegIdMap;
  //it is used for constant used in phi node, since phi node is of type size then we need to store
  //floating point constant in shadow memory and get its index in size_t. If we will leave constant
  //as it is then there will type mismatch because constant would be of type double and if run time 
  //function is called in another branch of phi node to do fp using mpfr then it will return index 
  //of result in size_t.
  std::map<Value*, size_t> ConsMap;
  //this is used to track index of every instruction
  std::map<Instruction*, size_t> InsMap;
  //this is used to save mapping of old phi node and new phi node
  std::map<Instruction*, Instruction*> NewPhiMap;
  //this is used to give unique index to every argument of the function. Since we won't know address
  //of the argument or index of the argument in callee. Using index and fucntion address we can ask 
  //runtime for its address or index. 
  std::map<Argument*, size_t> ArgMap;
  //this is index for constants 
  size_t ConsCount = 0;
  //this is index for instructions
  size_t InsCount = 0;
  //these are handlers for run time functions
  std::map<size_t, Instruction*> ComputeRealIns;
  Value* SetRealConstant;
  Value* SetRealTemp;
  Value* HandleOp;
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
  BitCastInst *BCNull;  
};
}

