#include <iostream>
#include <map>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include <vector>
#include <stack>
#include <queue>
#include <list>
#include <assert.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include "tbb/concurrent_queue.h"
#include "tbb/concurrent_unordered_map.h"
#define PRECISION 1000
#define BUFLEN 10000000
#define MMAP_FLAGS (MAP_PRIVATE| MAP_ANONYMOUS| MAP_NORESERVE)
#define MAX_STACK_SIZE 1000000000
#define MAX_SIZE 100000000

using namespace tbb;
struct ErrorAggregate {
  double max_error;
  double total_error;
  long long int num_evals;
};

struct BrError {
  bool corrRes;
  bool incorrRes;
	size_t lineNo;
  long long int num_evals;
};
struct Real{
  mpfr_t mpfr_val;
};

struct MyShadow{
	size_t key;
	struct Real * real;
};

struct ComputeR{
	size_t opCode;
	size_t op1Idx; 
	size_t op2Idx;
	size_t op3Idx;
	float op1f;
	float op2f;
	double op1d;
	double op2d;
	double op3d;
	double computedRes;
	size_t typeId;
	size_t insIndex;
	size_t newRegIdx;
	size_t cmd;
	size_t funcAddrInt;
	size_t returnIdx;
	size_t funcCode;
	size_t fcmpFlag;
	size_t lineNo;
	size_t toAddrInt;
	size_t fromAddrInt;
	size_t size;
	size_t shadowAddr;
};

int perf_fds;  
size_t frameIndex = 1;
size_t count = 1;
double realTT = 0;
double handleExtractValueTT = 0;
double handleMemcpyTT = 0;
double setTempTT = 0;
double getRealReturnTT = 0;
double getRealFunArgTT = 0;
double setRealFunArgTT = 0;
double checkBranchTT = 0;
double computeRealTT = 0;
double handleMathFunc3TT = 0;
double handleMathFuncTT = 0;
double funcExitTT = 0;
double funcInitTT = 0;
double getAddrTT = 0;
double addFunArgTT = 0;
double finishTT = 0;
double initTT = 0;
double handleLLVMMemcpyTT = 0;
double setRealTempTT = 0;
double setRealReturnTT = 0;
double setRealRegTT = 0;
size_t recordHandleExtractValue = 0;
size_t recordHandleMemcpy = 0;
size_t recordSetTemp = 0;
size_t recordSetReturn = 0;
size_t recordGetRealReturn = 0;
size_t recordSetFunArg = 0;
size_t recordGetRealFunArg = 0;
size_t recordSetReal = 0;
size_t recordCmpBranch = 0;
size_t recordComputeR = 0;
size_t recordHandleMath3 = 0;
size_t recordHandleMath = 0;
size_t recordFExit = 0;
size_t recordFInit = 0;
size_t recordAddFunArg = 0;

size_t freed = 0;
size_t alocced = 0;
size_t totalCompute = 0;
bool recurFlag = false;
size_t mpfrClear = 0;
size_t mpfrInit = 0;
int varCount = 0;
int opCount = 0;
size_t funcCount = 0;
size_t currentFunc = 0;
bool consumerFlag = false;
size_t compute = 0;  
double regIndex = 100; //Assuming there are 100 constants, as we are giving index for constants for phi and select from llvm pass 
size_t retIdx = 0;
size_t newRegIdx = -1;
std::map<size_t, struct ErrorAggregate*>errorMap;
std::map<size_t, struct BrError*>errBrMap;
concurrent_queue<struct ComputeR*> buffer;
struct MyShadow *shdStack;
std::map<std::map<size_t, size_t>, size_t> shadowFunArgMap;
concurrent_unordered_map<size_t, size_t> funRetMap;
size_t *insMap;
size_t *indexMap;
size_t *indexToshadowMap;
static inline int advance(volatile size_t *idx);
void fInit(size_t funcAddrInt);
void fExit(size_t funcAddrInt, size_t returnIdx);
void handleMath(size_t funcCode, double op1, size_t op1Int, double computedRes, size_t insIndex, size_t newRegIdx);
void handleMath3Args(size_t funcCode, double op1, size_t op1Int,                                                                                                            
                                                double op2, size_t op2Int,
                                                double op3, size_t op3Int,
                                                double computedRes, size_t insIndex, size_t newRegIdx);
void computeR(size_t opCode, size_t op1Idx, size_t op2Idx, float op1f, float op2f,                                                                                          
                                    double op1d, double op2d, double computedRes,
                                    size_t typeId, size_t insIndex, size_t newRegIdx);
void compareBranch(double op1, size_t op1Int, double op2, size_t op2Int,                                                                                                    
                            int fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo);
extern "C" size_t getRegRes(size_t insIndex);
size_t getNewRegIndex();
void fini();
void initMain();
void setReal(size_t index, double value);
void setFunArg(size_t shadowAddr, size_t toAddrInt, double op);
void setReturn(size_t toAddrInt, size_t funAddr);
void setTemp(size_t toAddrInt, size_t fromAddrInt, double op);
void setConstant(size_t toAddrInt, double op);
void handleMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size);
void addRegRes(size_t insIndex, size_t resRegIndex);
void printReal(mpfr_t mpfr_val);
double getDouble(Real *real);
void* consumer(void *ptr);
unsigned long ulpd(double x, double y);
void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2);
int isNaN(Real *real);
void initializeBrError(BrError *err);
double updateError(Real *realVal, double computedVal, size_t insIndex);
void updateBranchError(bool realRes, bool computedRes, size_t insIndex, size_t lineNo);
void initializeErrorAggregate(ErrorAggregate *eagg);
/*
When we compute any floating point operation on real, we save the result in shadow map with its value 
and return the address of this saved value to LLVM Pass. LLVM pass creates the mapping of real result and 
floating result. Wherever floating result is used, we use real result to compute the parallel operation in real.
Whenever store is called to save the value of temp into variable, we call setRealTemp. This function save the real operation 
result into variable.  
we create a ma
For every store, we call setRealConstant if  store is storing constant to some variable. 
We create shadow space for this variable, which is address of varaible and the real constant 
of this variable.
It 
*/
//extern "C" void setRealTemp(void *toAddr, void *fromAddr);

/*
For every store, we call setRealConstant if  store is storing constant to some variable. 
We create shadow space for this variable, which is address of varaible and the real constant 
of this variable.
It 
*/
extern "C" void setRealConstant_float(void *Addr, float value);
extern "C" void setRealConstant_double(void *Addr, double value);
