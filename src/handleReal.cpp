#include "handleReal.h"
#include <string.h>

/*TODO : 
1. Handle all math functions
2. Clean up shadow
*/

extern "C" Real* getReal(void *Addr){
//  std::cout<<"getReal starts *********\n";
  size_t AddrInt = (size_t) Addr;
  if(shadowMap.count(AddrInt) != 0){
    Real* real = shadowMap.at(AddrInt);
  //  std::cout<<"found in map\n";
   // std::cout<<"getReal ends\n";
    return real;
  }
 // std::cout<<"getReal ends **********\n";
  return NULL;
}

extern "C" void* handleMathFunc(size_t funcCode, void *op1){
  mpfr_t op1_mpfr;
  mpfr_t res_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  Real *real1 = getReal(op1);
  switch(funcCode){
    case 1: //sqrt
       mpfr_sqrt(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
       break;
    default:
      break;
  }
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res));
  return real_res;
}
void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2){
#if 1
  switch(opCode) {                                                                                            
    case 12: //FADD
      mpfr_add (*res, *op1, *op2, MPFR_RNDD);
      break;
    case 14: //FSUB
      mpfr_sub (*res, *op1, *op2, MPFR_RNDD);
      break;
    case 16: //FMUL
      mpfr_mul (*res, *op1, *op2, MPFR_RNDD);
      break;
    case 19: //FDIV
      mpfr_div (*res, *op1, *op2, MPFR_RNDD);
      break;
    default:
      // do nothing
      break;
  } 
#endif
}
extern "C" void* handleOp_1(size_t opCode, void *op1, void *op2){
  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  mpfr_t res_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt1 = (size_t) op1;
  size_t AddrInt2 = (size_t) op2;
  Real *real1 = getReal(op1);
  Real *real2 = getReal(op2);
  handleOp(opCode, &(real_res->mpfr_val), &(real1->mpfr_val), &(real2->mpfr_val));

  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res));
  return real_res;
}

extern "C" void* handleOp_2_f(size_t opCode, float op1, void *op2){
  mpfr_t op1_mpfr;
  struct Real* real_res = new Real;
  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt = (size_t) op2;
  Real *real = getReal(op2);
  if(real != NULL){
    mpfr_set_d (op1_mpfr, op1, MPFR_RNDD);
    handleOp(opCode, &(real_res->mpfr_val), &(real->mpfr_val), &(op1_mpfr));
    std::cout<<"\n"; 
    size_t Addr = (size_t) real_res;
    shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res));
  }
  else
    std::cout<<"Error!!! Address "<< AddrInt <<" not found in shadow memory\n";
  return real_res;
}

extern "C" void* handleOp_2_d(size_t opCode, double op1, void *op2){
  mpfr_t op1_mpfr;
  struct Real* real_res = new Real;
  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt = (size_t) op2;
  Real *real = getReal(op2);
  mpfr_set_d (op1_mpfr, op1, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(real->mpfr_val), &(op1_mpfr));
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res));
  return real_res;
}
extern "C" void* handleOp_3_f(size_t opCode, void *op1, float op2){
  mpfr_t op2_mpfr;
  mpfr_t res_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt = (size_t) op1;
  Real *real = getReal(op1);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(real->mpfr_val), &(op2_mpfr));
  
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res)); 

  return real_res;
}
extern "C" void* handleOp_3_d(size_t opCode, void *op1, double op2){
  mpfr_t op2_mpfr;
  mpfr_t res_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt = (size_t) op1;
  Real *real = getReal(op1);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(real->mpfr_val), &(op2_mpfr));
  
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res)); 

  return real_res;
}

extern "C" void* handleOp_4_ff(size_t opCode, float op1, float op2){
  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfr_set_d (op1_mpfr, op1, MPFR_RNDD);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(op1_mpfr), &(op2_mpfr));

  size_t AddrInt = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real_res)); 

  return real_res;
}

extern "C" void* handleOp_4_fd(size_t opCode, float op1, double op2){
  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfr_set_d (op1_mpfr, op1, MPFR_RNDD);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);

  handleOp(opCode, &(real_res->mpfr_val), &(op1_mpfr), &(op2_mpfr));

  size_t AddrInt = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real_res)); 

  return real_res;
  //std::cout<<"\n**********handleOp 4 ends*********\n";
}

extern "C" void* handleOp_4_df(size_t opCode, double op1, float op2){
  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfr_set_d (op1_mpfr, op1, MPFR_RNDD);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(op1_mpfr), &(op2_mpfr));

  size_t AddrInt = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real_res)); 

  return real_res;
}
extern "C" void* handleOp_4_dd(size_t opCode, double op1, double op2){
  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfr_set_d (op1_mpfr, op1, MPFR_RNDD);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(op1_mpfr), &(op2_mpfr));

  size_t AddrInt = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real_res)); 

  return real_res;
}

extern "C" void addFunArg(size_t argNo, void *funAddr, void *argAddr){
  size_t funAddrInt = (size_t) funAddr;
  size_t argAddrInt = (size_t) argAddr;

  
//  shadowFunArgMap.insert(std::pair<size_t, std::map<size_t, size_t>>(funAddrInt, {argNo, argAddrInt})); 
  std::map<size_t, size_t> data;
  data.insert(std::pair<size_t, size_t>(funAddrInt, argNo));
  shadowFunArgMap.insert(std::pair<std::map<size_t, size_t>, size_t>(data, argAddrInt));

  std::cout<<"addFunArg: updated\n";
}

