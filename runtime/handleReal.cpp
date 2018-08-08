#include "handleReal.h"
#include <string.h>
#include <fstream>
#include <queue>

/*TODO : 
1. Handle all math functions
2. Clean up shadow
*/
#define debug 1

FILE *pFile = fopen ("error.out","w");

extern "C" size_t getNewRegIndex(){
  regIndex += 1;
  return regIndex;
}

Real* getReal(void *Addr){
  size_t AddrInt = (size_t) Addr;
  if(shadowMap.count(AddrInt) != 0){
    Real* real = shadowMap.at(AddrInt);
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
  insMap.insert(std::pair<size_t,size_t>(insIndex, resRegIndex));
}

extern "C" size_t getRegRes(size_t insIndex){

  if(insMap.count(insIndex) != 0){ 
    size_t resRegIndex = insMap.at(insIndex);
    return resRegIndex;
  }
  return 0;
}

extern "C" void cleanComputeReal(size_t index){
   
  size_t newRegIdx = getRegRes(index);
  if(debug)
    std::cout<<"cleanComputeReal:"<<newRegIdx<<"\n";
  if(newRegIdx){
    std::map<size_t, struct Real*>::iterator it;
    it = shadowMap.find(newRegIdx);

    if (it != shadowMap.end()){
      if(it->second != NULL){
        if(debug)
          std::cout<<"cleaning up:"<<newRegIdx<<"\n";
        mpfr_clear(it->second->mpfr_val);
        mpfrClear++;
    
        delete(it->second);
        it->second = NULL;
        shadowMap.erase (it);     
      }
    }
    else{
      if(debug)
        std::cout<<"cleanup:"<<newRegIdx<<" not found\n";
    }
  }
}

void cleanup(size_t index){
  std::map<size_t, struct Real*>::iterator it;
  it = shadowMap.find(index);

   if (it != shadowMap.end()){
    if(it->second != NULL){
      if(debug)
        std::cout<<"cleaning up:"<<index<<"\n";
      mpfr_clear(it->second->mpfr_val);
      mpfrClear++;
    
      delete(it->second);
      it->second = NULL;
      shadowMap.erase (it);     
    }
  }
  else{
    if(debug)
      std::cout<<"cleanup:"<<index<<" not found\n";
  }
}

extern "C" void funcInit(void *funAddr){
  size_t funcAddrInt = (size_t) funAddr;
  if(debug)
    std::cout<<"funcInit: insert func addr:"<<funcAddrInt<<"\n";
  varTrack.push(funcAddrInt);
}

extern "C" void funcExit(void *funAddr){
  size_t var;
  size_t funcAddrInt = (size_t) funAddr;
  if(debug)
    std::cout<<"funcExit:"<<funcAddrInt<<"\n";
  while(!varTrack.empty()){
    var = varTrack.top();
    if(debug)
      std::cout<<"funcExit top of varTrack:"<<var<<"\n";
    if(var == funcAddrInt){
      if(debug)
        std::cout<<"var == funcAddrInt:"<<var<<"\n";
      varTrack.pop();
      break;
    }
    cleanup(var);
    varTrack.pop();
  }
}

extern "C" void handleAlloca(void *varAddr){
  size_t varAddrInt = (size_t) varAddr;
  if(debug)
    std::cout<<"handleAlloca:"<<"varTrack push:"<<varAddrInt<<"\n";
  varTrack.push(varAddrInt);
}

extern "C" size_t handleMathFunc(size_t funcCode, double op1, void *op1Ptr, 
                                                double computedRes, size_t insIndex){ 
  struct Real* real1 = NULL;
  struct Real* real_res = new Real;

  
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfrInit++;
  bool mpfrFlag1 = false; 
  if(op1Ptr == NULL){
    std::cout<<"handleMathFunc: op1Ptr is NULL\n";
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
    mpfrFlag1 = true;
  }
  else{
    real1 = getReal(op1Ptr);
    if(real1 == NULL){
      std::cout<<"handleMathFunc: real1 is NULL\n";
      real1 = new Real;
      mpfr_init2(real1->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set_d(real1->mpfr_val, op1, MPFR_RNDN);

      mpfrFlag1 = true; 
    }
  }
  if(debug){
  }
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    addRegRes(insIndex, newRegIdx);
  }
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        std::cout<<"handleMathFunc: sqrt:\n";
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
      case 8: //atan
        mpfr_abs(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      default:
        break;
    }
  }
  else
    std::cout<<"handleMathFunc: Error!!!\n";
    std::cout<<"handleMathFunc res:";
    printReal(real_res);
    std::cout<<"\n";
    std::cout<<"handleMathFunc op1:";
    printReal(real1);
    std::cout<<"\n";
  std::map<size_t, struct Real*>::iterator it = shadowMap.find(newRegIdx); 
  if (it != shadowMap.end()){
    mpfr_clear(it->second->mpfr_val);
    delete(it->second);
    shadowMap.erase(it);
    mpfrClear++;
  }
  shadowMap.insert(std::pair<size_t, struct Real*>(newRegIdx, real_res)); 
  if(debug)
    std::cout<<"handleMathFunc insert shadow mem:"<<newRegIdx<<"\n";
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    delete  real1; 
    mpfrClear++;
  }
  updateError(real_res, computedRes, insIndex);
  return newRegIdx;
}

