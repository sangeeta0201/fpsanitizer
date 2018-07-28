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

using namespace llvm;

namespace {
struct FPInstrument : public ModulePass {
  
public:
  FPInstrument() : ModulePass(ID) {}

  virtual bool runOnModule(Module &module);
  //it returns true if function is in the list of instrumented functions
  bool instrumentFunctions(StringRef FN);
  //its called for every store and set real in shadow memory
  void setReal(Instruction *I, Value *Addr, Value *OP, Function &F);
  //it is same as setReal except its called for SIToFPInst (casting from int to float)
  void setRealCastIToD(Instruction *I, Value *OP, Function &F);
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
  BitCastInst* handleOperand(Instruction *I, Value* OP, Function &F, bool *IsConstant, bool *IsReg);
  //it gives unique index to every instruction
  void handleIns(Instruction *I, BinaryOperator* BO, Function &F);
  //its called for every FCmpInst
  void handleFcmp(Instruction *I, FCmpInst *FCI, Function &F);
  //its called for every math library functions
  void handleMathFunc(Instruction *I, CallInst *CI, Function &F, int funcCode); 
  void createPrintFunc(Instruction *I, CallInst *CI, Function &F); 
  void handleMainRet(Instruction *I, Function &F);
  void handleFuncReturn(Instruction *I, ReturnInst *RI, Function &F);
  static char ID; // Pass identification, replacement for typeid
private:
  SmallVector<Function*, 8> AllFuncList;
  //this is used to track address of a variable loaded from memory 
  std::map<Instruction*, Value*> LoadMap;
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
  std::map<Function*, CallInst*> RetMap;
  std::map<CallInst*, Value*> ReturnIndex;
  //this is index for constants 
  size_t ConsCount = 0;
  //this is index for instructions
  size_t InsCount = 0;
  //these are handlers for run time functions
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
  
};
}

