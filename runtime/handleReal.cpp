#include "handleReal.h"
#include <string.h>

/*TODO : 
1. Handle all math functions
2. Clean up shadow
*/

extern "C" size_t getNewRegIndex(){
  regIndex += 1;
  return regIndex;
}

extern "C" Real* getReal(void *Addr){
  size_t AddrInt = (size_t) Addr;
  if(shadowMap.count(AddrInt) != 0){
    Real* real = shadowMap.at(AddrInt);
    return real;
  }
  return NULL;
}

extern "C" Real* getRealReg(size_t index){
  if(shadowMap.count(index) != 0){
    Real* real = shadowMap.at(index);
    return real;
  }
  return NULL;
}

extern "C" void addFunArg(size_t argNo, void *funAddr, void *argAddr){
  size_t funAddrInt = (size_t) funAddr;
  size_t argAddrInt = (size_t) argAddr;

  std::map<size_t, size_t> data;
  data.insert(std::pair<size_t, size_t>(funAddrInt, argNo));
  shadowFunArgMap.insert(std::pair<std::map<size_t, size_t>, size_t>(data, argAddrInt));
}

extern "C" void addRegRes(size_t insIndex, size_t resRegIndex){
  shadowRegResMap.insert(std::pair<size_t,size_t>(insIndex, resRegIndex));
}

extern "C" size_t getRegRes(size_t insIndex){

  if(shadowRegResMap.count(insIndex) != 0){ 
    size_t resRegIndex = shadowRegResMap.at(insIndex);
    return resRegIndex;
  }
  return 0;
}

extern "C" void* handleMathFunc(size_t funcCode, void *op1){
  mpfr_t op1_mpfr;
  mpfr_t res_mpfr;
  struct Real* real_res = new Real;

  mpfr_init2 (op1_mpfr, PRECISION); 
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  Real *real1 = getReal(op1);
  if(debug){
    std::cout<<"handleMathFunc res:\n";
    mpfr_out_str (stdout, 10, 0, real1->mpfr_val, MPFR_RNDD);
    std::cout<<"\n";
  }
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        mpfr_sqrt(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      default:
        break;
    }
  }
  else
    std::cout<<"handleMathFunc: Error!!!\n";
  if(debug){
    std::cout<<"handleMathFunc res:\n";
    mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
    std::cout<<"\n";
  }
  size_t Addr = (size_t) real_res;
  shadowMap.insert(std::pair<size_t, struct Real*>(Addr, real_res));
  return real_res;
}

void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2){
  switch(opCode) {                                                                                            
    case 12: //FADD
      if(debug)
        std::cout<<"FADD\n";
      mpfr_add (*res, *op1, *op2, MPFR_RNDD);
      break;
    case 14: //FSUB
      if(debug)
        std::cout<<"FSUB\n";
      mpfr_sub (*res, *op1, *op2, MPFR_RNDD);
      break;
    case 16: //FMUL
      if(debug)
        std::cout<<"FMUL\n";
      mpfr_mul (*res, *op1, *op2, MPFR_RNDD);
      break;
    case 19: //FDIV
      if(debug)
        std::cout<<"FDIV\n";
      mpfr_div (*res, *op1, *op2, MPFR_RNDD);
      break;
    default:
      // do nothing
      break;
  } 
  if(debug){
    std::cout<<"handleOp res:\n";
    mpfr_out_str (stdout, 10, 0, *res, MPFR_RNDD);
    std::cout<<"\n";
    std::cout<<"handleOp op1:\n";
    mpfr_out_str (stdout, 10, 0, *op1, MPFR_RNDD);
    std::cout<<"\n";
    std::cout<<"handleOp op2:\n";
    mpfr_out_str (stdout, 10, 0, *op2, MPFR_RNDD);
    std::cout<<"\n";
  }
}

//extern "C" size_t handleOp_rr(size_t opCode, size_t regIndex1, size_t regIndex2, size_t insIndex){
extern "C" void* computeRealCC(size_t opCode, void* ptrRegIndex1, void* ptrRegIndex2, size_t insIndex){}
extern "C" void* computeRealCV(size_t opCode, void* ptrRegIndex1, void* ptrRegIndex2, size_t insIndex){}
extern "C" void* computeRealVC(size_t opCode, void* ptrRegIndex1, void* ptrRegIndex2, size_t insIndex){}
extern "C" void* computeRealVV(size_t opCode, void* ptrRegIndex1, void* ptrRegIndex2, size_t insIndex){}
extern "C" void* computeReal(size_t opCode, void* ptrRegIndex1, void* ptrRegIndex2, size_t insIndex){
  if(debug){
    std::cout<<"*****handleOp_rr: insIndex:"<<insIndex<<"\n";
  }

  size_t regIndex1 = *(size_t *)  ptrRegIndex1;
  size_t regIndex2 = *(size_t *)  ptrRegIndex2;
  mpfr_t res_mpfr;
  struct Real* real_res = new Real;
  //double newRegIdx = getNewRegIndex();

  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    if(debug)
      std::cout<<"new index:"<<insIndex<<":"<<newRegIdx<<"\n";
    addRegRes(insIndex, newRegIdx);
  }

  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  Real *real1 = getRealReg(regIndex1);
  if(real1 == NULL){
    //type cast to double
    double op1 = *(double *)  ptrRegIndex1;
    std::cout<<"op1:"<<op1<<"\n";
    std::cout<<"Error !!!!!!\n";
  }
  Real *real2 = getRealReg(regIndex2);
  if(real2 == NULL){
    double op2 = *(double *)  ptrRegIndex1;
    std::cout<<"op2:"<<op2<<"\n";
    std::cout<<"Error !!!!!!\n";
  }
  handleOp(opCode, &(real_res->mpfr_val), &(real1->mpfr_val), &(real2->mpfr_val));
 
  std::map<size_t, struct Real*>::iterator it = shadowMap.find(newRegIdx); 
  if (it != shadowMap.end())
    (*it).second = real_res;
  else
    shadowMap.insert(std::pair<size_t, struct Real*>(newRegIdx, real_res)); 
  if(debug)
    std::cout<<"*****handleOp_rr: returned regIndex:"<<newRegIdx<<"\n";
  return &newRegIdx;
}

