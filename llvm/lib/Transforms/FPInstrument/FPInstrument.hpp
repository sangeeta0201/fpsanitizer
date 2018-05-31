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
std::map<Value*, Value*> funArgMap;
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
  void handleOp(Instruction *I, BinaryOperator* binOp, Function &F);
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
  SmallVector<Function*, 8> AllFuncList;
  DebugInfoFinder debugInfo;  
  Value* Test;
  Value* SetRealConstant;
  Value* SetRealTemp;
  Value* GetReal;
  Value* HandleOp;
  Value* HandleFunc;
};
}
#endif // VARIABLES_GUARD