extern "C" size_t handleMathFunc3Args(size_t funcCode, double op1, void *op1Ptr,
                                                double op2, void *op2Ptr,
                                                double op3, void *op3Ptr,
                                                double computedRes, size_t insIndex){ 
  struct Real *real1, *real2, *real3;
  struct Real* real_res = new Real;
  
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfrInit++;
  
  bool mpfrFlag1 = false; 
  bool mpfrFlag2 = false; 
  bool mpfrFlag3 = false; 
  if(op1Ptr == NULL){
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
    mpfrFlag1 = true;
  }
  else{
    real1 = getReal(op1Ptr);
  }
  if(op2Ptr == NULL){
    real2 = new Real;
    mpfr_init2 (real2->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d (real2->mpfr_val, op1, MPFR_RNDD);
    mpfrFlag2 = true;
  }
  else{
    real2 = getReal(op2Ptr);
  }
  if(op3Ptr == NULL){
    real3 = new Real;
    mpfr_init2 (real3->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d (real3->mpfr_val, op1, MPFR_RNDD);
    mpfrFlag3 = true;
  }
  else{
    real3 = getReal(op3Ptr);
  }
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    addRegRes(insIndex, newRegIdx);
  }
  
  if(real1 != NULL && real2 != NULL && real3 != NULL){
    switch(funcCode){
      case 7: //fma
        mpfr_fma(real_res->mpfr_val, real1->mpfr_val, real2->mpfr_val, real3->mpfr_val, MPFR_RNDD);
        break;
      default:
        std::cout<<"Error!!!!\n";
        break;
    }
  }
  else
    std::cout<<"handleMathFunc3Args: Error!!!\n";
  std::map<size_t, struct Real*>::iterator it = shadowMap.find(newRegIdx); 
  if (it != shadowMap.end()){
    mpfr_clear(it->second->mpfr_val);
    delete(it->second);
    shadowMap.erase(it);
    mpfrClear++;
  }
  shadowMap.insert(std::pair<size_t, struct Real*>(newRegIdx, real_res)); 
  if(debug)
    std::cout<<"handleMathFunc3Args insert shadow mem:"<<newRegIdx<<"\n";
  
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    delete  real1; 
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(real2->mpfr_val);
    delete  real2; 
    mpfrClear++;
  }
  if(mpfrFlag3){
    mpfr_clear(real3->mpfr_val);
    delete  real3; 
    mpfrClear++;
  }
  updateError(real_res, computedRes, insIndex);
  return newRegIdx;
}