extern "C" size_t setRealReg(size_t index, double value){
  if(debug){
    std::cout<<"setRealReg index:"<<index<<"\n"; 
    std::cout<<"setRealReg value:"<<value<<"\n"; 
  }
  if(!shadowMap.count(index)){
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(index, real)); 
    if(debug)
      std::cout<<"setRealReg: added to shadow mem\n";
  }
  return index;
}

extern "C" void setRealFunArg(size_t index, void *funAddr, void *toAddr/*store 2nd operand*/){
  size_t funAddrInt = (size_t) funAddr;
  size_t toAddrInt = (size_t) toAddr;
  size_t shadowAddr;
 // std::cout<<"setRealFunArg starts****\n";
  std::vector<size_t>::iterator it; 
  std::map<size_t, size_t> shadowAddrMap;
  shadowAddrMap.insert(std::pair<size_t, size_t>(funAddrInt, index));
  if(shadowFunArgMap.count(shadowAddrMap) != 0){ 
    size_t shadowAddr = shadowFunArgMap.at(shadowAddrMap);
      if(shadowMap.count(shadowAddr) != 0){
        Real* fromReal = shadowMap.at(shadowAddr);

        struct Real* toReal = new Real;
        memcpy(toReal,fromReal, sizeof(struct Real));
        shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
      }

  }
  else{
    std::cout<<"Error!!! Not found in shadowFunArgMap\n";
  }
}

//type cast from int to double
extern "C" void setRealCastIToD(void *Addr, unsigned int value){
  size_t AddrInt = (size_t) Addr;
//  std::cout<<"setRealCast Addr:"<<AddrInt<<"\n";
  if(!shadowMap.count(AddrInt)){ //if not in map
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real)); 
  //  std::cout<<"setRealCast: added to shadow mem\n";
  }  
  else{
 //   std::cout<<"setRealCast already in map\n";
    Real *real = getReal(Addr);
    mpfr_set_d (real->mpfr_val, value, MPFR_RNDD);
  }
}

extern "C" void setRealTemp(void *toAddr, void *fromAddr){
  size_t fromAddrInt = (size_t) fromAddr;
  size_t toAddrInt = (size_t) toAddr;
//  std::cout<<"setRealTemp toAddr:"<<toAddrInt<<"\n";
//  std::cout<<"setRealTemp fromAddrInt:"<<fromAddrInt<<"\n";
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
  }  
}

extern "C" void setRealConstant(void *Addr, double value){
  size_t AddrInt = (size_t) Addr;
  if(!shadowMap.count(AddrInt)){ //if not in map
//if its a constant we need to look other ways to handle it, but we have always set its value to constant
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real)); 
  }  
  else{
    Real *real = getReal(Addr);
    mpfr_set_d (real->mpfr_val, value, MPFR_RNDD);
  }
}

float getFloat(Real *real){  
  return mpfr_get_flt(real->mpfr_val, MPFR_RNDN);
}

double getDouble(Real *real){  
  return mpfr_get_d(real->mpfr_val, MPFR_RNDN);
}

long double getLongDouble(Real *real){  
  return mpfr_get_ld(real->mpfr_val, MPFR_RNDN);
}
void printReal(Real *real){
  char* shadowValStr;
  mpfr_exp_t shadowValExpt;

//  shadowValStr = mpfr_get_str(NULL, &shadowValExpt, 10, 15, real->mpfr_val, MPFR_RNDN);
//  printf("%c.%se%ld", shadowValStr[0], shadowValStr+1, shadowValExpt-1);
//  mpfr_free_str(shadowValStr);
  mpfr_out_str (stdout, 10, 0, real->mpfr_val, MPFR_RNDD);
} 

unsigned long ulpd1(long long xx, long long yy){

  xx = xx < 0 ? LLONG_MIN - xx : xx;

  yy = yy < 0 ? LLONG_MIN - yy : yy;

  return xx >= yy ? xx - yy : yy - xx;
}

