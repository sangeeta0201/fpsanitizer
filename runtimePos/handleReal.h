#include <iostream>
#include <map>
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
#include "softposit.h"
#define PRECISION 1000
#define BUFLEN 10000000
#define MMAP_FLAGS (MAP_PRIVATE| MAP_ANONYMOUS| MAP_NORESERVE)
#define MAX_STACK_SIZE 1000000000
#define MAX_SIZE 100000000

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
size_t argCount = 0;
int frameIdx = 0;
int slotIdx = -1;
int returnIdx = -1;
size_t newRegIdx = 0;
bool recurFlag = false;
size_t mpfrClear = 0;
size_t mpfrInit = 0;
int varCount = 0;
int opCount = 0;
size_t funcCount = 0;
std::map<size_t, struct ErrorAggregate*>errorMap;
std::map<size_t, struct BrError*>errBrMap;
//this will link ins index to index of result in shadow mem
//std::list<struct MyShadow*> varTrack;
struct MyShadow *varTrack;
posit32_t *shadowStack;
posit32_t *shadowMap;
size_t *insMap;
size_t *frameCur; 
std::stack<size_t> retTrack;
std::map<size_t, size_t>funRetMap;

std::map<std::map<size_t, size_t>, size_t> shadowFunArgMap; // thi will link function argument to shadowMap

double getDouble(posit32_t val);
unsigned long ulpd(double x, double y);
void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2);
int isNaN(Real *real);
void initializeBrError(BrError *err);
double updateError(posit32_t val, double computedVal, size_t insIndex);
void updateBranchError(bool realRes, bool computedRes, size_t insIndex, size_t lineNo);
void initializeErrorAggregate(ErrorAggregate *eagg);
void printReal(Real *real);
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
