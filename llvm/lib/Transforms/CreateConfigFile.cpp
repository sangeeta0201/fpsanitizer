#include "CreateConfigFile.hpp"
#include "CreateIDBitcode.hpp"

#include <llvm/IR/DebugInfo.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/ValueSymbolTable.h>
#include <llvm/Support/FileSystem.h>
#include <fstream>
#include <sstream>

using namespace llvm;

cl::opt<string> FileName("filename", cl::value_desc("filename"), cl::desc("The file name"), cl::init("file.json"));
cl::opt<string> ExcludedFunctionsFileName("exclude", cl::value_desc("filename"), cl::desc("List of functions to exclude (if in dependencies)"), cl::init("exclude.txt"));
cl::opt<string> IncludedFunctionsFileName("include", cl::value_desc("filename"), cl::desc("List of functions to include (dependencies)"), cl::init("include.txt"));
cl::opt<string> IncludedGlobalVarsFileName("include_global_vars", cl::value_desc("filename"), cl::desc("List of global variables to include"), cl::init("include_global.txt"));
cl::opt<string> ExcludedLocalVarsFileName("exclude_local_vars", cl::value_desc("filename"), cl::desc("List of local variables to exclude"), cl::init("exclude_local.txt"));
cl::opt<bool> PythonFormat("pformat", cl::value_desc("flag"), cl::desc("Use python format"), cl::init(false));
cl::opt<bool> ListOperators("ops", cl::value_desc("flag"), cl::desc("Print operators"), cl::init(false));
cl::opt<bool> ListFunctions("funs", cl::value_desc("flag"), cl::desc("Print functions"), cl::init(false));
cl::opt<bool> OnlyScalars("only-scalars", cl::value_desc("flag"), cl::desc("Print only scalars"), cl::init(false));
cl::opt<bool> OnlyArrays("only-arrays", cl::value_desc("flag"), cl::desc("Print only arrays"), cl::init(false));

static void printDimensions(vector<unsigned> &dimensions, raw_fd_ostream &outfile) {
  for(unsigned i = 0; i < dimensions.size(); i++) {
    outfile << "[" << dimensions[i] << "]";
  }
  return;
}


static void printType(Type *type, char* strType) {
  unsigned int typeID = type->getTypeID();
  
  switch(typeID) {
  case Type::FloatTyID: 
    strcpy(strType, "float");
    break;

  case Type::DoubleTyID: 
    strcpy(strType, "double");
    break;

  case Type::X86_FP80TyID: // long double
    strcpy(strType, "longdouble");
    break;

  case Type::PPC_FP128TyID:
    strcpy(strType, "WARNING: PPC_FP128");
    break;

  case Type::IntegerTyID:
    strcpy(strType, "int");
    break;	

  case Type::PointerTyID: {
    PointerType *pointer = dyn_cast<PointerType>(type);
    Type *elementType = pointer->getElementType();
    printType(elementType, strType);
    strcat(strType, "*");
    break;
  }

  case Type::StructTyID:
    strcpy(strType, "struct");
    break;

  case Type::ArrayTyID: {    
    vector<unsigned> dimensions;
    while(ArrayType* arrayType = dyn_cast<ArrayType>(type)) {
      type = arrayType->getElementType();
      dimensions.push_back(arrayType->getNumElements());
    }
    
    if (type->isFloatingPointTy()) {
      unsigned int typeID = type->getTypeID();
      
      switch(typeID) {
      case Type::FloatTyID:       
        strcpy(strType, "float");
	      //printDimensions(dimensions, outfile);
	      break;
	
      case Type::DoubleTyID: 
        strcpy(strType, "double");
//	      printDimensions(dimensions, outfile);
	      break;
	  
      case Type::X86_FP80TyID:
        strcpy(strType, "longdouble");
	      //printDimensions(dimensions, outfile);
	      break;
	
      default:
	      break;
      }
    }
    else {
      //strcpy(strType, *type); //TODO: check later
      //outfile <<  *type;
  //    printDimensions(dimensions, outfile);
    }
    break;
  }
    
  default:
    errs() << "WARNING: Variable of type " << *type << "\n";
    break;
    
  }
  return ;
}


static string getID(Instruction &inst) {
  string id = "";
  if (MDNode *node = inst.getMetadata("corvette.inst.id")) {
    if(node){
      MDString *mdstring = cast<MDString>(node->getOperand(0));
      id = mdstring->getString();
    }
  }
  else {
    errs() << "WARNING: Did not find metadata\n";
  }

  return id;
}


