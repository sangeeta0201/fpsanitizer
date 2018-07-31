#include <iostream>
#include <map>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>

#define PRECISION 200

std::map<size_t, struct Real*> shadowMap;
struct Real{
  mpfr_t mpfr_val;
};

double getDouble(Real *real);
unsigned long ulpd(double x, double y);
void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2);
double updateError(Real *realVal, double computedVal);
void printError(size_t result_A, double y);

extern "C" void* handleOp_1(size_t opCode, void *op1, void *op2);
extern "C" void* handleOp_2(size_t opCode, float op1, void *op2);
extern "C" void* handleOp_3(size_t opCode, void *op1, float op2);
extern "C" void* handleOp_4(size_t opCode, float op1, float op2);
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
extern "C" void setRealTemp(void *toAddr, void *fromAddr);

/*
For every store, we call setRealConstant if  store is storing constant to some variable. 
We create shadow space for this variable, which is address of varaible and the real constant 
of this variable.
It 
*/
extern "C" void setRealConstant_float(void *Addr, float value);
extern "C" void setRealConstant_double(void *Addr, double value);
