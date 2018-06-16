#ifndef VARIABLES_GUARD
#define VARIABLES_GUARD 1

#include <llvm/IR/DebugInfo.h>
#include <llvm/Pass.h>
#include <llvm/IR/Instructions.h>
#include <utility>
#include <map>
#include <set>
#include <vector>

using namespace std;
using namespace llvm;

std::map<Value*, Instruction*> varMap;
std::map<Instruction*, Value*> loadMap;
std::map<Instruction*, Instruction*> regIdMap;
std::map<Value*, double> consMap;
std::map<Instruction*, double> insMap;
std::map<Instruction*, Instruction*> newPhiMap;
std::map<Function*, Value*> funArgMap;
std::map<Argument*, size_t> argMap;

namespace {
struct FPInstrument : public ModulePass {
  
public:
  FPInstrument() : ModulePass(ID) {}
//  bool doInitialization(Module &M) override;

  virtual bool runOnModule(Module &module);
  bool instrumentFunctions(StringRef fn_name);
  bool runOnFunction(Function &F);
  void initializeCallbacks(Module &M);
  void setReal(Instruction *I, Value *Addr, Value *v1, Function &F);
  void setRealCastIToD(Instruction *I, Value *op0, Function &F);
  void setRealCastFToD(Instruction *I, Value *op0, Function &F);
  void handleNewPhi(Function &F);
  void handleFunc(Instruction *I, CallInst *call, Function &F);
  void handleOp(Instruction *I, BinaryOperator* binOp, Function &F);
  BitCastInst* handleOperandReg(Instruction *I, Value* operand, Function &F,  Instruction** index);
  void handleOpReg(Instruction **newI, Instruction *I, BinaryOperator* binOp, Function &F);
  Value* handleRegOperand(Instruction *I, Value* operand, Function &F);
  BitCastInst* handleOperand(Instruction **index, Instruction *I, Value* operand, Function &F, bool *consFlag, bool *regFlag);
  void handleIns(Instruction *I, BinaryOperator* binOp, Function &F);
  void handleConstant(Instruction *I, BinaryOperator* binOp, Function &F);
  //void handlePhi(Instruction *I, PHINode *PN, Function &F);
  void handlePhi(Function &F);
  void handleMathFunc(Instruction *I, CallInst *callInst, Function &F);
  Instruction* getReal(Instruction *I, Value *Addr, Function &F);
  void addnewInline(Instruction *newI, Instruction *oldI);
  unsigned getAlignment(Type* type);
  bool trace(User *it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment);
  bool traceLoad(LoadInst &it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment);
  bool traceStore(StoreInst &it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment);
  bool traceBitCast(BitCastInst &it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment);
  bool traceGetElement(GetElementPtrInst &it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment);
  bool traceCall(CallInst &it, Value* newTarget, Value* oldTarget, Type* newType, Type* oldType, unsigned alignment);
  
  static char ID; // Pass identification, replacement for typeid
  const DataLayout *DL;  
private:
  SmallVector<Instruction*, 8> LocalLoadsAndStores;
  SmallVector<Instruction*, 8> PhiList;
  SmallVector<Instruction*, 8> PhiListLast;
  SmallVector<Function*, 8> AllFuncList;
  DebugInfoFinder debugInfo;  
  double consCount = 0;
  double insCount = 0;
  Value* Test;
  Value* SetRealConstant;
  Value* SetRealTemp;
  Value* GetReal;
  Value* HandleOp;
  Value* HandleFunc;
  Value* SetRealFunArg;
  Value* AddFunArg;
  Value* SetRealCastIToD;
  Value* SetRealCastFToD;
  Value* SetRealReg;
  Value* GetRegIndex;
  Value* PrintOp;
  
};
}
#endif // VARIABLES_GUARD

