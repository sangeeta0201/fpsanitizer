#include "handleReal.h"
#include <string.h>


extern "C" Real* getReal(void *Addr){
  std::cout<<"getReal starts *********\n";
  size_t AddrInt = (size_t) Addr;
  if(shadowMap.count(AddrInt) != 0){
    Real* real = shadowMap.at(AddrInt);
    std::cout<<"found in map\n";
    std::cout<<"getReal ends\n";
    return real;
  }
  std::cout<<"getReal ends **********\n";
  return NULL;
}

extern "C" void* handleMathFunc(size_t funcCode, void *op1){
  mpfr_t op1_mpfr;
  mpfr_t res_mpfr;
  struct Real* real_res = (struct Real*) malloc (sizeof(struct Real));

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  Real *real1 = getReal(op1);
  switch(funcCode){
    case 1: //sqrt
       std::cout<<"\nSQRT:\n";
       mpfr_sqrt(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
       std::cout<<"\nop1:\n";
       mpfr_out_str (stdout, 10, 0, real1->mpfr_val, MPFR_RNDD);
       std::cout<<"\nres:\n";
       mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
       break;
    default:
      break;
  }
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res));
  std::cout<<"Res Addr:"<<Addr<<"\n";
  mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
  std::cout<<"\n";
  std::cout<<"handleMathFunc ends 1*********\n";
  return real_res;
}
void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2){
  std::cout<<"opCode:"<<opCode<<"\n";
#if 1
  switch(opCode) {                                                                                            
    case 12: //FADD
      std::cout<<"\nFADD\n";
      mpfr_add (*res, *op1, *op2, MPFR_RNDD);
      std::cout<<"\nop1:\n";
      mpfr_out_str (stdout, 10, 0, *op1, MPFR_RNDD);
      std::cout<<"\nop2:\n";
      mpfr_out_str (stdout, 10, 0, *op2, MPFR_RNDD);
      std::cout<<"\nres:\n";
      mpfr_out_str (stdout, 10, 0, *res, MPFR_RNDD);
      break;
    case 14: //FSUB
      std::cout<<"\nFSUB\n";
      mpfr_sub (*res, *op1, *op2, MPFR_RNDD);
      std::cout<<"\nop1:\n";
      mpfr_out_str (stdout, 10, 0, *op1, MPFR_RNDD);
      std::cout<<"\nop2:\n";
      mpfr_out_str (stdout, 10, 0, *op2, MPFR_RNDD);
      std::cout<<"\nres:\n";
      mpfr_out_str (stdout, 10, 0, *res, MPFR_RNDD);
      break;
    case 16: //FMUL
      std::cout<<"\nFMUL\n";
      mpfr_mul (*res, *op1, *op2, MPFR_RNDD);
      std::cout<<"\nop1:\n";
      mpfr_out_str (stdout, 10, 0, *op1, MPFR_RNDD);
      std::cout<<"\nop2:\n";
      mpfr_out_str (stdout, 10, 0, *op2, MPFR_RNDD);
      std::cout<<"\nres:\n";
      mpfr_out_str (stdout, 10, 0, *res, MPFR_RNDD);
      break;
    case 19: //FDIV
      std::cout<<"\nFDIV\n";
      mpfr_div (*res, *op1, *op2, MPFR_RNDD);
      std::cout<<"\nop1:\n";
      mpfr_out_str (stdout, 10, 0, *op1, MPFR_RNDD);
      std::cout<<"\nop2:\n";
      mpfr_out_str (stdout, 10, 0, *op2, MPFR_RNDD);
      std::cout<<"\nres:\n";
      mpfr_out_str (stdout, 10, 0, *res, MPFR_RNDD);
      break;
    default:
      // do nothing
      break;
  } 
#endif
}
extern "C" void* handleOp_1(size_t opCode, void *op1, void *op2){
  std::cout<<"handleOp called 1*********\n";
  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  mpfr_t res_mpfr;
  struct Real* real_res = (struct Real*) malloc (sizeof(struct Real));

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt1 = (size_t) op1;
  std::cout<<"Addr op1:"<<AddrInt1<<"\n";
  size_t AddrInt2 = (size_t) op2;
  std::cout<<"Addr op2:"<<AddrInt2<<"\n";
  Real *real1 = getReal(op1);
  Real *real2 = getReal(op2);
  handleOp(opCode, &(real_res->mpfr_val), &(real1->mpfr_val), &(real2->mpfr_val));
//  mpfr_add (real_res->mpfr_val, real1->mpfr_val, real2->mpfr_val, MPFR_RNDD);
//  mpfr_out_str (stdout, 10, 0, real1->mpfr_val, MPFR_RNDD);
  std::cout<<"\n"; 
//  mpfr_out_str (stdout, 10, 0, real2->mpfr_val, MPFR_RNDD);
  std::cout<<"\n"; 
//  mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
  std::cout<<"\n"; 

  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res));
  std::cout<<"Res Addr:"<<Addr<<"\n";
  mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
  std::cout<<"\n";
  std::cout<<"handleOp ends 1*********\n";
  return real_res;
}
extern "C" void* handleOp_2(size_t opCode, float op1, void *op2){
  std::cout<<"handleOp called 2*********\n";
  mpfr_t op1_mpfr;
  //struct Real* real_res = new Real;
  struct Real* real_res = (struct Real*) malloc (sizeof(struct Real));
  std::cout<<"op1:"<<op1<<"\n";
  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt = (size_t) op2;
  std::cout<<"Addr:"<<AddrInt<<"\n";
  Real *real = getReal(op2);
  mpfr_set_d (op1_mpfr, op1, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(real->mpfr_val), &(op1_mpfr));
 // mpfr_add (real_res->mpfr_val, real->mpfr_val, op1_mpfr, MPFR_RNDD);
  //mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
  std::cout<<"\n"; 
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res));
  std::cout<<"handleOp_2 addr real:"<<Addr<<"\n";
  std::cout<<"handleOp 2 ends*********\n";
  return real_res;
}
extern "C" void* handleOp_3_float(size_t opCode, void *op1, float op2){
  std::cout<<"handleOp called 3*********\n";
  mpfr_t op2_mpfr;
  mpfr_t res_mpfr;
  std::cout<<"op2:"<<op2<<"\n";
  //struct Real* real_res = new Real;
  struct Real* real_res = (struct Real*) malloc (sizeof(struct Real));

  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt = (size_t) op1;
  std::cout<<"Addr:"<<AddrInt<<"\n";
  Real *real = getReal(op1);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(real->mpfr_val), &(op2_mpfr));
  
