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

size_t getRegRes(size_t insIndex){
  if(insMap[insIndex] != 0){ 
    newRegIdx = insMap[insIndex];
	}
	else{
		newRegIdx = slotIdx;
  	insMap[insIndex] = slotIdx;
  	slotIdx += 1;
	}
	if(debug)
	std::cout<<"getRegRes: newRegIdx:"<<newRegIdx<<" frameCur[frameIdx]:"<<frameCur[frameIdx]<<"\n";
	return newRegIdx + frameCur[frameIdx];
}

extern "C" size_t getAddr(void *Addr){
  size_t AddrInt = (size_t) Addr;
  return AddrInt;
}

extern "C" void addReturnAddr(){
	slotIdx++;
}

extern "C" void addFunArg(size_t argNo,size_t argAddrInt, double op){
	argCount++;
	if(debug)
		std::cout<<"addFunArg: frameCur[frameIdx]:"<<frameCur[frameIdx]<<" slotIdx:"<<slotIdx<<"\n";
	size_t stackTop = frameCur[frameIdx]+slotIdx;
	if(argAddrInt != 0){
		mpfr_set(shadowStack[stackTop], *(mpfr_t *)argAddrInt, MPFR_RNDN);
	}
	else{
		mpfr_set_d(shadowStack[stackTop], op, MPFR_RNDN);
	}
	if(debug){
	std::cout<<"addFunArg: arg copied from: "<<argAddrInt<<" stackTop:"<<stackTop<<"\n";
	std::cout<<"addFunArg: addr:"<<(size_t)&shadowStack[stackTop]<<"\n";
	}
	slotIdx++;
}

extern "C" void funcInit(size_t totalSlots){
	if(debug)
	std::cout<<"******funcInit*****\n";
	frameIdx++;
	if(debug)
	std::cout<<"funcInit: slotIdx:"<<slotIdx<<"\n";
	frameCur[frameIdx] = frameCur[frameIdx-1]+slotIdx /*return index*/ ;
	slotIdx = 0;	
	if(debug)
	std::cout<<"funcInit current frame point to stack index:"<<frameCur[frameIdx]<<"\n";
}

extern "C" void funcExit(size_t returnIndex){

	if(debug){
		std::cout<<"******funcExit*****\n";
		std::cout<<"slotIdx:"<<slotIdx<<"\n";
		std::cout<<"frameCur[frameIdx]:"<<frameCur[frameIdx]<<"\n";
	}
  size_t var;

	slotIdx = (frameCur[frameIdx] - argCount - 1) - frameCur[frameIdx - 1]; //check
	returnIdx = slotIdx;
	argCount = 0;
	slotIdx++;
	if(debug)
		std::cout<<"funcExit: slotIdx:"<<slotIdx<<"\n";
	if(returnIndex != 0){
		if(debug)
			std::cout<<"funcExit: return copied from:"<<returnIndex<<" to stackTop:"<<returnIdx <<" addr:"<<(size_t)&shadowStack[returnIdx]<<"\n";
		mpfr_set(shadowStack[returnIdx], *(mpfr_t *)returnIndex, MPFR_RNDN);
	}	
	frameIdx--;
}

extern "C" void handleAlloca(size_t varAddrInt){
}