unsigned long ulpf(float x, float y){
  if (x == 0) x = 0; // -0 == 0
  if (y == 0) y = 0; // -0 == 0

  // if (x != x && y != y) return 0; 
  if (x != x) return ULLONG_MAX - 1; // Maximum error
  if (y != y) return ULLONG_MAX - 1; // Maximum error

  long int xx = *((long int*) &x);
  xx = xx < 0 ? LONG_MIN - xx : xx;

  long int yy = *((long int*) &y);
  yy = yy < 0 ? LONG_MIN - yy : yy;

  return xx >= yy ? xx - yy : yy - xx;
}

unsigned long ulpd(double x, double y){
  if (x == 0) x = 0; // -0 == 0
  if (y == 0) y = 0; // -0 == 0

  // if (x != x && y != y) return 0; 
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

long long floatToInt(double f)
{
    long long r;
    memcpy(&r, &f, sizeof(double));
    return r;
}

double updateErrorF(Real *realVal, float computedVal){
  float shadowRounded = getFloat(realVal);
//  long long fi = floatToInt(shadowRounded);
//  long long fi2 = floatToInt(computedVal);
  //printf("fi %u\n", fi);
 // printf("fi2 %u\n", fi2);
//  printf("shadowRounded %10.5lf\n", shadowRounded);
//  std::cout<<shadowRounded<<"\n";
  unsigned long ulpsError = ulpf(shadowRounded, computedVal);
  //unsigned long ulpsError = ulpd1(fi, fi2);
//  printf("ulpsError %u\n", ulpsError);

  float bitsError = log2(ulpsError + 1);
//  std::cout<<"bitsError:"<<bitsError<<"\n";

  // Debug printing code

     
  if (shadowRounded != shadowRounded){
  //  printf("The shadow value is NaN");
  } else {
//    printf("The shadow value is ");
//    ppFloat(shadowRounded);
 //   printReal(realVal);
  }
  if (computedVal != computedVal){
   // printf(", but NaN was computed.\n");
  } else {
   //   printf(", but ");
//      ppFloat(computedVal);
//      printf("%e\n", computedVal);
 //     printf(" was computed.\n");
    }
//    printf("%f bits error (%llu ulps)\n",
  //              bitsError, ulpsError);
  return bitsError;
}
double updateError(Real *realVal, double computedVal){
  double shadowRounded = getDouble(realVal);
//  long long fi = floatToInt(shadowRounded);
//  long long fi2 = floatToInt(computedVal);
  //printf("fi %u\n", fi);
 // printf("fi2 %u\n", fi2);
//  printf("shadowRounded %10.5lf\n", shadowRounded);
//  std::cout<<shadowRounded<<"\n";
  unsigned long ulpsError = ulpd(shadowRounded, computedVal);
  //unsigned long ulpsError = ulpd1(fi, fi2);
//  printf("ulpsError %u\n", ulpsError);

  double bitsError = log2(ulpsError + 1);
//  std::cout<<"bitsError:"<<bitsError<<"\n";

  // Debug printing code

     
  if (shadowRounded != shadowRounded){
  //  printf("The shadow value is NaN");
  } else {
  //  printf("The shadow value is ");
//    ppFloat(shadowRounded);
  //  printReal(realVal);
  }
  if (computedVal != computedVal){
    printf(", but NaN was computed.\n");
  } else {
      printf(", but ");
//      ppFloat(computedVal);
      printf("%e\n", computedVal);
      printf(" was computed.\n");
    }
    printf("%f bits error (%llu ulps)\n",
                bitsError, ulpsError);
  return bitsError;
}

extern "C" void printRegValue(size_t regIndex, double value){
   if(shadowMap.count(regIndex)){ //if not in map
    Real *real = shadowMap.at(regIndex);
    std::cout<<"Result using mpfr:\n";
    mpfr_out_str (stdout, 10, 0, real->mpfr_val, MPFR_RNDD);
    double ulpsError = updateError(real, value);
    std::cout<<"ulpsError:"<<ulpsError<<"\n";
    printf("\n");
  }
} 
extern "C" void printErrorD(size_t result_A, double y){
  printf("%e\n", y);
  if(shadowMap.count(result_A) != 0){
      Real* resReal = shadowMap.at(result_A);
      std::cout<<"Result using mpfr:\n";
      mpfr_out_str (stdout, 10, 0, resReal->mpfr_val, MPFR_RNDD);
//      std::cout<<"\n";

      double ulpsError = updateError(resReal, y);
      std::cout<<"ulpsError:"<<ulpsError<<"\n";
  }
} 

extern "C" void printErrorF(size_t result_A, float y){
  printf("%e\n", y);
  if(shadowMap.count(result_A) != 0){
      Real* resReal = shadowMap.at(result_A);
 //     std::cout<<"Result using mpfr:\n";
 //     mpfr_out_str (stdout, 10, 0, resReal->mpfr_val, MPFR_RNDD);
 //     std::cout<<"\n";

      float ulpsError = updateErrorF(resReal, y);
      std::cout<<"ulpsError:"<<ulpsError<<"\n";
  }
} 
