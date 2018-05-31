#ifndef TRANSFORMER_GUARD
#define TRANSFORMER_GUARD 1

#include <llvm/IR/Instructions.h>
#include <llvm/IR/User.h>
#include <llvm/IR/Value.h>
#include "Debug.hpp"

namespace llvm {
  class Value;
  class ConstantInt;
}

using namespace std;
using namespace llvm;

class Transformer {
public: 
  static bool transform(User *it, Value*, Value*, Type*, Type*, unsigned);
  static bool transform(LoadInst&, Value*, Value*, Type*, Type*, unsigned);
  static bool transform(StoreInst&, Value*, Value*, Type*, Type*, unsigned);
  static bool transform(BitCastInst&, Value*, Value*, Type*, Type*, unsigned);
  static bool transform(GetElementPtrInst&, Value*, Value*, Type*, Type*, unsigned);
  static bool transform(CallInst&, Value*, Value*, Type*, Type*, unsigned);
  void instrument(LoadInst& I, Module &M);
  static ConstantInt* getInt32(int n);
  static ConstantInt* getInt64(int n);
};

#endif
