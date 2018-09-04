#include "handleReal.h"
#include <string.h>
#include <fstream>
#include <queue>
#include <iostream>
#include <stdlib.h>

/*TODO : 
1. Handle const in llvm - gsl-modpi.c
2. Clean up shadow
3. How to figure out memcpy of only double?
*/
#define debug 0

FILE *pFile = fopen ("error.out","w");

extern "C" size_t getNewRegIndex(){
  regIndex += 1;
  return regIndex;
}

Real* getReal(size_t AddrInt){
	for (std::list<struct MyShadow*>::reverse_iterator rit=varTrack.rbegin(); rit!=varTrack.rend(); ++rit){
  	if(AddrInt == (*rit)->key){
			return (*rit)->real;	
		}
	}
  return NULL;
}


extern "C" size_t getAddr(void *Addr){
  size_t AddrInt = (size_t) Addr;
  return AddrInt;
}

extern "C" void addFunArg(size_t argNo, size_t funAddrInt, size_t argAddrInt){
  std::map<size_t, size_t> data;
  data.insert(std::pair<size_t, size_t>(funAddrInt, argNo));
	std::map<std::map<size_t, size_t>, size_t>::iterator it = shadowFunArgMap.find(data); 

  if (it != shadowFunArgMap.end()){
    shadowFunArgMap.erase(it);
  }
	if(debug)
	std::cout<<"addFunArg: insert:"<<argAddrInt<<"\n";
  shadowFunArgMap.insert(std::pair<std::map<size_t, size_t>, size_t>(data, argAddrInt));
}

void addRegRes(size_t insIndex, size_t resRegIndex){
  insMap.insert(std::pair<size_t,size_t>(insIndex, resRegIndex));
}

size_t getRegRes(size_t insIndex){

  if(insMap.count(insIndex) != 0){ 
    size_t resRegIndex = insMap.at(insIndex);
    return resRegIndex;
  }
  return 0;
}



struct MyShadow* existInStack(size_t key){
	
	for (std::list<struct MyShadow*>::reverse_iterator rit=varTrack.rbegin(); rit!=varTrack.rend(); ++rit){
  	if(currentFunc == (*rit)->key){
			return NULL;
		}
		if(key == (*rit)->key){
			return *rit;
		}
	}
	return NULL;
}

extern "C" void funcInit(size_t funcAddrInt){
	MyShadow *shadow = new MyShadow;
	shadow->key = funcAddrInt;  
	currentFunc = funcAddrInt;
  varTrack.push_back(shadow);
}

extern "C" void funcExit(size_t funcAddrInt){
  size_t var;
	struct MyShadow *shadow;
	
  while(!varTrack.empty()){
     shadow = varTrack.back();
    if(shadow->key == funcAddrInt){
      varTrack.pop_back();
      break;
    }
    mpfr_clear(shadow->real->mpfr_val);
    mpfrClear++;
		delete shadow;
    varTrack.pop_back();
  }
}

extern "C" void handleAlloca(size_t varAddrInt){
	MyShadow *shadow;
	shadow->key = varAddrInt;  
	std::cout<<"handleAlloca: added alloca addr:"<<varAddrInt<<"\n";
  varTrack.push_back(shadow);
}