extern "C" void* handleMathFunc(size_t funcCode, double op1, size_t op1Int, 
                                                double computedRes, size_t insIndex){ 
  mpfr_t real_res, r1;
  
  mpfrInit++;
  bool mpfrFlag1 = false; 
  mpfr_t *real1 = (mpfr_t *)op1Int;
  if(op1Int == 0){
		mpfr_init2(r1, PRECISION);
		mpfrInit++;
		mpfr_set_d(r1, op1, MPFR_RNDN);
		real1 = &r1;
		mpfrFlag1 = true; 
  }
	if(debug)
	std::cout<<"handleMathFunc: op1Addr:"<<op1Int<<"\n";
 
  size_t newRegIdx = getRegRes(insIndex);
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        //std::cout<<"handleMathFunc: sqrt:\n";
        mpfr_sqrt(shadowStack[newRegIdx], *real1, MPFR_RNDN);
        break;
      case 2: //floor
        //std::cout<<"handleMathFunc: floor:\n";
        mpfr_floor(shadowStack[newRegIdx], *real1);
        break;
      case 3: //tan
        //std::cout<<"handleMathFunc: tan:\n";
        mpfr_tan(shadowStack[newRegIdx], *real1, MPFR_RNDN);
        break;
      case 4: //sin
        //std::cout<<"handleMathFunc: sin:\n";
        mpfr_sin(shadowStack[newRegIdx], *real1, MPFR_RNDN);
        break;
      case 5: //cos
        //std::cout<<"handleMathFunc: cos:\n";
        mpfr_cos(shadowStack[newRegIdx], *real1, MPFR_RNDN);
        break;
      case 6: //atan
        //std::cout<<"handleMathFunc: atan:\n";
        mpfr_atan(shadowStack[newRegIdx], *real1, MPFR_RNDN);
        break;
      case 8: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_abs(shadowStack[newRegIdx], *real1, MPFR_RNDN);
        break;
      case 9: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_log(shadowStack[newRegIdx], *real1, MPFR_RNDN);
        break;
      case 10: //asin
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_asin(shadowStack[newRegIdx], *real1, MPFR_RNDN);
        break;
      default:
        break;
    }
  }
  else{
    std::cout<<"handleMathFunc: Error!!!\n";
    std::cout<<"handleMathFunc res:";
    std::cout<<"\n";
    std::cout<<"handleMathFunc op1:";
//    printReal(real1);
    std::cout<<"\n";
  }
	
  if(debug)
    std::cout<<"handleMathFunc insert shadow mem::"<<newRegIdx<<"\n";
  if(mpfrFlag1){
    mpfr_clear(*real1);
    mpfrClear++;
  }
	updateError(shadowStack[newRegIdx], computedRes, insIndex);
  return &shadowStack[newRegIdx];
}

extern "C" size_t handleMathFunc3Args(size_t funcCode, double op1, size_t op1Int,
                                                double op2, size_t op2Int,
                                                double op3, size_t op3Int,
                                                double computedRes, size_t insIndex){ 
  mpfr_t *real1, *real2, *real3;
  mpfr_t real_res;
  mpfr_init2 (real_res, PRECISION); 
  mpfrInit++;
  
  bool mpfrFlag1 = false; 
  bool mpfrFlag2 = false; 
  bool mpfrFlag3 = false; 
  real1 = (mpfr_t *)op1Int;
  if(real1 == NULL){
    mpfr_init2 (*real1, PRECISION);
    mpfrInit++;
    mpfr_set_d (*real1, op1, MPFR_RNDN);
    mpfrFlag1 = true;
  }
	real2 = (mpfr_t *)op2Int;
  if(real2 == NULL){
    mpfr_init2 (*real2, PRECISION);
    mpfrInit++;
    mpfr_set_d (*real2, op2, MPFR_RNDN);
    mpfrFlag2 = true;
  }
	real3 = (mpfr_t *)op3Int;
  if(real3 == NULL){
    mpfr_init2 (*real3, PRECISION);
    mpfrInit++;
    mpfr_set_d (*real3, op3, MPFR_RNDN);
    mpfrFlag3 = true;
  }
  size_t newRegIdx = getRegRes(insIndex);
  
  if(real1 != NULL && real2 != NULL && real3 != NULL){
    switch(funcCode){
      case 7: //fma
        mpfr_fma(real_res, *real1, *real2, *real3, MPFR_RNDN);
        break;
      default:
        std::cout<<"Error!!!!\n";
        break;
    }
  }
  else
    std::cout<<"handleMathFunc3Args: Error!!!\n";
	mpfr_init2(shadowStack[newRegIdx], PRECISION);
	mpfrInit++;
	mpfr_set(shadowStack[newRegIdx], real_res, MPFR_RNDN);  
  if(debug)
    std::cout<<"handleMathFunc3Args insert shadow mem::"<<newRegIdx<<"\n";
  
  if(mpfrFlag1){
    mpfr_clear(*real1);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(*real2);
    mpfrClear++;
  }
  if(mpfrFlag3){
    mpfr_clear(*real3);
    mpfrClear++;
  }
  updateError(shadowStack[newRegIdx], computedRes, insIndex);
  return newRegIdx;
}

