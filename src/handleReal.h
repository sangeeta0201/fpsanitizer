#include <iostream>
#include <map>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include <vector>

#define PRECISION 100

double regIndex = 200; //assuming there are 200 constants in the program
std::map<std::map<std::map<double, double>, size_t>, double>shadowRegResMap;
std::map<std::map<size_t, size_t>, size_t> shadowFunArgMap; // thi will link function argument to shadowMap
std::map<size_t, struct Real*> shadowMap;
std::map<double, struct Real*> shadowRegMap;
struct Real{
  mpfr_t mpfr_val;
};

double getDouble(Real *real);
unsigned long ulpd(double x, double y);
void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2);
double updateError(Real *realVal, double computedVal);

extern "C" double getNewRegIndex();
extern "C" void* handleOp_1(size_t opCode, void *op1, void *op2);
extern "C" void* handleOp_2_f(size_t opCode, float op1, void *op2);
extern "C" void* handleOp_2_d(size_t opCode, double op1, void *op2);
extern "C" void* handleOp_3(size_t opCode, void *op1, float op2);
extern "C" void* handleOp_4_ff(size_t opCode, float op1, float op2);
extern "C" void* handleOp_4_fd(size_t opCode, float op1, double op2);
extern "C" void* handleOp_4_df(size_t opCode, double op1, float op2);
extern "C" void* handleOp_4_dd(size_t opCode, double op1, double op2);
extern "C" double handleOp_rd(size_t opCode, double regIndex, double op2);
extern "C" double setRealReg(double index, double value);
extern "C" void addFunArg(size_t argNo, void *funAddr, void *argAddr);
extern "C" void printErrorF(size_t result_A, float y);
extern "C" void printErrorD(size_t result_A, double y);
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
