#include "handleReal.h"
#include <string.h>
#include <fstream>
#include <queue>

/*TODO : 
1. Handle all math functions
2. Clean up shadow
*/

FILE *pFile = fopen ("error.out","w");

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
  std::cout<<"addFunArg: insert in shadowFunArgMap funAddrInt:"<<funAddrInt<<" argNo:"<<argNo<<" argAddrInt:"<<argAddrInt<<"\n";
  std::map<size_t, size_t> data;
  data.insert(std::pair<size_t, size_t>(funAddrInt, argNo));
  shadowFunArgMap.insert(std::pair<std::map<size_t, size_t>, size_t>(data, argAddrInt));
}

extern "C" void addRegRes(size_t insIndex, size_t resRegIndex){
  insMap.insert(std::pair<size_t,size_t>(insIndex, resRegIndex));
}

extern "C" size_t getRegRes(size_t insIndex){

  if(insMap.count(insIndex) != 0){ 
    size_t resRegIndex = insMap.at(insIndex);
    return resRegIndex;
  }
  return 0;
}

extern "C" void* handleMathFunc(size_t funcCode, double op1, void *op1Ptr, 
                                                double computedRes, size_t insIndex){ 
  struct Real* real1 = NULL;
  struct Real* real_res = new Real;
  
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  
  if(op1Ptr == NULL){
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION);
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
  }
  else{
    real1 = getReal(op1Ptr);
  }
  if(debug){
    std::cout<<"handleMathFunc res:\n";
    mpfr_out_str (stdout, 10, 0, real1->mpfr_val, MPFR_RNDD);
    std::cout<<"\n";
  }
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    if(debug)
      std::cout<<"new index:"<<insIndex<<":"<<newRegIdx<<"\n";
    addRegRes(insIndex, newRegIdx);
  }
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        mpfr_sqrt(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 2: //floor
        mpfr_floor(real_res->mpfr_val, real1->mpfr_val);
        break;
      case 3: //tan
        mpfr_tan(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 4: //sin
        mpfr_sin(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 5: //cos
        mpfr_cos(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 6: //atan
        mpfr_atan(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
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
  std::map<size_t, struct Real*>::iterator it = shadowMap.find(newRegIdx); 
  if (it != shadowMap.end())
    (*it).second = real_res;
  else
    shadowMap.insert(std::pair<size_t, struct Real*>(newRegIdx, real_res)); 
  if(debug)
    std::cout<<"*****computeRealVV: returned regIndex:"<<newRegIdx<<"\n";
  updateError(real_res, computedRes, insIndex);
  return real_res;
}

extern "C" void* handleMathFunc3Args(size_t funcCode, double op1, void *op1Ptr,
                                                double op2, void *op2Ptr,
                                                double op3, void *op3Ptr,
                                                double computedRes, size_t insIndex){ 
  struct Real *real1, *real2, *real3;
  struct Real* real_res = new Real;
  
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  
  if(op1Ptr == NULL){
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION);
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
  }
  else{
    real1 = getReal(op1Ptr);
  }
  if(op2Ptr == NULL){
    real2 = new Real;
    mpfr_init2 (real2->mpfr_val, PRECISION);
    mpfr_set_d (real2->mpfr_val, op1, MPFR_RNDD);
  }
  else{
    real2 = getReal(op2Ptr);
  }
  if(op3Ptr == NULL){
    real3 = new Real;
    mpfr_init2 (real3->mpfr_val, PRECISION);
    mpfr_set_d (real3->mpfr_val, op1, MPFR_RNDD);
  }
  else{
    real3 = getReal(op3Ptr);
  }
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    if(debug)
      std::cout<<"new index:"<<insIndex<<":"<<newRegIdx<<"\n";
    addRegRes(insIndex, newRegIdx);
  }
  
  if(real1 != NULL && real2 != NULL && real3 != NULL){
    switch(funcCode){
      case 7: //fma
        mpfr_fma(real_res->mpfr_val, real1->mpfr_val, real2->mpfr_val, real3->mpfr_val, MPFR_RNDD);
        break;
      default:
        break;
    }
  }
  else
    std::cout<<"handleMathFunc3Args: Error!!!\n";
  if(debug){
    std::cout<<"handleMathFunc3Args res:\n";
    mpfr_out_str (stdout, 10, 0, real_res->mpfr_val, MPFR_RNDD);
    std::cout<<"\n";
  }
  std::map<size_t, struct Real*>::iterator it = shadowMap.find(newRegIdx); 
  if (it != shadowMap.end())
    (*it).second = real_res;
  else
    shadowMap.insert(std::pair<size_t, struct Real*>(newRegIdx, real_res)); 
  if(debug)
    std::cout<<"*****computeRealVV: returned regIndex:"<<newRegIdx<<"\n";
  updateError(real_res, computedRes, insIndex);
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

extern "C" size_t setRealConstant(void *Addr, double value){
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
  return AddrInt;
}

extern "C" size_t computeReal(size_t opCode, void* op1Ptr, void* op2Ptr, double op1, double op2, 
                                    double computedRes, size_t insIndex){
  if(op1Ptr == NULL)
    std::cout<<"computeReal: op1Ptr is NULL\n";
  if(op2Ptr == NULL)
    std::cout<<"computeReal: op2Ptr is NULL\n";

  size_t regIndex1;
  size_t regIndex2;

  Real *real1;
  Real *real2;

  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;

  size_t newRegIdx = getRegRes(insIndex);
#if 1
  if(op1Ptr == NULL){
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION); 
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
  }
  else{
    regIndex1 = (size_t)  op1Ptr;
    real1 = getRealReg(regIndex1);
    if(real1 == NULL){
      std::cout<<"Error !!!!!!\n";
    }
  }
  if(op2Ptr == NULL){
    real2 = new Real;
    mpfr_init2 (real2->mpfr_val, PRECISION); 
    mpfr_set_d (real2->mpfr_val, op2, MPFR_RNDD);
  }
  else{
    size_t regIndex2 = (size_t) op2Ptr;
    real2 = getRealReg(regIndex2);
    if(real2 == NULL){
      std::cout<<"Error !!!!!!\n";
    }
  }
  if(debug){
    std::cout<<"*****computeRealVV: insIndex:"<<insIndex<<"\n";
    std::cout<<"*****computeRealVV: regIndex1:"<<regIndex1<<"\n";
    std::cout<<"*****computeRealVV: regIndex2:"<<regIndex2<<"\n";
  }
  
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    if(debug)
      std::cout<<"new index:"<<insIndex<<":"<<newRegIdx<<"\n";
    addRegRes(insIndex, newRegIdx);
  }
  std::cout<<"*****computeRealVV: new result idx:"<<newRegIdx<<"\n";
  mpfr_init2 (real_res->mpfr_val, PRECISION); 

  handleOp(opCode, &(real_res->mpfr_val), &(real1->mpfr_val), &(real2->mpfr_val));
 
  std::map<size_t, struct Real*>::iterator it = shadowMap.find(newRegIdx); 
  if (it != shadowMap.end())
    (*it).second = real_res;
  else
    shadowMap.insert(std::pair<size_t, struct Real*>(newRegIdx, real_res)); 
  if(debug)
    std::cout<<"*****computeRealVV: returned regIndex:"<<newRegIdx<<"\n";
  updateError(real_res, computedRes, insIndex);
#endif
  return newRegIdx;
}

int isNaN(Real *real){
  return mpfr_nan_p(real->mpfr_val);                                                            
}

extern "C" void checkBranch(double op1, void* op1Ptr, double op2, void* op2Ptr, int fcmpFlag, bool computedRes){
  size_t regIndex1;
  size_t regIndex2;

  Real *real1;
  Real *real2;

  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;

  if(op1Ptr == NULL){
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION); 
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
  }
  else{
    regIndex1 = (size_t)  op1Ptr;
    real1 = getRealReg(regIndex1);
    if(real1 == NULL){
      std::cout<<"Error !!!!!!\n";
    }
  }
  if(op2Ptr == NULL){
    real2 = new Real;
    mpfr_init2 (real2->mpfr_val, PRECISION); 
    mpfr_set_d (real2->mpfr_val, op2, MPFR_RNDD);
  }
  else{
    size_t regIndex2 = (size_t) op2Ptr;
    real2 = getRealReg(regIndex2);
    if(real2 == NULL){
      std::cout<<"Error !!!!!!\n";
    }
  }
  if(debug){
    std::cout<<"*****checkBranchVC: computedRes:"<<computedRes<<"\n";
  }
  bool realRes = false;
  std::cout<<"fcmpFlag:"<<fcmpFlag<<"\n";
  switch(fcmpFlag){
    case 1: 
            realRes = false;
            break;
    case 2: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(real1->mpfr_val == real2->mpfr_val)
                realRes = true;
            }
            break;
    case 3: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(real1->mpfr_val > real2->mpfr_val)
                realRes = true;
            }
            break;
    case 4: 
            std::cout<<"NAN:"<<isNaN(real1)<<"\n";
            std::cout<<"NAN:"<<isNaN(real2)<<"\n";
            if(!isNaN(real1) && !isNaN(real2)){
              std::cout<<"not a nan\n"<<"\n";
              mpfr_out_str (stdout, 10, 0, real1->mpfr_val, MPFR_RNDD);
              std::cout<<"\n real2 \n";
              mpfr_out_str (stdout, 10, 0, real2->mpfr_val, MPFR_RNDD);
              std::cout<<"\n  \n";
             
              if(real1->mpfr_val >= real2->mpfr_val)
          
                std::cout<<"real 1 > = real2\n"<<"\n";
                realRes = true;
            }
            break;
    case 5: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(real1->mpfr_val < real2->mpfr_val)
                realRes = true;
            }
            break;
    case 6: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(real1->mpfr_val <= real2->mpfr_val)
                realRes = true;
            }
            break;
    case 7: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(real1->mpfr_val != real2->mpfr_val)
                realRes = true;
            }
            break;
    case 8: 
            if(!isNaN(real1) && !isNaN(real2)){
              realRes = true;
            }
            break;
    case 9: 
            if(real1->mpfr_val == real2->mpfr_val)
              realRes = true;
            break;
    case 10: 
            if(real1->mpfr_val > real2->mpfr_val)
              realRes = true;
            break;
    case 11: 
            if(real1->mpfr_val >= real2->mpfr_val)
              realRes = true;
            break;
    case 12: 
            if(real1->mpfr_val < real2->mpfr_val)
              realRes = true;
            break;
    case 14: 
            if(real1->mpfr_val <= real2->mpfr_val)
              realRes = true;
            break;
    case 15: 
            if(real1->mpfr_val != real2->mpfr_val)
              realRes = true;
            break;
    case 16: 
            if(isNaN(real1) || isNaN(real2))
              realRes = true;
            break;
  }   
  if(realRes != computedRes)
    fprintf (pFile, "Branch flip\n");
}