void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2){
  switch(opCode) {                                                                                            
    case 12: //FADD
      if(debug)
        std::cout<<"\nFADD\n";
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
  if(0){
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
    mpfrInit++;
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(AddrInt, real)); 
    if(debug)
      std::cout<<"setRealConstant insert shadow mem:"<<AddrInt<<"\n";
  }  
  else{
    Real *real = getReal(Addr);
    mpfr_set_d (real->mpfr_val, value, MPFR_RNDD);
  }
  return AddrInt;
}

extern "C" size_t computeReal(size_t opCode, void* op1Ptr, void* op2Ptr, double op1, double op2, 
                                    double computedRes, size_t insIndex){

#if 1
  size_t regIndex1;
  size_t regIndex2;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
  Real *real1;
  Real *real2;

  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;
  
  if(op1Ptr == NULL){
    if(debug)
      std::cout<<"computeReal: op1Ptr is null, using op1 value:"<<op1<<"\n";
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION); 
    mpfrInit++;
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
    mpfrFlag1 = true; 
  }
  else{
    real1 = getReal(op1Ptr);
    if(real1 == NULL){
      if(debug)
        std::cout<<"computeReal: real1 is null, using op1 value:"<<op1<<"\n";
      //data might be set without store
      real1 = new Real;
      mpfr_init2(real1->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set_d(real1->mpfr_val, op1, MPFR_RNDN);

      mpfrFlag1 = true; 
    }
  }
  if(op2Ptr == NULL){
    if(debug)
      std::cout<<"computeReal: op2Ptr is null, using op2 value:"<<op2<<"\n";
    real2 = new Real;
    mpfr_init2 (real2->mpfr_val, PRECISION); 
    mpfrInit++;
    mpfr_set_d (real2->mpfr_val, op2, MPFR_RNDD);
    mpfrFlag2 = true; 
  }
  else{
    real2 = getReal(op2Ptr);
    if(real2 == NULL){
      if(debug)
        std::cout<<"computeReal: real2 is null, using op2 value:"<<op2<<"\n";
      real2 = new Real;
      mpfr_init2(real2->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set_d(real2->mpfr_val, op2, MPFR_RNDN);
      mpfrFlag2 = true; 
    }
  }
  
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    addRegRes(insIndex, newRegIdx);
  }
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfrInit++;

  handleOp(opCode, &(real_res->mpfr_val), &(real1->mpfr_val), &(real2->mpfr_val));
  std::cout<<"res:";
  printReal(real_res);
  std::cout<<"\nop1:";
  printReal(real1);
  std::cout<<"\nop2:";
  printReal(real2);
  std::cout<<"\n";
 
  std::map<size_t, struct Real*>::iterator it = shadowMap.find(newRegIdx); 
  if (it != shadowMap.end()){
    mpfr_clear(it->second->mpfr_val);
    delete(it->second);
    shadowMap.erase(it);
    mpfrClear++;
  }
  shadowMap.insert(std::pair<size_t, struct Real*>(newRegIdx, real_res));
  if(debug)
    std::cout<<"computeReal insert shadow mem:"<<newRegIdx<<"\n";
  updateError(real_res, computedRes, insIndex);
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    delete  real1; 
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(real2->mpfr_val);
    delete  real2; 
    mpfrClear++;
  }
#endif
  return newRegIdx;
}

int isNaN(Real *real){
  return mpfr_nan_p(real->mpfr_val);                                                            
}

