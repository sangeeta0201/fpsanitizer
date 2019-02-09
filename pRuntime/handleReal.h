#ifndef REAL_HEADER_H
#define REAL_HEADER_H 
#include <iostream>
#include <map>
#include <queue>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include <vector>
#include <stack>
#include <list>
#include <assert.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include "tbb/concurrent_queue.h"
#include "tbb/concurrent_hash_map.h"
#define PRECISION 1000
#define MMAP_FLAGS (MAP_PRIVATE| MAP_ANONYMOUS| MAP_NORESERVE)
#define MAX_STACK_SIZE 1000000000
#define MAX_SIZE 100000000
#define INSSIZE 1000000
#define debug 0
#define debugCR 0
//#define MPFRINIT 100000000 //for spec
#define MPFRINIT 100

const size_t SS_PRIMARY_TABLE_ENTRIES = ((size_t) 4194304);//2^22
const size_t SS_SEC_TABLE_ENTRIES = ((size_t) 64*(size_t) 1024 * (size_t) 1024); // 2^26
//const size_t SS_SEC_TABLE_ENTRIES = ((size_t)4 *(size_t) 1024 * (size_t) 1024); // 2^22

FILE *pFile = fopen ("error.log","w");
FILE *eFile = fopen ("branch.log","w");
FILE *lbmRef = fopen ("ref.log","w");

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
  int initFlag;
  int initMPFRFlag;
  mpfr_t mpfr_val;
};

Real *shadowStack;
Real **shadowMap;

struct Compute{
	size_t opCode;
	size_t op1Addr;
	size_t op2Addr;
	double op1d;
	double op2d;
	float op1f;
	float op2f;
	double computedResd;
	float computedResf;
	size_t insIndex;
	size_t newRegIdx;
	size_t cmd;
	size_t fcmpFlag;
	size_t lineNo;
	bool fcmpRes;
};

bool consumerFlag = false;
size_t funcCount = 0;
bool initFlag = false;
int frameIdx = 0;
size_t newRegIdx = 0;
bool recurFlag = false;
size_t mpfrClear = 0;
size_t mpfrInit = 0;
size_t mpfrClearMap = 0;
size_t mpfrInitMap = 0;
int varCount = 0;
int opCount = 0;
size_t count = 0;
size_t count1 = 0;
size_t count2 = 0;
size_t count3 = 0;
size_t count4 = 0;
size_t count5 = 0;
size_t count6 = 0;

tbb::concurrent_queue<struct Compute*> worker;
tbb::concurrent_queue<struct Compute*> ready1;
tbb::concurrent_queue<struct Compute*> ready2;
tbb::concurrent_queue<struct Compute*> ready3;
tbb::concurrent_queue<struct Compute*> ready4;
tbb::concurrent_queue<struct Compute*> ready5;
tbb::concurrent_queue<struct Compute*> ready6;
std::map<size_t, struct ErrorAggregate*>errorMap;
std::map<size_t, struct BrError*>errBrMap;
//this will link ins index to index of result in shadow mem
//std::list<struct MyShadow*> varTrack;
struct MyShadow *varTrack;
//size_t (*insMap)[100];
size_t *insMap;
size_t *frameCur;
size_t *argCount;
size_t *slotIdx;
size_t *returnIdx;
void* consumer(void *ptr);
void* consumer1(void *ptr);
void* consumer2(void *ptr);
void* consumer3(void *ptr);
void* consumer4(void *ptr);
void* consumer5(void *ptr);
void* consumer6(void *ptr);
void computeReal();

extern "C" void* __get_real_fun_arg(size_t index);
extern "C" size_t __get_addr(void *Addr);
extern "C"  void __init();
extern "C"  void __finish();
extern "C"  void printToFile(void* op1Addr, void* op2Addr, void* op3Addr);
unsigned long ulpd(double x, double y);
unsigned long ulpf(float x, float y);
void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2);
void initializeBrError(BrError *err);
double updateError(mpfr_t mpfr_val, double computedVal, size_t insIndex);
double updateErrorF(mpfr_t mpfr_val, float computedVal, size_t insIndex);
void updateBranchError(bool realRes, bool computedRes, size_t insIndex, size_t lineNo);
void initializeErrorAggregate(ErrorAggregate *eagg);
void printReal(mpfr_t mpfr_val);
void print_trace (void);
void addFunArg(size_t argNo, size_t argAddrInt, double op);
void funcInit();
void funcExit(size_t returnIndex);
void handleFloatToSInt(size_t op1Int, long val, size_t lineNo);
void handleMathFuncF(size_t funcCode, float op1, size_t op1Int,                        										float computedRes, size_t insIndex, size_t newRegIdx);
void handleMathFuncD(size_t funcCode, double op1, size_t op1Int,                       										double computedRes, size_t insIndex, size_t newRegIdx);
void handleMathFunc3Args(size_t funcCode, double op1,                                                                         size_t op1Int, double op2, 
                                          size_t op2Int, double op3, 
                                            size_t op3Int, double computedRes,
                                              size_t insIndex, size_t newRegIdx);
size_t getRegRes(size_t insIndex);
int handleCmp(mpfr_t *op1, mpfr_t *op2);
void handleSelect(void *Addr, size_t insIndex, double op);
void fpSanLoadFromShadowMemF(void *Addr, size_t insIndex, float opf,                                                     bool castFlag, size_t newRegIdx);
void fpSanLoadFromShadowMemD(void *Addr, size_t insIndex, double opd,                           													bool castFlag, size_t newRegIdx);
void checkBranch(double op1, size_t op1Int, double op2, size_t op2Int,                          			size_t fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo);
void setRealConstantD(size_t toAddrInt, double value);
void setRealConstantF(size_t toAddrInt, float value);
void setRealTemp(size_t toAddrInt, size_t fromAddrInt, double op);
void handleCalloc(size_t toAddrInt, size_t size1, size_t size2);
void handleMalloc(size_t toAddrInt, size_t size);
void handleLLVMMemset(size_t toAddrInt, size_t val, size_t size);
void handleLLVMMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size);
int isNaN(mpfr_t real);

#endif
