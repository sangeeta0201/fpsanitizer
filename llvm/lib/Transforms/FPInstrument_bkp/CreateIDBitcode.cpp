#include "CreateIDBitcode.hpp"

#include <sstream>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Metadata.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

using namespace std;
using namespace llvm;

bool CreateIDBitcode::runOnModule(Module &M) {

  for(Module::iterator f = M.begin(), fe = M.end(); f != fe; f++) {
    if (!f->isDeclaration()) {
      runOnFunction(*f);
    }
  }
  return true;
}

bool CreateIDBitcode::runOnFunction(Function &F) {

  for (Function::iterator Fit = F.begin(), Fend = F.end(); Fit != Fend;
                ++Fit) {                                                                                                          
    BasicBlock &BB = *Fit;
    for (BasicBlock::iterator BBit = BB.begin(), BBend = BB.end();
                    BBit != BBend; ++BBit) {
      Instruction* I = &*BBit;
      LLVMContext& context = I->getContext();
      // convert I id to string
      string instIdStr = static_cast<ostringstream*>( &(ostringstream() << instId) )->str();
      MDNode* mdNode = MDNode::get(context, MDString::get(context, instIdStr));
      // set I id via metadata
      I->setMetadata("corvette.inst.id", mdNode);
      // to retrieve metadata later
      // cast<MDString>(I->getMetadata("corvette.inst.id")->getOperand(0)->getString());
      instId++;
      }
    }
/*
  for(Function::iterator b = f.begin(), be = f.end(); b != be; b++) {
    
    for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {
      Instruction *inst = &*i;
      
      LLVMContext& context = inst->getContext();
      // convert inst id to string
      string instIdStr = static_cast<ostringstream*>( &(ostringstream() << instId) )->str();
      MDNode* mdNode = MDNode::get(context, MDString::get(context, instIdStr));
      // set inst id via metadata
      inst->setMetadata("corvette.inst.id", mdNode);
      // to retrieve metadata later
      // cast<MDString>(inst->getMetadata("corvette.inst.id")->getOperand(0)->getString());
      instId++;
    }
  }
  */
  return false;
}

void CreateIDBitcode::getAnalysisUsage(AnalysisUsage &AU __attribute__((unused))) const {
  // no dependencies
  return;
}

int CreateIDBitcode::instId = 0;

char CreateIDBitcode::ID = 0; 

static const RegisterPass<CreateIDBitcode> registration("create-ids", "Create bitcode with ids");
