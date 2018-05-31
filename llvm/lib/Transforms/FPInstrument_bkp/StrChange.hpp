#ifndef STRCHANGE_GUARD
#define STRCHANGE_GUARD 1

#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>

using namespace std;

class StrChange {
public:
  StrChange(string, string, int);
  ~StrChange();
  
  string getClassification();
  
  string getTypes();

  int getField();
  
protected:
  string classification;
  string types;
  int field;
};

#endif