void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2){
  switch(opCode) {                                                                                            
    case 12: //FADD
      if(debug)
        std::cout<<"\nFADD\n";
      mpfr_add (*res, *op1, *op2, MPFR_RNDN);
      break;
    case 14: //FSUB
      if(debug)
        std::cout<<"FSUB\n";
      mpfr_sub (*res, *op1, *op2, MPFR_RNDN);
      break;
    case 16: //FMUL
      if(debug)
        std::cout<<"FMUL\n";
      mpfr_mul (*res, *op1, *op2, MPFR_RNDN);
      break;
    case 19: //FDIV
      if(debug)
        std::cout<<"FDIV\n";
      mpfr_div (*res, *op1, *op2, MPFR_RNDN);
      break;
    default:
      // do nothing
      break;
  } 
  if(0){
    std::cout<<"handleOp op1:\n";
    mpfr_out_str (stdout, 10, 0, *op1, MPFR_RNDN);
    std::cout<<"\n";
    std::cout<<"handleOp op2:\n";
    mpfr_out_str (stdout, 10, 0, *op2, MPFR_RNDN);
    std::cout<<"\n";
    std::cout<<"handleOp res:\n";
    mpfr_out_str (stdout, 10, 0, *res, MPFR_RNDN);
    std::cout<<"\n";
  }
}

extern "C" size_t setRealConstant(size_t AddrInt, double value){
	size_t offset = (AddrInt) & 0xffffff;
	if(debug)
	std::cout<<"setRealConstant: Added constant in shadowMem at:"<<AddrInt<<"\n"; 
	mpfr_init2(shadowMap[offset], PRECISION);
	mpfrInitMap++;
	mpfr_set_d(shadowMap[offset], value, MPFR_RNDN);
  return AddrInt;
}

extern "C" void* handleMalloc(void *Addr, size_t size){
	size_t tmp = 0;
	size_t AddrInt, offset;
	double op = 0;
	while(tmp <= size){ //handling only double
		//setRealTemp(toAddrInt+tmp, fromAddrInt+tmp);
		tmp += 8;
		AddrInt = (size_t)Addr;
//		std::cout<<"handleMalloc AddrInt:"<<AddrInt<<" set to 0\n";
		offset = (AddrInt) & 0xffffff;
		Addr = Addr + 8;
		mpfr_init2(shadowMap[offset], PRECISION);
		mpfrInit++;
		mpfr_set_d(shadowMap[offset], op, MPFR_RNDN);
	}
}

extern "C" void* fpSanLoadFromShadowMem(void *Addr, size_t insIndex){
  size_t newRegIdx = getRegRes(insIndex);
	size_t AddrInt = (size_t) Addr;
	if(debug)
		std::cout<<"fpSanLoadFromShadowMem AddrInt:"<<AddrInt<<" set to 0\n";
	size_t offset = (AddrInt) & 0xffffff;
	mpfr_set(shadowStack[newRegIdx], shadowMap[offset], MPFR_RNDN);
	if(debug){
		std::cout<<"shadowMap[offset]:";
  	mpfr_out_str (stdout, 10, 0, shadowMap[offset], MPFR_RNDN);
		std::cout<<"\n";
		std::cout<<"shadowStack[newRegIdx]:";
  	mpfr_out_str (stdout, 10, 0, shadowStack[newRegIdx], MPFR_RNDN);
		std::cout<<"\n";
	}
	size_t addr = (size_t) &shadowStack[newRegIdx];
	if(debug)
		std::cout<<"fpSanLoadFromShadowMem: set value in shadowStack at:"<<newRegIdx<<" for addr:"<<addr<<" from offset:"<<offset<<"\n";
	return &shadowStack[newRegIdx];
}