static bool isFPArray(Type *type) {
  if (ArrayType *array = dyn_cast<ArrayType>(type)) {
    type = array->getElementType();
    if (type->isFloatingPointTy()) {
      return true;
    }
    else {
      return isFPArray(type);
    }
  }
  else if (PointerType *pointer = dyn_cast<PointerType>(type)) {
    type = pointer->getElementType();
    if (type->isFloatingPointTy()) {
      return true;
    }
    else {
      return isFPArray(type);
    }
  }
  return false;
}

map<std::string, StrChange*> CreateConfigFile::getChanges() {
  return changes;
}

void CreateConfigFile::findGlobalVariables(Module &module, map<string, StrChange*> &changes) {
  char strType[1000] = {'\0'};
  char myName[1000] = {'\0'}; 

  for (Module::global_iterator it = module.global_begin(); it != module.global_end(); it++) {
    Value *value = &*it;
    if (GlobalVariable *global = dyn_cast<GlobalVariable>(value)) {
      string name = global->getName();

      if (includedGlobalVars.find(name) != includedGlobalVars.end()) {
	      PointerType* pointerType = global->getType();      
	      Type* elementType = pointerType->getElementType();
	
	      if ((OnlyScalars && elementType->isFloatingPointTy()) ||
	        (OnlyArrays && isFPArray(elementType)) || 
	        (!OnlyScalars && !OnlyArrays)) {
	  
	        if (name.find('.') == string::npos) {
            strcpy(myName, global->getName().str().c_str());
	          printType(elementType, strType);
	        }
	      }
      }
    }
  }
  string idStr(myName);
  StrChange *change = new StrChange("globalVar", string(strType), -1);
  changes[idStr] = change;
  return;
}


bool CreateConfigFile::doInitialization(Module &) {
  ifstream inFile(ExcludedFunctionsFileName.c_str());
  string name;
  
  // reading functions to ignore
  if (!inFile) {
    errs() << "Unable to open " << ExcludedFunctionsFileName << '\n';
    exit(1);
  }
  
  while(inFile >> name) {
    excludedFunctions.insert(name);
  }
  inFile.close();
  
  // reading functions to include
  inFile.open (IncludedFunctionsFileName.c_str(), ifstream::in);
  if (!inFile) {
    errs() << "Unable to open " << IncludedFunctionsFileName << '\n';
    exit(1);
  }
  
  while(inFile >> name) {
    includedFunctions.insert(name);
  }
  inFile.close();

  // reading global variables to include
  inFile.open (IncludedGlobalVarsFileName.c_str(), ifstream::in);
  if (!inFile) {
    errs() << "Unable to open " << IncludedGlobalVarsFileName << '\n';
    exit(1);
  }
  
  while(inFile >> name) {
    includedGlobalVars.insert(name);
  }
  inFile.close();

  // reading local variables to exclude
  // assuming unique names given by LLVM, so no need to include function name
  inFile.open (ExcludedLocalVarsFileName.c_str(), ifstream::in);
  while(inFile >> name) {
    excludedLocalVars.insert(name);
  }
  inFile.close();


  if (PythonFormat) {
    errs() << "Using python format\n";
  }
  else {
    errs() << "NOT using python format\n";
  }
  
  // populating function calls
  functionCalls.insert("log");
  //functionCalls.insert("sqrt");
  functionCalls.insert("cos"); //FT
  functionCalls.insert("sin"); //FT
  functionCalls.insert("acos"); //funarc

  return false;
}


bool CreateConfigFile::runOnModule(Module &module) {
  doInitialization(module);
  
  map<string, StrChange*> changes;

  findGlobalVariables(module, changes);

  for(Module::iterator f = module.begin(), fe = module.end(); f != fe; f++) {
    string name = f->getName().str();
    if (!f->isDeclaration() && (includedFunctions.find(name) != includedFunctions.end()) && (excludedFunctions.find(name) == excludedFunctions.end())) {
      runOnFunction(*f, changes);
    }
  }

  return false;
}  


static Type* findLocalType(Value *value) {
  Type *type = NULL;
  if (AllocaInst* alloca = dyn_cast<AllocaInst>(value)) {
    type = alloca->getAllocatedType();
  }
  else if (Argument* arg = dyn_cast<Argument>(value)) {
    type = arg->getType();
  }
  return type;
}


