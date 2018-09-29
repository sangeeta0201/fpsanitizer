#include "handleReal.h"
#include <string.h>
#include <fstream>
#include <queue>
#include <iostream>
#include <stdlib.h>
#include <pthread.h>

/*TODO : 
1. Handle const in llvm - gsl-modpi.c
2. Clean up shadow
3. How to figure out memcpy of only double?
*/
#define debug 0

pthread_mutex_t the_mutex;
pthread_cond_t condc, condp;
pthread_t con;

FILE *pFile = fopen ("error.out","w");

extern "C" size_t getNewRegIndex(){
  regIndex += 1;
  return regIndex;
}

Real* getReal(size_t AddrInt){
	for (std::list<struct MyShadow*>::reverse_iterator rit=varTrack.rbegin(); rit!=varTrack.rend(); ++rit){
  	if(AddrInt == (*rit)->key){
			if(AddrInt == 0)
				std::cout<<"getReal:"<<(*rit)->key<<"\n";
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


void printStack(){
	for (std::list<struct MyShadow*>::reverse_iterator rit=varTrack.rbegin(); rit!=varTrack.rend(); ++rit){
		std::cout<<(*rit)->key<<"\n";
	}
}
struct MyShadow* existInStack(size_t key){
	for (std::list<struct MyShadow*>::reverse_iterator rit=varTrack.rbegin(); rit!=varTrack.rend(); ++rit){
  	//if(currentFunc == (*rit)->key){
	//		return NULL;
	//	}
		if (rit == varTrack.rend())
			return NULL;
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
	if(funcAddrInt == 0)
		std::cout<<"insert 0 1\n";
  varTrack.push_back(shadow);
}

extern "C" void funcExit(size_t funcAddrInt, size_t returnIdx){
  size_t var;
	struct MyShadow *shadow = NULL;
	struct MyShadow *newShadow = NULL;
	if(debug)
		std::cout<<"funcExit:"<<returnIdx<<"\n";
	retTrack.push(returnIdx);
  funRetMap.insert(std::pair<size_t, size_t>(funcAddrInt, returnIdx));
  while(!varTrack.empty()){
		shadow = varTrack.back();
    if(shadow->key == funcAddrInt){
      varTrack.pop_back();
			if(newShadow != NULL){
				varTrack.push_back(newShadow); //push back returned value to stack
				if(shadow->key == 0)
					std::cout<<"insert 0 2\n";
				std::cout<<"Pushed back:"<<newShadow->key<<"\n";
			}
      break;
    }
		if(shadow->key == returnIdx){
			struct Real* toReal = new Real;
			mpfr_init2(toReal->mpfr_val, PRECISION);
			mpfrInit++;
			mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDD);
			newShadow = new MyShadow;
			newShadow->key = shadow->key;
			newShadow->real = toReal;  
		}
		if(debug)
			std::cout<<"Cleaned:"<<shadow->key<<"\n";
    mpfr_clear(shadow->real->mpfr_val);
    mpfrClear++;
		delete shadow->real;
		delete shadow;
    varTrack.pop_back();
  }
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
			if(debug)
      	std::cout<<"handleMathFunc: real1 is null, using op1 value:"<<op1<<"\n";
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
	if(debug)
        std::cout<<"handleMathFunc: sqrt:\n";
        mpfr_sqrt(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 2: //floor
	if(debug)
        std::cout<<"handleMathFunc: floor:\n";
        mpfr_floor(real_res->mpfr_val, real1->mpfr_val);
        break;
      case 3: //tan
	if(debug)
        std::cout<<"handleMathFunc: tan:\n";
        mpfr_tan(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 4: //sin
	if(debug)
        std::cout<<"handleMathFunc: sin:\n";
        mpfr_sin(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 5: //cos
	if(debug)
        std::cout<<"handleMathFunc: cos:\n";
        mpfr_cos(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 6: //atan
	if(debug)
        std::cout<<"handleMathFunc: atan:\n";
        mpfr_atan(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 8: //atan
	if(debug)
        std::cout<<"handleMathFunc: abs:\n";
        mpfr_abs(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 9: //atan
	if(debug)
        std::cout<<"handleMathFunc: log:\n";
        mpfr_log(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      case 10: //asin
	if(debug)
        std::cout<<"handleMathFunc: asin:\n";
        mpfr_asin(real_res->mpfr_val, real1->mpfr_val, MPFR_RNDD);
        break;
      default:
        break;
    }
  }
  else{
    std::cout<<"handleMathFunc: Error!!!\n";
  }
	
	MyShadow *shadow = existInStack(newRegIdx);
	if(shadow == NULL){
		MyShadow *newShadow = new MyShadow;
		newShadow->key = newRegIdx;
		newShadow->real = real_res;  
				if(newShadow->key == 0)
					std::cout<<"insert 0 3\n";
  	varTrack.push_back(newShadow);
	}
	else{//just update the value in stack
    	mpfr_clear(shadow->real->mpfr_val);
    	mpfrClear++;
			delete shadow->real;
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
				if(newShadow->key == 0)
					std::cout<<"insert 0 4\n";
  	varTrack.push_back(newShadow);
	}
	else{//just update the value in stack
    	mpfr_clear(shadow->real->mpfr_val);
    	mpfrClear++;
			delete shadow->real;
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

int handleCmp(mpfr_t *op1, mpfr_t *op2){
	return mpfr_cmp(*op1, *op2); 
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
    	std::cout<<"setRealConstant insert shadow stack::"<<AddrInt<<" value:"<<value<<"\n";
	}
	else{//just update the value in stack
		shadow->key = AddrInt;
    mpfr_init2(shadow->real->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d (shadow->real->mpfr_val, value, MPFR_RNDD);
  	if(debug)
    	std::cout<<"setRealConstant update shadow stack::"<<AddrInt<<" value:"<<value<<"\n";
	}
  return AddrInt;
}
//TODO: why operands can not be uplifted to double? 
//Do i need to pass computedRes in float as well?
void* consumer(void *ptr) {
  int i;
	ComputeR *op; 
	size_t opCode;
	size_t op1Idx; 
	size_t op2Idx; 
	float op1f;
	float op2f; 
	double op1d; 
	double op2d; 
	double computedRes;
	size_t typeId;
	size_t insIndex;
	size_t newRegIdx;

	while(!buffer.empty()){
		op = buffer.front();
		buffer.pop();
		double op1, op2;
		opCode = op->opCode;
		op1Idx = op->op1Idx;
		op2Idx = op->op2Idx;
		op1f = op->op1f;
		op2f = op->op2f;
		op1d = op->op1d;
		op2d = op->op2d;
		computedRes = op->computedRes;
		typeId = op->typeId;
		insIndex = op->insIndex;
		newRegIdx = op->newRegIdx;

		if(typeId == 2){ //float
			op1 = op1f;
			op2 = op2f; 
		}
		else if(typeId == 3){ //double
			op1 = op1d; 
			op2 = op2d;
		}
		else
			std::cout<<"computeReal: Error!!! Unknown type:"<<typeId<<"\n";
	
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
			std::cout<<"computeReal op1Idx:"<<op1Idx<<" op1:"<<op1<<"\n";	
			std::cout<<"computeReal op2Idx:"<<op2Idx<<" op2:"<<op2<<"\n";
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
  	mpfr_init2 (real_res->mpfr_val, PRECISION); 
  	mpfrInit++;

  	handleOp(opCode, &(real_res->mpfr_val), &(real1->mpfr_val), &(real2->mpfr_val));
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
			
			mpfr_clear(shadow->real->mpfr_val);
    	delete(shadow->real);
    	mpfrClear++;

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
	
	}	
 	//pthread_mutex_lock(&the_mutex);	/* protect buffer */
 // pthread_mutex_unlock(&the_mutex);	/* release the buffer */
}

extern "C" size_t computeReal(size_t opCode, size_t op1Idx, size_t op2Idx, float op1f, float op2f, 
																		double op1d, double op2d, double computedRes,
                                    size_t typeId, size_t insIndex){
	

	compute++;
	ComputeR *op = new ComputeR;
	op->opCode = opCode;
	op->op1Idx = op1Idx;
	op->op2Idx = op2Idx;
	op->op1f = op1f;
	op->op2f = op2f;
	op->op1d = op1d;
	op->op2d = op2d;
	op->computedRes = computedRes;
	op->typeId = typeId;
	op->insIndex = insIndex;

	buffer.push(op);	
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    addRegRes(insIndex, newRegIdx);
  }
	op->newRegIdx = newRegIdx;
  return newRegIdx;
}

int isNaN(Real *real){
  return mpfr_nan_p(real->mpfr_val);                                                            
}

extern "C" void checkBranch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            int fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
  size_t regIndex1;
  size_t regIndex2;

  Real *real1;
  Real *real2;

  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
  struct Real* real_res = new Real;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
	if(debug){
		std::cout<<"checkBranch fcmpFlag:"<<fcmpFlag<<"\n";	
		std::cout<<"checkBranch op1Idx:"<<op1Int<<" op1:"<<op1<<"\n";	
		std::cout<<"checkBranch op2Idx:"<<op2Int<<" op2:"<<op2<<"\n";
	}
  real1 = getReal(op1Int);
  if(real1 == NULL){
      //data might be set without store
	if(debug)
    std::cout<<"checkBranch: real1 is null, using op1 value:"<<op1<<"\n";
		real1 = new Real;
    mpfr_init2(real1->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(real1->mpfr_val, op1, MPFR_RNDN);
    mpfrFlag1 = true; 
  }
  real2 = getReal(op2Int);
  if(real2 == NULL){
	if(debug)
    std::cout<<"checkBranch: real2 is null, using op2 value:"<<op2<<"\n";
  	real2 = new Real;
    mpfr_init2(real2->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(real2->mpfr_val, op2, MPFR_RNDN);
    mpfrFlag2 = true; 
  }
  bool realRes = false;
	int ret = handleCmp(&(real1->mpfr_val), &(real2->mpfr_val));
  switch(fcmpFlag){
    case 0: 
            realRes = false;
            break;
    case 1: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(ret == 0)
                realRes = true;
            }
            break;
    case 2: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(ret > 0){
                realRes = true;
							}
            }
            break;
    case 3: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(ret > 0 || ret == 0){
                realRes = true;
            	}
						}
            break;
    case 4: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(ret < 0){
                realRes = true;
            	}
						}
            break;
    case 5: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(ret < 0 || ret == 0){
                realRes = true;
            	}
						}
            break;
    case 6: 
            if(!isNaN(real1) && !isNaN(real2)){
              if(ret != 0){
                realRes = true;
            	}
						}
            break;
    case 7: 
            if(!isNaN(real1) && !isNaN(real2)){
            	realRes = true;
						}
            break;
    case 8: 
            if(isNaN(real1) && isNaN(real2)){
              realRes = true;
            }
            break;
    case 9: 
            if(isNaN(real1) || isNaN(real2) || ret == 0)
              realRes = true;
            break;
    case 10: 
            if(isNaN(real1) || isNaN(real2) || ret > 0)
              realRes = true;
            break;
    case 11: 
            if(isNaN(real1) || isNaN(real2) || ret > 0 || ret == 0)
              realRes = true;
            break;
    case 12: 
            if(isNaN(real1) || isNaN(real2) || ret < 0)
              realRes = true;
            break;
    case 13: 
            if(isNaN(real1) || isNaN(real2) || ret < 0 || ret == 0)
              realRes = true;
            break;
    case 14: 
            if(isNaN(real1) || isNaN(real2) || ret != 0){
            	realRes = true;
						}
            break;
    case 15: 
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
	if(debug)
	std::cout<<"checkBranch: realRes:"<<realRes<<" computedRes:"<<computedRes<<"\n";
  updateBranchError(realRes, computedRes, insIndex, lineNo);
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
				if(newShadow->key == 0)
					std::cout<<"insert 0 6\n";
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
				if(newShadow->key == 0)
					std::cout<<"insert 0 7\n";
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
				if(newShadow->key == 0)
					std::cout<<"insert 0 8\n";
  		varTrack.push_back(newShadow);

  		if(debug)
    		std::cout<<"setRealFunArg update from:"<<shadow->key<<" to :"<<toAddrInt<<"\n";
		}
	}
	else{
  		if(debug)
    		std::cout<<"setRealFunArg Error !!! Argument not found\n";
	}
}

extern "C" size_t getRealReturn(size_t funAddrInt){
	size_t idx = 0;
	if(funRetMap.count(funAddrInt) != 0){
		idx = funRetMap.at(funAddrInt);
	}
  else//it shoud not happen
	if(debug)
    std::cout<<"getRealReturn: Error !!!! return value not found in funRetMap\n";
	return idx;
}

extern "C" void setRealReturn(size_t toAddrInt){
	if(!retTrack.empty()){
    size_t idx = retTrack.top();
    retTrack.pop();
		MyShadow *shadow = existInStack(idx);
		if(shadow != NULL){//just update the value in stack
			struct Real* toReal = new Real;
      mpfr_init2(toReal->mpfr_val, PRECISION);
      mpfrInit++;
      mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDD);
			MyShadow *newShadow = new MyShadow;
			newShadow->key = toAddrInt;
			newShadow->real = toReal;  
				if(newShadow->key == 0)
					std::cout<<"insert 0 9\n";
  		varTrack.push_back(newShadow);
//			mpfr_clear(shadow->real->mpfr_val);
//    	mpfrClear++;
 //   	delete shadow->real;
 //   	delete shadow;
	
  		if(debug)
    		std::cout<<"setRealReturn: insert shadow stack::"<<toAddrInt<<"\n";
		}
		else{
  		if(debug)
    		std::cout<<"setRealReturn: not found in stack::"<<"\n";
		}
	}
  else
    std::cout<<"setRealReturn: Error !!!! return value not found in stack\n";
}


extern "C" void setRealTemp(size_t toAddrInt, size_t fromAddrInt, double op){
	setReal++;
#if 1 
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
				if(newShadow->key == 0)
					std::cout<<"insert 0 10\n";
  			varTrack.push_back(newShadow);
  			if(debug)
    			std::cout<<"setRealTemp insert shadow stack from:"<<fromShadow->key<<" to:"<<toAddrInt<<"\n";
		}
		else{//just update the value in stack
			if(debug)
    		std::cout<<"setRealTemp update shadow stack:"<<toAddrInt<<"\n";
      mpfr_set(toShadow->real->mpfr_val, fromShadow->real->mpfr_val, MPFR_RNDD);
		}
	}
	else if(op != 0){
    struct Real* toReal = new Real;
    mpfr_init2(toReal->mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(toReal->mpfr_val, op, MPFR_RNDN);
		MyShadow *newShadow = new MyShadow;
		newShadow->key = toAddrInt;
		newShadow->real = toReal;  
				if(newShadow->key == 0)
					std::cout<<"insert 0 11\n";
  	varTrack.push_back(newShadow);
  	if(debug)
    	std::cout<<"setRealTemp insert:"<<op<<" shadow stack to:"<<toAddrInt<<"\n";
	}
#endif
}

extern "C" void handleLLVMMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
	size_t tmp = 0;
	while(size != tmp){ //handling only double
		std::cout<<"handleLLVMMemcpy\n";
		setRealTemp(toAddrInt+tmp, fromAddrInt+tmp, 0);
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
void printReal(mpfr_t mpfr_val){
  char* shadowValStr;
  mpfr_exp_t shadowValExpt;

  shadowValStr = mpfr_get_str(NULL, &shadowValExpt, 10, 15, mpfr_val, MPFR_RNDN);
  printf("%c.%se%ld", shadowValStr[0], shadowValStr+1, shadowValExpt-1);
  mpfr_free_str(shadowValStr);
	std::cout<<"\n";
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

void updateBranchError(bool realRes, bool computedRes, size_t insIndex, size_t lineNo){
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
  brErr->lineNo = lineNo;

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
    printReal(realVal->mpfr_val);
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

extern "C" void init(){
	//create consumer

  // Initialize the mutex and condition variables
  /* What's the NULL for ??? */

  pthread_mutex_init(&the_mutex, NULL);	
  pthread_cond_init(&condc, NULL);	

	pthread_create(&con, NULL, consumer, NULL);
	pthread_join(con, NULL);

}

extern "C" void finish(){
  int n;
	std::cout<<"compute:"<<compute<<"\n";
	std::cout<<"setReal:"<<setReal<<"\n";
	for (std::list<struct MyShadow*>::iterator it=varTrack.begin(); it!=varTrack.end(); ++it){
		if((*it)->real != NULL){
			mpfr_clear((*it)->real->mpfr_val);
    	mpfrClear++;
	    delete (*it)->real;
		}
	  delete (*it);
	}
	for (std::list<struct MyShadow*>::iterator it=varTrack.begin(); it!=varTrack.end(); ++it){
		it = varTrack.erase(it);
	}
	std::cout<<"list:";
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
    fprintf (pFile, " compare @ %lld", it->second->lineNo);
    fprintf (pFile, "\n\n\n");
  }
  fclose (pFile);
}