extern "C" void* computeReal(size_t opCode, size_t op1Addr, size_t op2Addr, double op1, double op2, 
                                    double computedRes, size_t insIndex){
  size_t regIndex1;
  size_t regIndex2;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
  mpfr_t *real1;
  mpfr_t *real2;
  mpfr_t r1;
  mpfr_t r2;
	if(debug){
		std::cout<<"computeReal: op1Addr:"<<op1Addr<<" op1:"<<op1<<"\n";
		std::cout<<"computeReal: op2Addr:"<<op2Addr<<" op2:"<<op2<<"\n";
	}
  mpfr_t op1_mpfr;
  mpfr_t op2_mpfr;
	if(op1Addr == 0){ //it is a constant
    if(debug)
      std::cout<<"computeReal: real1 is null, using op1 value:"<<op1<<"\n";
    mpfr_init2(r1, PRECISION);
    mpfrInit++;
		real1 = &r1;
    mpfr_set_d(r1, op1, MPFR_RNDN);
    mpfrFlag1 = true; 
	}
	else{
		real1 = (mpfr_t *)op1Addr;
		if(*real1 == 0){
			std::cout<<"real1 is null\n";
		}
      //data might be set without store
  }
	if(op2Addr == 0){
    if(debug)
      std::cout<<"computeReal: real2 is null, using op2 value:"<<op2<<"\n";
    mpfr_init2(r2, PRECISION);
    mpfrInit++;
    mpfr_set_d(r2, op2, MPFR_RNDN);
		real2 = &r2;
    mpfrFlag2 = true; 
		
	}
	else{
		real2 = (mpfr_t *)op2Addr;
		if(*real2 == 0){
			std::cout<<"real2 is null\n";
		}
	}
  size_t newRegIdx = getRegRes(insIndex);
	if(debug){
  	std::cout<<"computeReal op1:";
  	printReal(*real1);
  	//mpfr_out_str (stdout, 10, 0, *real1, MPFR_RNDN);
		std::cout<<"\n";
  	std::cout<<"computeReal op2:";
  	printReal(*real2);
  	//mpfr_out_str (stdout, 10, 0, *real2, MPFR_RNDN);
	}

  handleOp(opCode, &(shadowStack[newRegIdx]), real1, real2);
  if(debug){
  	std::cout<<"res:";
  	std::cout<<"\n";
  }
  if(mpfrFlag1){
    mpfr_clear(*real1);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(*real2);
    mpfrClear++;
  }
	if(debug)
		std::cout<<"computeReal: stackTop:"<<newRegIdx<<" addr:"<<(size_t)&shadowStack[newRegIdx]<<"\n";
  //printReal(shadowStack[newRegIdx]);
  updateError(shadowStack[newRegIdx], computedRes, insIndex);
  return &shadowStack[newRegIdx];
}

int isNaN(mpfr_t real){
  return mpfr_nan_p(real);
}


int handleCmp(mpfr_t *op1, mpfr_t *op2){
	return mpfr_cmp(*op1, *op2); 
}

