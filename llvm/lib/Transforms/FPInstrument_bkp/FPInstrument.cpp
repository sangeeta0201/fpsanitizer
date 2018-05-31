/********************************************************************************
 *                                                                              *
 *  This file is part of Verificarlo.                                           *
 *                                                                              *
 *  Copyright (c) 2015                                                          *
 *     Universite de Versailles St-Quentin-en-Yvelines                          *
 *     CMLA, Ecole Normale Superieure de Cachan                                 *
 *                                                                              *
 *  Verificarlo is free software: you can redistribute it and/or modify         *
 *  it under the terms of the GNU General Public License as published by        *
 *  the Free Software Foundation, either version 3 of the License, or           *
 *  (at your option) any later version.                                         *
 *                                                                              *
 *  Verificarlo is distributed in the hope that it will be useful,              *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of              *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               *
 *  GNU General Public License for more details.                                *
 *                                                                              *
 *  You should have received a copy of the GNU General Public License           *
 *  along with Verificarlo.  If not, see <http://www.gnu.org/licenses/>.        *
 *                                                                              *
 ********************************************************************************/

#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/TypeBuilder.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Attributes.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

#include <set>
#include <fstream>

#if LLVM_VERSION_MINOR <= 6
#define CREATE_STRUCT_GEP(i, p) (builder.CreateStructGEP(i, p))
#else
#define CREATE_STRUCT_GEP(i, p) (builder.CreateStructGEP(nullptr, i, p, ""))
#endif

using namespace llvm;
// VfclibInst pass command line arguments
static cl::opt<std::string> VfclibInstFunction("vfclibinst-function",
					       cl::desc("Only instrument given FunctionName"),
					       cl::value_desc("FunctionName"), cl::init(""));

static cl::opt<std::string> VfclibInstFunctionFile("vfclibinst-function-file",
						   cl::desc("Instrument functions in file FunctionNameFile "),
						   cl::value_desc("FunctionsNameFile"), cl::init(""));

static cl::opt<bool> VfclibInstVerbose("vfclibinst-verbose",
				       cl::desc("Activate verbose mode"),
				       cl::value_desc("Verbose"), cl::init(false));

namespace {
    // Define an enum type to classify the floating points operations
    // that are instrumented by verificarlo

  enum Fops {FOP_ADD, FOP_SUB, FOP_MUL, FOP_DIV, FOP_IGNORE};

    // Each instruction can be translated to a string representation
  std::string Fops2str[] = { "add", "sub", "mul", "div", "ignore"};

  struct FPInstrument : public ModulePass {
    static char ID;
    StructType * mca_interface_type;
    std::set<std::string> SelectedFunctionSet;
    Value *GetCurTid;
    Value* GNU_Hook;
    Type *IntptrTy; 
    const DataLayout *DL; 
    LLVMContext *C;

    FPInstrument() : ModulePass(ID) {
      if (not VfclibInstFunctionFile.empty()) {
        std::string line;
        std::ifstream loopstream (VfclibInstFunctionFile.c_str());
        if (loopstream.is_open()) {
          while (std::getline(loopstream, line)) {
            SelectedFunctionSet.insert(line);
          }
          loopstream.close();
        } else {
          errs() << "Cannot open " << VfclibInstFunctionFile << "\n";
          assert(0);
        }
      } else if (not VfclibInstFunction.empty()) {
        SelectedFunctionSet.insert(VfclibInstFunction);
      }
    }

  bool runOnModule(Module &M) {
    bool modified = false;
    C = &(M.getContext()); 
    DL = &M.getDataLayout();

            // Find the list of functions to instrument
            // Instrumentation adds stubs to mcalib function which we
            // never want to instrument.  Therefore it is important to
            // first find all the functions of interest before
            // starting instrumentation.

    std::vector<Function*> functions;
    for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F) {
      Function &F1 = *F;
      initializeCallbacks(*F1.getParent()); 
      const bool is_in = SelectedFunctionSet.find(F->getName()) != SelectedFunctionSet.end();
      if (SelectedFunctionSet.empty() || is_in) {
        functions.push_back(&*F);
      }
    }

