//===------------ RaceDetector.h - How to use the LoopInfo analysis -----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This pass finds all the aliasing pairs of pointers in a program.
//
// Author: Victor Hugo Sperle Campos.
// Date: January 12th, 2015.
// Usage: opt -load Obfuscator.dylib -obfZero input.bc -o output.bc
//
//===----------------------------------------------------------------------===//

#ifndef ALIASSET_H_
#define ALIASSET_H_
#include<set>

#define DEBUG_TYPE "RaceDetector"

using namespace llvm;

namespace {

  template<class T>
    struct DisjointSets {

      typedef DenseMap<T, unsigned> NodeMap;
      // Alias set
      typedef SetVector<T> PointersList;

      // Alias set list
      typedef SmallVector<PointersList, 4> AliasSetList;

      // Maps values to their identifier in the IntEqClasses structure
      NodeMap valuemap;
      // DisjointSets of unsigneds, provided by LLVM
      IntEqClasses eq;

      AliasSetList asl;

      // Constructs structure based on a list of pointers input
      DisjointSets(const PointersList& l);

      // Add a new value to the disjoint sets structure
      bool add(T V);
      unsigned findset(T V1); 
      // Gets two values and union-find them
      // If either of them is not known, raise assertion failure
      void unionfind(T V1, T V2);

      // Prepare alias sets to be iterated. Only call this function after ALL
      // union-finding has been done
      void finish();

      size_t size()
      {
        // assert(asl.size() > 0);

        return asl.size();
      }

      typedef typename AliasSetList::iterator iterator;

      iterator begin()
      {
        assert(asl.size() > 0);

        return this->asl.begin();
      }
      iterator end()
      {
        return this->asl.end();
      }

    };

  struct RaceDetector: public ModulePass {
    static char ID;

    RaceDetector() :
      ModulePass(ID)
    {
      this->AA = 0;
      this->sets = 0;
    }

    ~RaceDetector()
    {
      delete this->sets;
    }

    virtual bool runOnModule(Module& M);
    bool checkAlias(Function *F);
    void joinParams(llvm::Argument* formal_param);
    void joinReturn(llvm::Value* formal_return, Function *F);
    virtual void getAnalysisUsage(AnalysisUsage& AU) const;
    void initializeCallbacks(Module &M);
    bool instrumentLoadOrStore(const DataLayout &DL, Function &F);
    bool instrumentLoadOrStoreGlobal(const DataLayout &DL, Function &F);
    bool getAnnotatedSet(
                                            const DataLayout &DL, Function &F);
    bool checkForAlias(Instruction *I);
    bool instrumentAliasLoadOrStore(Instruction *I, const DataLayout &DL, Function &F);
    void chooseInstructionsToInstrument(const DataLayout &DL);
    bool addrPointsToConstantData(Value *Addr);
    bool instrumentFunctions(StringRef fn_name);
    bool hasAnnotation(Instruction* i, Value *V, StringRef Ann, uint8_t level);
    void printSets();
    SmallVector<Instruction*, 8> AnnotatedLoadsAndStores;
    SmallVector<Instruction*, 8> AliasLoadsAndStores;
      SmallVector<Instruction*, 8> LocalLoadsAndStores;
      SmallVector<Instruction*, 8> MyLoadsAndStores;
    std::set<unsigned> AnnotatedSet; 
    Value *Print;
    Value *GetCurTid;
    Value* MyRecordMem;

    AliasAnalysis* AA;
    DisjointSets<Value*>* sets;
    // For a given element V, return the set ID which contains V
    int getSetIDForPointer(Value *V) const
    {
  #if 1
      if(this->sets->asl.size() > 0){
        DisjointSets<Value*>::NodeMap::iterator mit = sets->valuemap.find(V);
        if(mit != sets->valuemap.end())
          return sets->eq[mit->second];
        else
          return -1;
      }
      else
        return -1;
  #endif
 //     assert(this->sets->asl.size() > 0);
  //    DisjointSets<Value*>::NodeMap::iterator mit = sets->valuemap.find(V);
  //    assert(mit != sets->valuemap.end());
  //    return sets->eq[mit->second];
    }
    // Return an alias set given the input set ID.
    const DisjointSets<Value*>::PointersList& getAliasSet(unsigned setid) const
    {
      return this->sets->asl[setid];
    }
    // Alias Sets iterators
    typedef DisjointSets<Value*>::iterator iterator;
    iterator begin(){
      return sets->begin();
    }
    iterator end(){
      return sets->end();
    }
  };
}

#endif