extern "C" void checkBranch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            int fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
	mpfr_t *real1;
	mpfr_t *real2;

	mpfr_t r1;
	mpfr_t r2;

	bool mpfrFlag1 = false;
	bool mpfrFlag2 = false;
	if(debug){
		std::cout<<"checkBranch fcmpFlag:"<<fcmpFlag<<"\n"; 
		std::cout<<"checkBranch op1Idx:"<<op1Int<<" op1:"<<op1<<"\n"; 
		std::cout<<"checkBranch op2Idx:"<<op2Int<<" op2:"<<op2<<"\n";
	}
	real1 = (mpfr_t *)op1Int;
	if(real1 == NULL){
      //data might be set without store
		if(debug)
			std::cout<<"checkBranch: real1 is null, using op1 value:"<<op1<<"\n";
		mpfr_init2(r1, PRECISION);
		mpfrInit++;
		mpfr_set_d(r1, op1, MPFR_RNDN);
		real1 = &r1;
		mpfrFlag1 = true; 
	}
	real2 = (mpfr_t *)op2Int;
	if(real2 == NULL){
		if(debug)
			std::cout<<"checkBranch: real2 is null, using op2 value:"<<op2<<"\n";
		mpfr_init2(r2, PRECISION);
		mpfrInit++;
		mpfr_set_d(r2, op2, MPFR_RNDN);
		real2 = &r2;
		mpfrFlag2 = true; 
	}
	bool realRes = false;
	if(debug){
  	std::cout<<"checkBranch op1:";
  	printReal(*real1);
		std::cout<<"\n";
  	std::cout<<"checkBranch op2:";
  	printReal(*real2);
		std::cout<<"\n";
	}
	int ret = handleCmp(real1, real2);
	switch(fcmpFlag){
		case 0: 
			realRes = false;
			break;
		case 1: 
			if(!isNaN(*real1) && !isNaN(*real2)){
				if(ret == 0)
					realRes = true;
			}
			break;
		case 2: 
			if(!isNaN(*real1) && !isNaN(*real2)){
				if(ret > 0){
					realRes = true;
				}
			}
			break;
		case 3: 
			if(!isNaN(*real1) && !isNaN(*real2)){
				if(ret > 0 || ret == 0){
					realRes = true;
				}
			}
			break;
		case 4: 
			if(!isNaN(*real1) && !isNaN(*real2)){
				if(ret < 0){
					realRes = true;
				}
			}
			break;
		case 5: 
			if(!isNaN(*real1) && !isNaN(*real2)){
				if(ret < 0 || ret == 0){
					realRes = true;
				}
			}
			break;
		case 6: 
			if(!isNaN(*real1) && !isNaN(*real2)){
				if(ret != 0){
					realRes = true;
				}
			}
			break;
		case 7: 
			if(!isNaN(*real1) && !isNaN(*real2)){
				realRes = true;
			}
			break;
		case 8: 
			if(isNaN(*real1) && isNaN(*real2)){
				realRes = true;
			}
			break;
		case 9: 
			if(isNaN(*real1) || isNaN(*real2) || ret == 0)
				realRes = true;
			break;
		case 10: 
			if(isNaN(*real1) || isNaN(*real2) || ret > 0)
				realRes = true;
			break;
		case 11: 
			if(isNaN(*real1) || isNaN(*real2) || ret > 0 || ret == 0)
				realRes = true;
			break;
		case 12: 
			if(isNaN(*real1) || isNaN(*real2) || ret < 0)
				realRes = true;
			break;
		case 13: 
			if(isNaN(*real1) || isNaN(*real2) || ret < 0 || ret == 0)
				realRes = true;
			break;
		case 14: 
			if(isNaN(*real1) || isNaN(*real2) || ret != 0){
				realRes = true;
			}
			break;
		case 15: 
			realRes = true;
			break;
	}
  if(mpfrFlag1){
    mpfr_clear(*real1);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(*real2);
    mpfrClear++;
  }
	if(debug)
		std::cout<<"checkBranch: realRes:"<<realRes<<" computedRes:"<<computedRes<<"\n";
	updateBranchError(realRes, computedRes, insIndex, lineNo);
}
/*
extern "C" size_t setRealReg(size_t index, double value){
	mpfr_t real; 
	MyShadow *shadow = existInStack(index);
	if(shadow == NULL){
    mpfr_init2(real, PRECISION);
    mpfrInit++;
    mpfr_set_d(real, value, MPFR_RNDN);
		MyShadow *newShadow = new MyShadow;
		newShadow->key = index;
		newShadow->real = real;  
  	push(newShadow);
  	if(debug)
    	std::cout<<"setRealReg insert shadow stack::"<<index<<"\n";
	}
  return index;
}
*/
extern "C" void* getRealFunArg(size_t index){
	if(debug){
	std::cout<<"getRealFunArg: from stack index:"<<frameCur[frameIdx] - index - 1<<"\n";
	std::cout<<"getRealFunArg: addr:"<<(size_t)&shadowStack[frameCur[frameIdx] - index - 1]<<"\n";
	}
	return &shadowStack[frameCur[frameIdx] - index - 1];
}
/*
extern "C" void setRealFunArg(size_t index, size_t funAddrInt, size_t toAddrInt, double op){
  size_t shadowAddr;
  std::vector<size_t>::iterator it; 
  std::map<size_t, size_t> shadowAddrMap;
  shadowAddrMap.insert(std::pair<size_t, size_t>(funAddrInt, index));
  if(shadowFunArgMap.count(shadowAddrMap) != 0){ 
    size_t shadowAddr = shadowFunArgMap.at(shadowAddrMap);
		
		MyShadow *shadow = existInStack(shadowAddr);
		if(shadow == NULL){
    	mpfr_init2(real->mpfr_val, PRECISION);
    	mpfrInit++;
    	mpfr_set_d(real->mpfr_val, op, MPFR_RNDN);
			MyShadow *newShadow = new MyShadow;
			newShadow->key = toAddrInt;
			newShadow->real = real;  
  		push(newShadow);
  		if(debug)
    		std::cout<<"setRealFunArg insert shadow stack::"<<toAddrInt<<"\n";
		}
		else{//just update the value in stack
      mpfr_init2(toReal, PRECISION);
      mpfrInit++;
      mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDN);
			MyShadow *newShadow = new MyShadow;
			newShadow->key = toAddrInt;
			newShadow->real = toReal;  
  		push(newShadow);

  		if(debug)
    		std::cout<<"setRealFunArg insert shadow stack::"<<toAddrInt<<"\n";
		}
	}
}
*/
extern "C" void* getRealReturn(size_t insIndex){
	if(debug){
	std::cout<<"getRealReturn: return is saved at index:"<<returnIdx<<"\n";
	std::cout<<"getRealReturn: addr of return:"<<(size_t)&shadowStack[returnIdx]<<"\n";
	}
	return &shadowStack[returnIdx];
	
}

