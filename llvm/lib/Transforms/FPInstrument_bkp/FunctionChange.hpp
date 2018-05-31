#ifndef FUNCTION_CHANGE_GUARD
#define FUNCTION_CHANGE_GUARD 1

#include "Change.hpp"
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>

namespace llvm {
  class Value;
}

using namespace llvm;
using namespace std;

typedef vector<Type*> Types;

class FunctionChange : public Change {
  public:
    FunctionChange(Types, Value*, string);
    ~FunctionChange();

    string getSwitch();

  protected:
    string swit;
};

#endif
