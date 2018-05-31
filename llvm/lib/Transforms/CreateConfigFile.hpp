#ifndef CREATE_CONFIG_FILE_GUARD
#define CREATE_CONFIG_FILE_GUARD 1

#include <llvm/Pass.h>

#include <map>
#include <set>
#include <vector>
#include "StrChange.hpp"
#include "FuncStrChange.hpp"

namespace llvm {
  class GlobalVariable;
  class raw_fd_ostream;
  class Type;
  class Value;
}

using namespace std;
using namespace llvm;


class CreateConfigFile : public ModulePass {
  
public:
  CreateConfigFile() : ModulePass(ID) {}
  
  virtual bool runOnModule(Module &module);
  
  bool runOnFunction(Function &function, map<string, StrChange*> &changes, bool &first);

  bool doInitialization(Module &);

  void findFunctionCalls(Function &function, map<string, StrChange*> &changes, bool &first);

  void findGlobalVariables(Module &module, map<string, StrChange*> &changes, bool &first);

  void findLocalVariables(Function &function, map<string, StrChange*> &changes, bool &first);
  
  void findOperators(Function &function, map<string, StrChange*> &changes, bool &first);


  map<std::string, StrChange*> getChanges();
  virtual void getAnalysisUsage(AnalysisUsage &AU) const; 
  static char ID; // Pass identification, replacement for typeid

private:
  map<string, StrChange*> changes;                                                                                  

//  map<ChangeType, Changes> changes;
  set<string> excludedFunctions;

  set<string> includedFunctions;

  set<string> includedGlobalVars;

  set<string> excludedLocalVars;

  set<string> functionCalls;
};

#endif // CREATE_CONFIG_FILE_GUARD
