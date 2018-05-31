#include "StrChange.hpp"

#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>

using namespace std;
using namespace llvm;

StrChange::StrChange(string aClassification, string aTypes, int aField) {
  classification = aClassification;
  types = aTypes;
  field = aField;
}

string StrChange::getClassification() {
  return classification;
}

string StrChange::getTypes() {
  return types;
}

int StrChange::getField() {
  return field;
}