//  mpfr_add (real_res->mpfr_val, real->mpfr_val, op1_mpfr, MPFR_RNDD);
  //mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
  std::cout<<"\n"; 
  
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res)); 

  std::cout<<"handleOp ends 3*********\n";
  return real_res;
}
extern "C" void* handleOp_3_double(size_t opCode, void *op1, double op2){
  std::cout<<"handleOp called 3*********\n";
  mpfr_t op2_mpfr;
  mpfr_t res_mpfr;
  std::cout<<"op2:"<<op2<<"\n";
  //struct Real* real_res = new Real;
  struct Real* real_res = (struct Real*) malloc (sizeof(struct Real));

  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  size_t AddrInt = (size_t) op1;
  std::cout<<"Addr:"<<AddrInt<<"\n";
  Real *real = getReal(op1);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(real->mpfr_val), &(op2_mpfr));
  
//  mpfr_add (real_res->mpfr_val, real->mpfr_val, op1_mpfr, MPFR_RNDD);
  //mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
  std::cout<<"\n"; 
  
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res)); 

  std::cout<<"handleOp ends 3*********\n";
  return real_res;
}

extern "C" void* handleOp_4(size_t opCode, float op1, float op2){
  std::cout<<"handleOp called 4*********\n";
  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  //struct Real* real_res = new Real;
  struct Real* real_res = (struct Real*) malloc (sizeof(struct Real));

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (op2_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfr_set_d (op1_mpfr, op1, MPFR_RNDD);
  mpfr_set_d (op2_mpfr, op2, MPFR_RNDD);
  handleOp(opCode, &(real_res->mpfr_val), &(op1_mpfr), &(op2_mpfr));
  //mpfr_add (real_res->mpfr_val, op1_mpfr, op2_mpfr, MPFR_RNDD);
  //mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
  std::cout<<"\n"; 

  size_t AddrInt = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real_res)); 

  return real_res;
  std::cout<<"\n**********handleOp 4 ends*********\n";
}

