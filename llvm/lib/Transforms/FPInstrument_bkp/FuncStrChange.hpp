#ifndef FUNC_STR_CHANGE_GUARD
#define FUNC_STR_CHANGE_GUARD 1

#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>

using namespace std;

class FuncStrChange : public StrChange {
public:
  FuncStrChange(string, string, int, string);
  ~FuncStrChange();

  string getSwitch();
  
protected:
  string swit;
};

#endif