extern "C" void setRealReturn(size_t toAddrInt){
/*
  if(!retTrack.empty()){
    size_t idx = retTrack.top();
    retTrack.pop();
		MyShadow *shadow = existInStackOld(toAddrInt);
		if(shadow != NULL){//just update the value in stack
      mpfr_init2(toReal, PRECISION);
      mpfrInit++;
      mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDN);
			//cleanup(idx);
  		if(debug)
    		std::cout<<"setRealReturn update shadow stack::"<<toAddrInt<<"\n";
		}
	}
  else
    std::cout<<"Error !!!! return value not found in stack\n";
*/
}

extern "C" void setRealTemp(size_t toAddrInt, void* fromAddrInt){
	size_t offset = (toAddrInt) & 0xffffff;
	mpfr_t *real = (mpfr_t *)fromAddrInt;
	mpfr_init2(shadowMap[offset], PRECISION);
	mpfrInitMap++;
	mpfr_set(shadowMap[offset], *real, MPFR_RNDN);
	if(debug)
	std::cout<<"setRealTemp: value stored from:"<<(size_t)fromAddrInt<<" to:"<<toAddrInt<<"\n";
}

extern "C" void handleLLVMMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
	size_t tmp = 0;
	while(size != tmp){ //handling only double
		//setRealTemp(toAddrInt+tmp, fromAddrInt+tmp);
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


float getFloat(Real *real){  
  return mpfr_get_flt(real->mpfr_val, MPFR_RNDN);
}

double getDouble(mpfr_t mpfr_val){  
  return mpfr_get_d(mpfr_val, MPFR_RNDN);
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
//  mpfr_out_str (stdout, 10, 0, real->mpfr_val, MPFR_RNDN);
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


double updateError(mpfr_t realVal, double computedVal, size_t insIndex){
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
   if (0){
    std::cout<<"\nThe shadow value is ";
    printReal(realVal);
  	//mpfr_out_str (stdout, 10, 0, realVal, MPFR_RNDN);
    if (computedVal != computedVal){
      std::cout<<", but NaN was computed.\n";
    } else {
      std::cout<<", but ";
      ppFloat(computedVal);
      std::cout<<" was computed.\n";
    std::cout<<"updateError: computedVal:"<<computedVal<<" insIndex:"<<insIndex<<"\n";
    }
    printf("%f bits error (%llu ulps)\n",
                bitsError, ulpsError);
  std::cout<<"\n\n"; 
  }
//    printf("%f bits error (%llu ulps)\n",
 //               bitsError, ulpsError);
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
    size_t length = MAX_STACK_SIZE * sizeof(mpfr_t);
    size_t len = MAX_SIZE * sizeof(size_t);
    shadowStack = (mpfr_t *) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    shadowMap = (mpfr_t *) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    insMap = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    frameCur = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    assert (insMap != (void*)-1);
    assert (varTrack != (void*)-1);
		for(int i = 0; i <= 100; i++)
			mpfr_init2(shadowStack[i], PRECISION);
		frameCur[0] = 0;
		slotIdx = 0;
//#ifdef MULTITHREADED
  // Create the threads
	//	pthread_create(&con, NULL, consumer, NULL);
//    std::cout<<"thread created\n";
//#endif
}
extern "C" void finish(){
  int n;
  char name [100];
  bool flag = false;
  //  mpfr_clear(it->second->mpfr_val);
   // delete(it->second);
  //  shadowMap.erase(it);
  //  mpfrClear++;

	int i = slotIdx - 1;
	while(i >= 0){
	if(debug)
		std::cout<<"finish freeing i:"<<i<<"\n";
//    mpfrClear++;
//  	mpfr_clear(shadowStack[i]);
		i--;
	}

  std::cout<<"mpfrInit:"<<mpfrInit<<"\n";
  std::cout<<"mpfrClear:"<<mpfrClear<<"\n";
  std::cout<<"mpfrInitMap:"<<mpfrInitMap<<"\n";
  std::cout<<"mpfrClearMap:"<<mpfrClearMap<<"\n";
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