void CreateConfigFile::findLocalVariables(Function &function, map<string, StrChange*> &changes) {
  char strType[100] = {'\0'};
  char id[100] = {'\0'};
  char myName[100] = {'\0'};
  char func[100] = {'\0'};
  char field[2] = {'\0'};
  int iField = -1;

  const ValueSymbolTable *symbolTable = function.getValueSymbolTable();
  ValueSymbolTable::const_iterator it = symbolTable->begin();
  
  for(; it != symbolTable->end(); it++) {
    Value *value = it->second;
    string name = value->getName();

    if (excludedLocalVars.find(name) == excludedLocalVars.end()) {
      Type *type = findLocalType(value);

      if (type) {	
	      if ((OnlyScalars && type->isFloatingPointTy()) ||
	          (OnlyArrays && isFPArray(type)) || 
	          (!OnlyScalars && !OnlyArrays)) {
	  
	        if (value->getName().find('.') == string::npos) {
	          if (Instruction *i = function.getEntryBlock().getTerminator()) {
	            if (MDNode *node = i->getMetadata("dbg")) {
		            DILocation *loc = i->getDebugLoc();
		            //outfile << "\t\t\"file\": \"" << loc->getFilename() << "\",\n";
	            }
	          }
            strcpy(func, function.getName().str().c_str());	    
            strcpy(myName, value->getName().str().c_str());	    
	          printType(type, strType);
	        }
	      }
      }
    } 
  }
  strcpy(id, myName);
  strcat(id, "@");
  strcat(id, func);
  string idStr(id);

  StrChange *change = new StrChange("localVar", string(strType), iField);
  changes[idStr] = change;
  return;
}


void CreateConfigFile::findOperators(Function &function, map<string, StrChange*> &changes) {
  char myName[100] = {'\0'};
  char func[100] = {'\0'};
  char id[100] = {'\0'};
  char file[100] = {'\0'};
  char line[100] = {'\0'};
  char strType[1000] = {'\0'};

  for(Function::iterator b = function.begin(), be = function.end(); b != be; b++) {
    for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {

      if (BinaryOperator *binOp = dyn_cast<BinaryOperator>(i)) {
	      switch(binOp->getOpcode()){
	        case Instruction::FAdd:
	        case Instruction::FSub:
	        case Instruction::FMul:
	        case Instruction::FDiv: 
            strcpy(id, getID(*i).c_str());  
            strcpy(func, function.getName().str().c_str());  
            strcpy(myName, binOp->getOpcodeName());  
	          printType(binOp->getType(), strType);
	          break;
	        
	        default:
	          // do nothing
	          break;
        }
      }
      else if (FCmpInst *fcmp = dyn_cast<FCmpInst>(i)){

        strcpy(id, getID(*i).c_str());  
        strcpy(func, function.getName().str().c_str());  
        strcpy(myName, fcmp->getOpcodeName());  
	      printType(fcmp->getOperand(0)->getType(), strType);
	
      }
    }
  }
  string idStr(id);
  StrChange *change = new StrChange("op", string(strType), -1);
  changes[idStr] = change;
  return;
}


void CreateConfigFile::findFunctionCalls(Function &function, map<string, StrChange*> &changes) {
  char strType[1000] = {'\0'};
  char myName[100] = {'\0'};
  char func[100] = {'\0'};
  char id[100] = {'\0'};
  char file[100] = {'\0'};
  char line[100] = {'\0'};
  char swit[100] = {'\0'};

  for(Function::iterator b = function.begin(), be = function.end(); b != be; b++) {
    for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {

      if (CallInst *callInst = dyn_cast<CallInst>(i)) {
        Function *callee = callInst->getCalledFunction();

	      if (callee) {
          string name = callee->getName();
          if (functionCalls.find(name) != functionCalls.end()) {
            strcpy(id, getID(*i).c_str());  
            strcpy(func, function.getName().str().c_str());  
            strcpy(myName, name.c_str()); 
            strcpy(swit, name.c_str()); 
            strcpy(strType, "double, double"); 
	        }
        }
      }
    }
  }
  string idStr(id);
  FuncStrChange *change = new FuncStrChange("call", string(strType), -1, string(swit));
  changes[idStr] = change;

  return;
}

bool CreateConfigFile::runOnFunction(Function &function, map<string, StrChange*> &changes) {
  findLocalVariables(function, changes);

  if (ListOperators) {
    findOperators(function, changes);
  }

  if (ListFunctions) {
    findFunctionCalls(function, changes);
  }
  return false;
}


void CreateConfigFile::getAnalysisUsage(AnalysisUsage &AU) const {
  AU.setPreservesAll();
  AU.addRequired<CreateIDBitcode>();
}


char CreateConfigFile::ID = 0;
static const RegisterPass<CreateConfigFile> registration("config-file", "Creating a config file with original types");