extern "C" void checkBranch(double op1, void* op1Ptr, double op2, void* op2Ptr, 
                            int fcmpFlag, bool computedRes, size_t insIndex){
  size_t regIndex1;
  size_t regIndex2;

  Real *real1;
  Real *real2;

  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
  if(op1Ptr == NULL){
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION); 
    mpfrInit++;
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
    mpfrFlag1 = true; 
  }
  else{
    real1 = getReal(op1Ptr);
    if(real1 == NULL){
      //data might be set without store
      real1 = new Real;
      mpfr_init2(real1->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set_d(real1->mpfr_val, op1, MPFR_RNDN);
      mpfrFlag1 = true; 
    }
  }
  if(op2Ptr == NULL){
    real2 = new Real;
    mpfr_init2 (real2->mpfr_val, PRECISION); 
    mpfrInit++;
    mpfr_set_d (real2->mpfr_val, op2, MPFR_RNDD);
    mpfrFlag2 = true; 
  }
  else{
    real2 = getReal(op2Ptr);
    if(real2 == NULL){
      real2 = new Real;
      mpfr_init2(real2->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set_d(real2->mpfr_val, op2, MPFR_RNDN);
      mpfrFlag2 = true; 
    }
  }
  bool realRes = false;
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
            if(!isNaN(real1) && !isNaN(real2)){
              if(real1->mpfr_val >= real2->mpfr_val)
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
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
    delete real1;
    real1 = NULL;
  }
  if(mpfrFlag2){
    mpfr_clear(real2->mpfr_val);
    mpfrClear++;
    delete real2;
    real2 = NULL;
  }
  updateBranchError(realRes, computedRes, insIndex);
}

extern "C" size_t setRealReg(size_t index, double value){
 
  if(!shadowMap.count(index)){
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
    shadowMap.insert(std::pair<size_t, struct Real*>(index, real)); 
    if(debug)
      std::cout<<"setRealReg insert shadow mem:"<<index<<"\n";
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
    size_t shadowAddr = shadowFunArgMap.at(shadowAddrMap);
      if(shadowMap.count(shadowAddr) != 0){
        Real* fromReal = shadowMap.at(shadowAddr);

        struct Real* toReal = new Real;
        mpfr_init2(toReal->mpfr_val, PRECISION);
        mpfrInit++;
        mpfr_set(toReal->mpfr_val, fromReal->mpfr_val, MPFR_RNDD);
        //memcpy(toReal,fromReal, sizeof(struct Real));
        std::map<size_t, struct Real*>::iterator it = shadowMap.find(toAddrInt); 
        if (it != shadowMap.end()){
          mpfr_clear(it->second->mpfr_val);
          delete(it->second);
          shadowMap.erase(it);
          mpfrClear++;
        }
        shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
        if(debug)
          std::cout<<"setRealFunArg insert shadow mem:"<<toAddrInt<<"\n";
      }
  }
  else{
    struct Real* toReal = new Real;
    mpfr_init2(toReal->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(toReal->mpfr_val, op, MPFR_RNDN);

    std::map<size_t, struct Real*>::iterator it = shadowMap.find(toAddrInt); 
    if (it != shadowMap.end()){
      mpfr_clear(it->second->mpfr_val);
      delete(it->second);
      shadowMap.erase(it);
      mpfrClear++;
    }
    shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
    if(debug)
      std::cout<<"setRealFunArg insert shadow mem:"<<toAddrInt<<"\n";
  }
}

extern "C" void setRealReturn(void *toAddr){
  size_t toAddrInt = (size_t) toAddr;
  if(!retTrack.empty()){
    size_t idx = retTrack.top();
    retTrack.pop();
    Real* fromReal = shadowMap.at(idx);
    struct Real* toReal = new Real;
    mpfr_init2(toReal->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set(toReal->mpfr_val, fromReal->mpfr_val, MPFR_RNDD);
    cleanup(idx);
    std::map<size_t, struct Real*>::iterator it = shadowMap.find(toAddrInt); 
    if (it != shadowMap.end()){
      mpfr_clear(it->second->mpfr_val);
      delete(it->second);
      shadowMap.erase(it);
      mpfrClear++;
    }
    shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
    if(debug)
      std::cout<<"setRealReturn insert shadow mem:"<<toAddrInt<<"\n";
  }
  else
    std::cout<<"Error !!!! return value not found in stack\n";
}

extern "C" void setRealTemp(void *toAddr, void *fromAddr){
  size_t fromAddrInt = (size_t) fromAddr;
  size_t toAddrInt = (size_t) toAddr;
  if(shadowMap.count(toAddrInt) != 0){ //just copy from one shadow to another if found in map
    Real* fromReal = shadowMap.at(fromAddrInt);
    Real* toReal = shadowMap.at(toAddrInt);
    mpfr_set(toReal->mpfr_val, fromReal->mpfr_val, MPFR_RNDD);
    if(debug)
      std::cout<<"setRealTemp shadow mem copied from:"<<fromAddrInt<<" to:"<<toAddrInt<<"\n";
  }
  else{
    if(shadowMap.count(fromAddrInt) != 0){
      Real* fromReal = shadowMap.at(fromAddrInt);
      struct Real* toReal = new Real;
      mpfr_init2(toReal->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set(toReal->mpfr_val, fromReal->mpfr_val, MPFR_RNDD);
    
      shadowMap.insert(std::pair<size_t, struct Real*>(toAddrInt, toReal)); 
      if(debug)
        std::cout<<"setRealTemp insert shadow mem from:"<<fromAddrInt<<" to:"<<toAddrInt<<"\n";
    }
  }  
}

extern "C" void trackReturn(void *Index){
  size_t Idx = (size_t) Index;
  retTrack.push(Idx);
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

  shadowValStr = mpfr_get_str(NULL, &shadowValExpt, 10, 15, real->mpfr_val, MPFR_RNDN);
  printf("%c.%se%ld", shadowValStr[0], shadowValStr+1, shadowValExpt-1);
  mpfr_free_str(shadowValStr);
//  mpfr_out_str (stdout, 10, 0, real->mpfr_val, MPFR_RNDD);
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

void updateBranchError(bool realRes, bool computedRes, size_t insIndex){
  struct BrError* brErr;
  if(errBrMap.count(insIndex) != 0){ 
    brErr = errBrMap.at(insIndex);
  }
  else{
    brErr = new BrError;
    initializeBrError(brErr);
  }
 
  if(realRes != computedRes){
    brErr->incorrRes += 1;
  }
  else{
    brErr->corrRes += 1; 
  }
  brErr->num_evals += 1;

  std::map<size_t, struct BrError*>::iterator it = errBrMap.find(insIndex); 
  if (it != errBrMap.end()){
    it->second = brErr; 
  }
  errBrMap.insert(std::pair<size_t, struct BrError*>(insIndex, brErr)); 
}

double updateError(Real *realVal, double computedVal, size_t insIndex){
  if(debug)
    std::cout<<"updateError: computedVal:"<<computedVal<<" insIndex:"<<insIndex<<"\n";
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
   if (1){
    std::cout<<"\neagg->max_error:"<<eagg->max_error<<"\n";
    std::cout<<"\neagg->num_evals:"<<eagg->num_evals<<" eagg->total_error:"<<eagg->total_error<<"\n";
    std::cout<<"\nThe shadow value is ";
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
  if (it != errorMap.end()){
    it->second = eagg; 
  } 
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
       
void initializeBrError(BrError *err){ 
  err->incorrRes = 0;
  err->corrRes = 0;
  err->num_evals = 0;
}

void initializeErrorAggregate(ErrorAggregate *eagg){ 
  eagg->max_error = -1;
  eagg->total_error = 0;
  eagg->num_evals = 0;
}

extern "C" void finish(){
  int n;
  char name [100];
  bool flag = false;
  std::cout<<"mpfrInit:"<<mpfrInit<<"\n";
  std::cout<<"mpfrClear:"<<mpfrClear<<"\n";
  for (std::map<size_t, struct ErrorAggregate*>::iterator it=errorMap.begin(); it!=errorMap.end(); ++it){
    double avg = it->second->total_error/it->second->num_evals;
    fprintf (pFile, "%f bits average error\n",avg);
    fprintf (pFile, "%f max  error\n\n",  it->second->max_error);
  }
  for (std::map<size_t, struct BrError*>::iterator it=errBrMap.begin(); it!=errBrMap.end(); ++it){
    fprintf (pFile, "compare\n");
    fprintf (pFile, "branch flipped %lld",  it->second->incorrRes);
    fprintf (pFile, " times out of %lld",  it->second->num_evals);
    fprintf (pFile, " compare\n\n");
  }
  fclose (pFile);
}