    // Do the instrumentation on selected functions
    for(std::vector<Function*>::iterator F = functions.begin(); F != functions.end(); ++F) {
      modified |= runOnFunction(M, **F);
    }
    // runOnModule must return true if the pass modifies the IR
    return modified;
  }

  bool runOnFunction(Module &M, Function &F) {
    if (VfclibInstVerbose) {
      errs() << "In Function: ";
      errs().write_escaped(F.getName()) << '\n';
    }
    bool modified = false;
    for (Function::iterator bi = F.begin(), be = F.end(); bi != be; ++bi) {
      modified |= runOnBasicBlock(M, *bi);
    }
    return modified;
  }

  void initializeCallbacks(Module &M) {
    IRBuilder<> IRB(M.getContext());
    AttributeList Attr;
    Attr = Attr.addAttribute(M.getContext(), AttributeList::FunctionIndex,
                           Attribute::NoUnwind);

    Type* VoidTy = Type::getVoidTy(M.getContext());
    Type* void_ptr_ty = PointerType::getUnqual(Type::getInt8Ty(M.getContext()));
    Type* size_ty = Type::getInt64Ty(M.getContext());
    Type* int_ty = Type::getInt32Ty(M.getContext());
    GetCurTid  = M.getOrInsertFunction("get_cur_tid", size_ty);

//          GNU_Hook = M.getOrInsertFunction("__gnu_hook", IRB.getInt8PtrTy(),
 //     IRB.getInt8PtrTy(), IntptrTy);
    GNU_Hook = M.getOrInsertFunction("__gnu_hook", VoidTy, IRB.getInt8PtrTy());
  }

  Fops mustReplace(Instruction &I) {
    switch (I.getOpcode()) {
      case Instruction::FAdd:
        return FOP_ADD;
      case Instruction::FSub:
        // In LLVM IR the FSub instruction is used to represent FNeg
        return FOP_SUB;
      case Instruction::FMul:
        return FOP_MUL;
      case Instruction::FDiv:
        return FOP_DIV;
      default:
        return FOP_IGNORE;
    }
  }

  bool runOnBasicBlock(Module &M, BasicBlock &B) {
    bool modified = false;
    for (BasicBlock::iterator ii = B.begin(), ie = B.end(); ii != ie; ++ii){
      Instruction &I = *ii;
      Fops opCode = mustReplace(I);
      if (opCode == FOP_IGNORE) continue;
      errs() << "Instrumenting" << I << '\n';
      errs() << "operands" << *(I.getOperand(0)) << '\n';
      for (auto op = I.op_begin(); op != I.op_end(); op++) {
        Value* v = op->get();
        StringRef name = v->getName();
        errs()<<*v<<":"<<name<<"\n";
      }
      
      
      IRBuilder<> IRB(&I);
      Value *A0 = I.getOperand(0);
      Value *A1 = I.getOperand(1);
      uint64_t TypeSize = DL->getTypeStoreSizeInBits(A0->getType());
      int CallbackIdx = TypeSize == 8 ? 0 :
        TypeSize == 16 ? 1 :
        TypeSize == 32 ? 2 :
        TypeSize == 64 ? 3 : -1;
      if (CallbackIdx < 0) continue;

      // iterating through instructions using old AllocaInst

      Type* op0ty = A0->getType();
      Type* op1ty = A1->getType();

      llvm::FunctionType *funcTy = llvm::FunctionType::get(IRB.getVoidTy(), {op0ty,op1ty}, false);

      Function *callfunc = dyn_cast<Function>(M.getOrInsertFunction("funcAdd", funcTy));

      callfunc->setCallingConv(CallingConv::C);

      CallInst *CI = IRB.CreateCall(callfunc, {A0,A1});
      //I.replaceAllUsesWith(CI);
  
      modified = true;
    }
    return modified;
    }
  };
}

void addFPPass(const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
  PM.add(new FPInstrument());
}

RegisterStandardPasses SOpt(PassManagerBuilder::EP_OptimizerLast,
                        addFPPass);
RegisterStandardPasses S(PassManagerBuilder::EP_EnabledOnOptLevel0,
                         addFPPass);

char FPInstrument::ID = 0;
static RegisterPass<FPInstrument> X("fpinst", "verificarlo instrument pass", false, false);