extern "C" size_t setConstant(double value){
  int index = 1; 
  if(debug){
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

extern "C" void setRealFunArg(size_t index, void *funAddr, void *toAddr/*store 2nd operand*/, double op){
  size_t funAddrInt = (size_t) funAddr;
  size_t toAddrInt = (size_t) toAddr;
  size_t shadowAddr;
  std::vector<size_t>::iterator it; 
  std::map<size_t, size_t> shadowAddrMap;
  shadowAddrMap.insert(std::pair<size_t, size_t>(funAddrInt, index));
  if(shadowFunArgMap.count(shadowAddrMap) != 0){ 
  std::cout<<"setRealFunArg: found in shadowFunArgMap\n";
    size_t shadowAddr = shadowFunArgMap.at(shadowAddrMap);
      if(shadowMap.count(shadowAddr) != 0){
        Real* fromReal = shadowMap.at(shadowAddr);

        struct Real* toReal = new Real;
        memcpy(toReal,fromReal, sizeof(struct Real));
        std::map<size_t, struct Real*>::iterator it = shadowMap.find(toAddrInt); 
        //TODO: instead of updating shadow mem, we should clean it once function exit
        if (it != shadowMap.end()){
          std::cout<<"setRealFunArg updating shadowMap\n";
          it->second = toReal;
        }
        else{
          shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
          std::cout<<"setRealFunArg inserting shadowMap\n";
        }
      }
  }
  else{
    std::cout<<"\nsetRealFunArg:Not found in shadowFunArgMap, it means its a constant\n";
    std::cout<<"setRealFunArg op: "<<op<<"\n";
    struct Real* toReal = new Real;
    mpfr_init2(toReal->mpfr_val, PRECISION);
    mpfr_set_d(toReal->mpfr_val, op, MPFR_RNDN);

    std::map<size_t, struct Real*>::iterator it = shadowMap.find(toAddrInt); 
    if (it != shadowMap.end()){
      std::cout<<"setRealFunArg updating shadowMap\n";
      it->second = toReal;
    }
    else{
      shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
      std::cout<<"setRealFunArg inserting shadowMap\n";
    }
  }
}

extern "C" void setRealReturn(void *toAddr){
  size_t toAddrInt = (size_t) toAddr;
  std::cout<<"setRealReturn: called\n";
  if(!retTrack.empty()){
    size_t idx = retTrack.top();
    retTrack.pop();
    std::cout<<"setRealReturn: idx:"<<idx<<"\n";
    Real* fromReal = shadowMap.at(idx);
    struct Real* toReal = new Real;
    memcpy(toReal,fromReal, sizeof(struct Real));
    shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
  }
  else
    std::cout<<"Error !!!! return value not found in stack\n";
}
//TODO
extern "C" void setRealCastIToF(void *Addr, int value){
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

extern "C" void setRealCastFToD(void *Addr, float value){
  size_t AddrInt = (size_t) Addr;
//  std::cout<<"setRealCastFToD Addr:"<<AddrInt<<"\n";
  if(!shadowMap.count(AddrInt)){ //if not in map
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real)); 
//    std::cout<<"setRealCast: added to shadow mem\n";
  }  
  else{
//    std::cout<<"setRealCastFToD already in map\n";
//    Real *real = getReal(Addr);
//    mpfr_set_d (real->mpfr_val, value, MPFR_RNDD);
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
//    else
//      std::cout<<"fromAddr and toAddr not found in map\n"; //TODO check what to do here
  }  
}
/*
extern "C" void setRealConstant(void *Addr, double value){
  size_t AddrInt = (size_t) Addr;
  std::cout<<"setRealConstant index "<<AddrInt<<":"<<value<<"\n";
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
*/
extern "C" void trackReturn(void *Index){
  size_t Idx = (size_t) Index;
  std::cout<<"trackReturn index: "<<Idx<<"\n";
  retTrack.push(Idx);
}

extern "C" void finish(){
   int n;
   char name [100];

  bool flag = false;
  for (std::map<size_t, struct ErrorAggregate*>::iterator it=errorMap.begin(); it!=errorMap.end(); ++it){
    double avg = it->second->total_error/it->second->num_evals;
    std::cout<<"finish: num evals:"<<it->second->num_evals;
    printf("avg error %f\n",avg);
  //  if(avg > 0.0){
   //   flag = true;
      fprintf (pFile, "%f bits average error\n",avg);
   // }
  }
  std::cout<<"flag:"<<flag<<"\n";
  fclose (pFile);
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

double updateError(Real *realVal, double computedVal, size_t insIndex){
  struct ErrorAggregate* eagg;
  if(errorMap.count(insIndex) != 0){ 
    eagg = errorMap.at(insIndex);
  }
  else{
    eagg = new ErrorAggregate;
    initializeErrorAggregate(eagg);
  }

  double shadowRounded = getDouble(realVal);
  unsigned long ulpsError = ulpd(shadowRounded, computedVal);
                                                                                                    
  double bitsError = log2(ulpsError + 1);
  if (bitsError > eagg->max_error){
    eagg->max_error = bitsError;
  }
  eagg->total_error += bitsError;
  eagg->num_evals += 1;
   if (debug){
    std::cout<<"eagg->num_evals:"<<eagg->num_evals<<"The shadow value is ";
    printReal(realVal);
    if (computedVal != computedVal){
      std::cout<<", but NaN was computed.\n";
    } else {
      std::cout<<", but ";
      ppFloat(computedVal);
      std::cout<<" was computed.\n";
    }
    printf("%f bits error (%llu ulps)\n",
                bitsError, ulpsError);
  }
  
  std::map<size_t, struct ErrorAggregate*>::iterator it = errorMap.find(insIndex); 
  if (it != errorMap.end())
    it->second = eagg;
  else
    errorMap.insert(std::pair<size_t, struct ErrorAggregate*>(insIndex, eagg)); 

  return bitsError;
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
       
void initializeErrorAggregate(ErrorAggregate *eagg){ 
  eagg->max_error = -1;
  eagg->total_error = 0;
  eagg->num_evals = 0;
}