extern "C" void setRealFunArg(size_t index, void *funAddr, void *toAddr/*store 2nd operand*/){
  size_t funAddrInt = (size_t) funAddr;
  size_t toAddrInt = (size_t) toAddr;
  size_t shadowAddr;
  std::cout<<"setRealFunArg starts****\n";
  std::vector<size_t>::iterator it; 
  std::map<size_t, size_t> shadowAddrMap;
  shadowAddrMap.insert(std::pair<size_t, size_t>(funAddrInt, index));
  if(shadowFunArgMap.count(shadowAddrMap) != 0){ 
    std::cout<<"setRealFunArg: found in shadowFunArgMap\n";

    size_t shadowAddr = shadowFunArgMap.at(shadowAddrMap);

      std::cout<<"setRealFunArg: shadowAddr:"<<shadowAddr<<"\n";
      if(shadowMap.count(shadowAddr) != 0){
        Real* fromReal = shadowMap.at(shadowAddr);

        struct Real* toReal = new Real;
        memcpy(toReal,fromReal, sizeof(struct Real));
        shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
        std::cout<<"setRealFunArg: shadow mem update:"<<toAddrInt<<"\n";
      }

  }
}

extern "C" void setRealTemp(void *toAddr, void *fromAddr){
  size_t fromAddrInt = (size_t) fromAddr;
  size_t toAddrInt = (size_t) toAddr;
  if(shadowMap.count(toAddrInt) != 0){ //just copy from one shadow to another if found in map
    Real* fromReal = shadowMap.at(fromAddrInt);
    Real* toReal = shadowMap.at(toAddrInt);
    memcpy(toReal,fromReal, sizeof(struct Real));
  }
  else{
    if(shadowMap.count(fromAddrInt) != 0){
      Real* fromReal = shadowMap.at(fromAddrInt);
      struct Real* toReal = new Real;
      mpfr_init2(toReal->mpfr_val, PRECISION);
      memcpy(toReal,fromReal, sizeof(struct Real));
      shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
    }
//    else
//      std::cout<<"fromAddr and toAddr not found in map\n"; //TODO check what to do here
  }  
}

extern "C" void setRealConstant_double(void *Addr, double value){
  size_t AddrInt = (size_t) Addr;
  if(!shadowMap.count(AddrInt)){ //if not in map
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real)); 
  }  
}
extern "C" void setRealConstant_float(void *Addr, float value){
  size_t AddrInt = (size_t) Addr;
  std::cout<<"Addr:"<<AddrInt<<"\n";
  std::cout<<"value:"<<value<<"\n";
  if(!shadowMap.count(AddrInt)){ //not in map
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real)); 
  }  
}

double getDouble(Real *real){  
  return mpfr_get_d(real->mpfr_val, MPFR_RNDN);
}

void printReal(Real *real){
  char* shadowValStr;
  mpfr_exp_t shadowValExpt;

  shadowValStr = mpfr_get_str(NULL, &shadowValExpt, 10, 15, real->mpfr_val, MPFR_RNDN);
  printf("%c.%se%ld", shadowValStr[0], shadowValStr+1, shadowValExpt-1);
  mpfr_free_str(shadowValStr);
} 

unsigned long ulpd(double x, double y){
  if (x == 0) x = 0; // -0 == 0
  if (y == 0) y = 0; // -0 == 0

  /* if (x != x && y != y) return 0; */
  if (x != x) return ULLONG_MAX - 1; // Maximum error
  if (y != y) return ULLONG_MAX - 1; // Maximum error

  long long xx = *((long long*) &x);
  xx = xx < 0 ? LLONG_MIN - xx : xx;

  long long yy = *((long long*) &y);
  yy = yy < 0 ? LLONG_MIN - yy : yy;

  return xx >= yy ? xx - yy : yy - xx;
}

void ppFloat(double val){                                                                                                         
  int i = 0;
  if (val != val){
    printf("+nan.0");
  } else if (val == INFINITY){
    printf("+inf.0");
  } else if (val == -INFINITY){
    printf("-inf.0");
  } else if (val > 0 && val < 1){
    while (val < 1) {
      val *= 10;
      i++;
    }
    printf("%fe-%d", val, i);
  } else if (val < 0 && val > -1){
    while (val > -1) {
      val *= 10;
      i++;
    }
    printf("%fe-%d", val, i);
  } else if (val >= 9.9999999){
    while (val >= 9.9999999){
      val /= 10;
      i++;
    }
    printf("%fe%d", val, i);
  } else if (val <= -9.9999999){
    while (val <= -9.9999999){
      val /= 10;
      i++;
    }
    printf("%fe%d", val, i);
  } else {
    printf("%f", val);
  }
}
double updateError(Real *realVal, double computedVal){
  double shadowRounded = getDouble(realVal);
  unsigned long ulpsError = ulpd(shadowRounded, computedVal);

  double bitsError = log2(ulpsError + 1);


  // Debug printing code

//  std::cout<<"\nThe shadow value is "<<"\n";
 // printReal(realVal);
     
  if (shadowRounded != shadowRounded){
    printf("The rounded shadow value is NaN");
  } else {
    printf("The rounded shadow value is ");
    ppFloat(shadowRounded);
  }
  if (computedVal != computedVal){
    printf(", but NaN was computed.\n");
  } else {
      printf(", but ");
      ppFloat(computedVal);
      printf(" was computed.\n");
    }
    printf("%f bits error (%llu ulps)\n",
                bitsError, ulpsError);
  return bitsError;
}

void printError(size_t result_A, double y){
  if(shadowMap.count(result_A) != 0){
      Real* resReal = shadowMap.at(result_A);
      std::cout<<"Result using mpfr:\n";
      mpfr_out_str (stdout, 10, 0, resReal->mpfr_val, MPFR_RNDD);
      std::cout<<"\n";

      double ulpsError = updateError(resReal, y);
      std::cout<<"ulpsError:"<<ulpsError<<"\n";
  }
} 
