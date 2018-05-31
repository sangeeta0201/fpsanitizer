#ifndef VARIABLES_GUARD
#define VARIABLES_GUARD 1

#include "Change.hpp"
#include "StrChange.hpp"
#include "config_parser.hpp"

#include <llvm/IR/DebugInfo.h>
#include <llvm/Pass.h>
#include <utility>
#include <map>
#include <set>
#include <vector>
#include "Change.hpp"

namespace llvm {
  class AllocaInst;
  class ConstantInt;
  class Value;
}

typedef vector<Change*> Changes;
enum ChangeType {GLOBALVAR, LOCALVAR, OP, CALL}; 

using namespace std;
using namespace llvm;

class Variables : public ModulePass {
  
public:
  Variables() : ModulePass(ID) {}
  bool doInitialization(Module &M) override;
//  void doInitialization(Module &module);

  void instrument(User *UR, Module &M);
  void changeGlobal(Change* change, Module &module);
  static LLVMContext & getLLVMGlobalContext(); 
  AllocaInst* changeLocal(Change* change, Module &M);

  AllocaInst* changeLocal(Value* value, Type* type, Module &M);

  AllocaInst* changeLocal(Value* value, ArrayType* type, Module &M);

  AllocaInst* changeLocal(Value* value, PointerType* type, Module &M);

  AllocaInst* changeLocal(Value* value, StructType* type/*, int field*/,Module &M);
  map<ChangeType, Changes> & getChanges() ;
  virtual void getAnalysisUsage(AnalysisUsage &AU) const;

  virtual bool runOnModule(Module &module);
  bool runOnFunction(Function &f);
  bool runOnFunc(Function &function, map<string, StrChange*> &changes);


  void findFunctionCalls(Function &function, map<string, StrChange*> &changes);

  void findGlobalVariables(Module &module, map<string, StrChange*> &changes);

  void findLocalVariables(Function &function, map<string, StrChange*> &changes);
  
  void findOperators(Function &function, map<string, StrChange*> &changes);

  static unsigned getAlignment(Type* type);
  
  static ConstantInt* getInt32(int n);

  static ConstantInt* getInt64(int n);

  static ConstantInt* getSizeInBits(Type *type);

  static ConstantInt* getAlignmentInBits(Type *type);

  static MDNode* getTypeMetadata(Module& module, const DIVariable *oldDIVar, Type* newType);

  static void updateMetadata(Module& module, Value* oldTarget, Value* newTarget, Type* newType);

  static char ID; // Pass identification, replacement for typeid
  const DataLayout *DL;  
private:
  DebugInfoFinder debugInfo;  
   set<string> excludedFunctions;

  set<string> includedFunctions;

  set<string> includedGlobalVars;

  set<string> excludedLocalVars;

  set<string> functionCalls;
    void updateChanges(string, Value*, LLVMContext&);
                static Value* findAlloca(Value*, Function*);
    map<string, StrChange*> types;
    map<ChangeType, Changes> changes;
};

#endif // VARIABLES_GUARD