extern "C" void setRealTemp(void *toAddr, void *fromAddr){
  std::cout<<"setRealTemp start***********\n";
  size_t fromAddrInt = (size_t) fromAddr;
  size_t toAddrInt = (size_t) toAddr;
  std::cout<<"fromAddrInt:"<<fromAddrInt<<"\n";
  std::cout<<"toAddrInt:"<<toAddrInt<<"\n";
  if(shadowMap.count(toAddrInt) != 0){ //just copy from one shadow to another if found in map
    std::cout<<"\ntoAddrInt found in map, just updating the value\n";
    Real* fromReal = shadowMap.at(fromAddrInt);
    Real* toReal = shadowMap.at(toAddrInt);
    memcpy(toReal,fromReal, sizeof(struct Real));

    std::cout<<"\ntoReal value:"<<"\n";
    mpfr_out_str (stdout, 10, 0, toReal->mpfr_val, MPFR_RNDD);
    std::cout<<"\nfromReal value:"<<"\n";
    mpfr_out_str (stdout, 10, 0, fromReal->mpfr_val, MPFR_RNDD);
  }
  else{
    if(shadowMap.count(fromAddrInt) != 0){
      Real* fromReal = shadowMap.at(fromAddrInt);
      std::cout<<"found from Addr in map\n";
      struct Real* toReal = new Real;
      mpfr_init2(toReal->mpfr_val, PRECISION);
      memcpy(toReal,fromReal, sizeof(struct Real));
      mpfr_out_str (stdout, 10, 0, toReal->mpfr_val, MPFR_RNDD);
      std::cout<<"\n";
      mpfr_out_str (stdout, 10, 0, fromReal->mpfr_val, MPFR_RNDD);
      std::cout<<"\n";
      shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
    }
    else
      std::cout<<"Neither fromAddr nor toAddr in map\n"; //TODO check what to do here
  }  
  std::cout<<"setRealTemp ends**********8\n";
}

extern "C" void setRealConstant_double(void *Addr, double value){
  std::cout<<"setRealConstant start***********\n";
  size_t AddrInt = (size_t) Addr;
  std::cout<<"Addr:"<<AddrInt<<"\n";
  std::cout<<"value:"<<value<<"\n";
  if(shadowMap.count(AddrInt) != 0){ 
  //Do nothing if found in map, we don't want to replace the value of already saved real variable
    std::cout<<"found in map\n";
  }
  else{
    std::cout<<"Not found in map\n";
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real)); 
  }  
  std::cout<<"setReal ends**********8\n";
}
extern "C" void setRealConstant_float(void *Addr, float value){
  std::cout<<"setRealConstant start***********\n";
  size_t AddrInt = (size_t) Addr;
  std::cout<<"Addr:"<<AddrInt<<"\n";
  std::cout<<"value:"<<value<<"\n";
  if(shadowMap.count(AddrInt) != 0){ 
  //Do nothing if found in map, we don't want to replace the value of already saved real variable
    std::cout<<"found in map\n";
  }
  else{
    std::cout<<"Not found in map\n";
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real)); 
  }  
  std::cout<<"setReal ends**********8\n";
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

  std::cout<<"\nThe shadow value is "<<"\n";
  printReal(realVal);
     
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

void printError(size_t result_A){
  if(shadowMap.count(result_A) != 0){
      Real* resReal = shadowMap.at(result_A);
      std::cout<<"Result using mpfr:\n";
      mpfr_out_str (stdout, 10, 0, resReal->mpfr_val, MPFR_RNDD);
      std::cout<<"\n";

      double ulpsError = updateError(resReal, y);
      std::cout<<"ulpsError:"<<ulpsError<<"\n";
  }
} 