extern "C" size_t handleMathFunc(size_t funcCode, double op1, size_t op1Int, 
                                                double computedRes, size_t insIndex){ 
  struct Real* real1 = NULL;
  struct Real* real_res = new Real;
  
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfrInit++;
  bool mpfrFlag1 = false; 
  real1 = getReal(op1Int);
  if(real1 == NULL){
      real1 = new Real;
      mpfr_init2(real1->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set_d(real1->mpfr_val, op1, MPFR_RNDN);

      mpfrFlag1 = true; 
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
        //std::cout<<"handleMathFunc: sqrt:\n";
        mpfr_sqrt(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 2: //floor
        //std::cout<<"handleMathFunc: floor:\n";
        mpfr_floor(real_res->mpfr_val, real1->mpfr_val);
        break;
      case 3: //tan
        //std::cout<<"handleMathFunc: tan:\n";
        mpfr_tan(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 4: //sin
        //std::cout<<"handleMathFunc: sin:\n";
        mpfr_sin(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 5: //cos
        //std::cout<<"handleMathFunc: cos:\n";
        mpfr_cos(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 6: //atan
        //std::cout<<"handleMathFunc: atan:\n";
        mpfr_atan(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 8: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_abs(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 9: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_log(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 10: //asin
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_asin(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      default:
        break;
    }
  }
  else{
    std::cout<<"handleMathFunc: Error!!!\n";
    std::cout<<"handleMathFunc res:";
    printReal(real_res);
    std::cout<<"\n";
    std::cout<<"handleMathFunc op1:";
    printReal(real1);
    std::cout<<"\n";
  }
	
	MyShadow *shadow = existInStack(newRegIdx);
	if(shadow == NULL){
		MyShadow *newShadow = new MyShadow;
		newShadow->key = newRegIdx;
		newShadow->real = real_res;  
  	varTrack.push_back(newShadow);
	}
	else{//just update the value in stack
		shadow->key = newRegIdx;
		shadow->real = real_res;  
	}
  if(debug)
    std::cout<<"handleMathFunc insert shadow mem::"<<newRegIdx<<"\n";
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    delete  real1; 
    mpfrClear++;
  }
  updateError(real_res, computedRes, insIndex);
  return newRegIdx;
}

extern "C" size_t handleMathFunc3Args(size_t funcCode, double op1, size_t op1Int,
                                                double op2, size_t op2Int,
                                                double op3, size_t op3Int,
                                                double computedRes, size_t insIndex){ 
  struct Real *real1, *real2, *real3;
  struct Real* real_res = new Real;
  
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfrInit++;
  
  bool mpfrFlag1 = false; 
  bool mpfrFlag2 = false; 
  bool mpfrFlag3 = false; 
  real1 = getReal(op1Int);
  if(real1 == NULL){
    real1 = new Real;
    mpfr_init2 (real1->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d (real1->mpfr_val, op1, MPFR_RNDD);
    mpfrFlag1 = true;
  }
    real2 = getReal(op2Int);
  if(real2 == NULL){
    real2 = new Real;
    mpfr_init2 (real2->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d (real2->mpfr_val, op2, MPFR_RNDD);
    mpfrFlag2 = true;
  }
    real3 = getReal(op3Int);
  if(real3 == NULL){
    real3 = new Real;
    mpfr_init2 (real3->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d (real3->mpfr_val, op3, MPFR_RNDD);
    mpfrFlag3 = true;
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
	MyShadow *shadow = existInStack(newRegIdx);
	if(shadow == NULL){
		MyShadow *newShadow = new MyShadow;
		newShadow->key = newRegIdx;
		newShadow->real = real_res;  
  	varTrack.push_back(newShadow);
	}
	else{//just update the value in stack
		shadow->key = newRegIdx;
		shadow->real = real_res;  
	}
  if(debug)
    std::cout<<"handleMathFunc3Args insert shadow mem::"<<newRegIdx<<"\n";
  
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

extern "C" size_t setRealConstant(size_t AddrInt, double value){
	MyShadow *shadow = existInStack(AddrInt);
	if(shadow == NULL){
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
		MyShadow *newShadow = new MyShadow;
		newShadow->key = AddrInt;
		newShadow->real = real;  
  	varTrack.push_back(newShadow);
  	if(debug)
    	std::cout<<"setRealConstant insert shadow stack::"<<AddrInt<<"\n";
	}
	else{//just update the value in stack
		shadow->key = AddrInt;
    mpfr_set_d (shadow->real->mpfr_val, value, MPFR_RNDD);
  	if(debug)
    	std::cout<<"setRealConstant update shadow stack::"<<AddrInt<<"\n";
	}
  return AddrInt;
}

extern "C" size_t computeReal(size_t opCode, size_t op1Idx, size_t op2Idx, double op1, double op2, 
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
  if(debug){
		std::cout<<"computeReal op1Idx:"<<op1Idx<<"\n";	
		std::cout<<"computeReal op2Idx:"<<op2Idx<<"\n";
  }
	real1 = getReal(op1Idx);
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
	real2 = getReal(op2Idx);
  if(real2 == NULL){
    if(debug)
      std::cout<<"computeReal: real2 is null, using op2 value:"<<op2<<"\n";
    real2 = new Real;
    mpfr_init2(real2->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(real2->mpfr_val, op2, MPFR_RNDN);
    mpfrFlag2 = true; 
  }
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    addRegRes(insIndex, newRegIdx);
  }
  mpfr_init2 (real_res->mpfr_val, PRECISION); 
  mpfrInit++;

  handleOp(opCode, &(real_res->mpfr_val), &(real1->mpfr_val), &(real2->mpfr_val));
  if(debug){
  std::cout<<"res:";
  printReal(real_res);
  std::cout<<"\nop1:";
  printReal(real1);
  std::cout<<"\nop2:";
  printReal(real2);
  std::cout<<"\n";
  }
	MyShadow *shadow = existInStack(newRegIdx);
	if(shadow == NULL){
		MyShadow *newShadow = new MyShadow;
		newShadow->key = newRegIdx;
		newShadow->real = real_res;  
  	varTrack.push_back(newShadow);
  	if(debug)
    	std::cout<<"computeReal insert shadow stack::"<<newRegIdx<<"\n";
	}
	else{//just update the value in stack
		shadow->key = newRegIdx;
		shadow->real = real_res;  
  	if(debug)
    	std::cout<<"computeReal update shadow stack::"<<newRegIdx<<"\n";
	}
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

extern "C" void checkBranch(double op1, size_t op1Int, double op2, size_t op2Int, 
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

    real1 = getReal(op1Int);
    if(real1 == NULL){
      //data might be set without store
      real1 = new Real;
      mpfr_init2(real1->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set_d(real1->mpfr_val, op1, MPFR_RNDN);
      mpfrFlag1 = true; 
    }
    real2 = getReal(op2Int);
    if(real2 == NULL){
      real2 = new Real;
      mpfr_init2(real2->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set_d(real2->mpfr_val, op2, MPFR_RNDN);
      mpfrFlag2 = true; 
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
 
	MyShadow *shadow = existInStack(index);
	if(shadow == NULL){
    struct Real* real = new Real;
    mpfr_init2(real->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
		MyShadow *newShadow = new MyShadow;
		newShadow->key = index;
		newShadow->real = real;  
  	varTrack.push_back(newShadow);
  	if(debug)
    	std::cout<<"setRealReg insert shadow stack::"<<index<<"\n";
	}
  return index;
}

extern "C" size_t getRealFunArg(size_t index, size_t funAddrInt){
  std::vector<size_t>::iterator it; 
  std::map<size_t, size_t> shadowAddrMap;
	size_t shadowAddr = 0;
  shadowAddrMap.insert(std::pair<size_t, size_t>(funAddrInt, index));
  if(shadowFunArgMap.count(shadowAddrMap) != 0){ 
  	shadowAddr = shadowFunArgMap.at(shadowAddrMap);
	}
	return shadowAddr;
}

extern "C" void setRealFunArg(size_t index, size_t funAddrInt, size_t toAddrInt, double op){
  size_t shadowAddr;
  std::vector<size_t>::iterator it; 
  std::map<size_t, size_t> shadowAddrMap;
  shadowAddrMap.insert(std::pair<size_t, size_t>(funAddrInt, index));
  if(shadowFunArgMap.count(shadowAddrMap) != 0){ 
    size_t shadowAddr = shadowFunArgMap.at(shadowAddrMap);
		
		MyShadow *shadow = existInStack(shadowAddr);
		if(shadow == NULL){
    	struct Real* real = new Real;
    	mpfr_init2(real->mpfr_val, PRECISION);
    	mpfrInit++;
    	mpfr_set_d(real->mpfr_val, op, MPFR_RNDN);
			MyShadow *newShadow = new MyShadow;
			newShadow->key = toAddrInt;
			newShadow->real = real;  
  		varTrack.push_back(newShadow);
  		if(debug)
    		std::cout<<"setRealFunArg insert shadow stack::"<<toAddrInt<<"\n";
		}
		else{//just update the value in stack
			struct Real* toReal = new Real;
      mpfr_init2(toReal->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDD);
			MyShadow *newShadow = new MyShadow;
			newShadow->key = toAddrInt;
			newShadow->real = toReal;  
  		varTrack.push_back(newShadow);

  		if(debug)
    		std::cout<<"setRealFunArg insert shadow stack::"<<toAddrInt<<"\n";
		}
	}
}

extern "C" size_t getRealReturn(size_t funAddrInt){
	size_t idx = 0;
	if(funRetMap.count(funAddrInt) != 0){
		idx = funRetMap.at(funAddrInt);
	}
  else//it shoud not happen
    std::cout<<"Error !!!! return value not found in funRetMap\n";
	return idx;
}

extern "C" void setRealReturn(size_t toAddrInt){
  if(!retTrack.empty()){
    size_t idx = retTrack.top();
    retTrack.pop();
		MyShadow *shadow = existInStack(toAddrInt);
		if(shadow != NULL){//just update the value in stack
			struct Real* toReal = new Real;
      mpfr_init2(toReal->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDD);
			//cleanup(idx);
  		if(debug)
    		std::cout<<"setRealReturn update shadow stack::"<<toAddrInt<<"\n";
		}
	}
  else
    std::cout<<"Error !!!! return value not found in stack\n";
}

extern "C" void setRealTemp(size_t toAddrInt, size_t fromAddrInt){
		MyShadow *fromShadow = existInStack(fromAddrInt);
		MyShadow *toShadow = existInStack(toAddrInt);
		if(fromShadow != NULL){
			if(toShadow == NULL){
    	struct Real* toReal = new Real;
    	mpfr_init2(toReal->mpfr_val, PRECISION);
    	mpfrInit++;
    	mpfr_set(toReal->mpfr_val, fromShadow->real->mpfr_val, MPFR_RNDN);
			MyShadow *newShadow = new MyShadow;
			newShadow->key = toAddrInt;
			newShadow->real = toReal;  
  		varTrack.push_back(newShadow);
  		if(debug)
    		std::cout<<"setRealTemp insert shadow stack::"<<toAddrInt<<"\n";
		}
		else{//just update the value in stack
      mpfr_set(toShadow->real->mpfr_val, fromShadow->real->mpfr_val, MPFR_RNDD);

  		if(debug)
    		std::cout<<"setRealConstant update shadow stack::"<<toAddrInt<<"\n";
		}
	}
  else{
  	if(debug)
   		std::cout<<"setRealTemp Error !!!fromAddr not found:: from "<<fromAddrInt<<" to "<< toAddrInt<<"\n";
  }  
}

extern "C" void handleLLVMMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
	size_t tmp = 0;
	while(size != tmp){ //handling only double
		setRealTemp(toAddrInt+tmp, fromAddrInt+tmp);
		tmp += 8;
	}
}

extern "C" size_t handleExtractValue(size_t idx, size_t funAddrInt){
	size_t shadowIdx = 0;
	if(debug)
	std::cout<<"handleExtractValue: idx:"<<idx<<"\n";
	if(funRetMap.count(funAddrInt) != 0){
		shadowIdx = funRetMap.at(funAddrInt);
		if(debug)
			std::cout<<"handleExtractValue:"<< shadowIdx + idx * sizeof(double)<<"\n";
	}
	return shadowIdx + idx * sizeof(double); //TODO: handling just double, generate error for other cases
}

extern "C" void trackReturn(size_t funAddrInt, size_t Idx){
	if(debug)
		std::cout<<"trackReturn:"<<Idx<<"\n";
  retTrack.push(Idx);
  funRetMap.insert(std::pair<size_t, size_t>(funAddrInt, Idx));
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
   if (debug){
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
  std::cout<<"\n\n"; 
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
  //  mpfr_clear(it->second->mpfr_val);
   // delete(it->second);
  //  shadowMap.erase(it);
  //  mpfrClear++;
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

