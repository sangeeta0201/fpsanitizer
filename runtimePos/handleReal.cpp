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
#define debug 1

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
extern "C" void addFunArg(size_t argNo, size_t argAddrInt, double op){
	argCount++;
	size_t stackTop = frameCur[frameIdx]+slotIdx;
	if(argAddrInt != 0){
		shadowStack[stackTop] = *(posit32_t *)argAddrInt;
	}
	else{
		shadowStack[stackTop] = convertDoubleToP32(op);
	}
	if(debug){
		std::cout<<"addFunArg: arg copied from: "<<argAddrInt<<" to stackTop:"<<stackTop<<"\n";
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
    shadowStack[returnIdx] = *(posit32_t *)returnIndex;
  } 
  frameIdx--;
}
        

extern "C" void handleAlloca(size_t varAddrInt){
}

extern "C" void* handleMathFunc(size_t funcCode, double op1, size_t op1Int, 
                                              double computedRes, size_t insIndex){ 
	mpfr_t r1_m, real_mpfr;
	posit32_t real_res, r1;
	double res_d;
  posit32_t *real1 = (posit32_t *)op1Int;
  if(op1Int == 0){
		r1 = convertDoubleToP32(op1);
		real1 = &r1;
  }
	if(debug){
		std::cout<<"handleMathFunc: op1Addr:"<<op1Int<<" op1:"<<op1<<"\n";
		printf("handleMathFunc op1:%.15f\n",getDouble(*real1));
 	}
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        std::cout<<"handleMathFunc: sqrt:\n";
        real_res = p32_sqrt(*real1);
        break;
      case 2: //floor
        std::cout<<"handleMathFunc: floor:\n";
 //       mpfr_floor(real_mpfr, *real1);
        break;
      case 3: //tan
        std::cout<<"handleMathFunc: tan:\n";
 //       mpfr_tan(real_res, *real1, MPFR_RNDD);
        break;
      case 4: //sin
			{
        std::cout<<"handleMathFunc: sin:\n";
				double r1_d = convertP32ToDouble(*real1);
				mpfr_init2(r1_m, 1000);
				mpfr_init2(real_mpfr, 1000);
				mpfr_set_d(r1_m, r1_d, MPFR_RNDN);
        mpfr_sin(real_mpfr, r1_m, MPFR_RNDN);
				mpfr_out_str (stdout, 10, 15, real_mpfr, MPFR_RNDN);
				std::cout<<"\n";
				res_d  = mpfr_get_d(real_mpfr, MPFR_RNDN);; 
				real_res = convertDoubleToP32(res_d);
        break;
			}
      default:
    		std::cout<<"handleMathFunc: Error!!!\n";
    }
  }
  else{
    std::cout<<"handleMathFunc: Error!!!\n";
    std::cout<<"handleMathFunc res:";
    //printReal(real_res);
    std::cout<<"\n";
    std::cout<<"handleMathFunc op1:";
//    printReal(real1);
    std::cout<<"\n";
  }
	
  size_t newRegIdx = getRegRes(insIndex);
	shadowStack[newRegIdx] = real_res;  

  if(debug)
    std::cout<<"handleMathFunc insert shadow mem::"<<newRegIdx<<"\n";
	updateError(real_res, computedRes, insIndex);
  return &shadowStack[newRegIdx];
}
/*
extern "C" size_t handleMathFunc3Args(size_t funcCode, double op1, size_t op1Int,
                                                double op2, size_t op2Int,
                                                double op3, size_t op3Int,
                                                double computedRes, size_t insIndex){ 
  posit32_t *real1, *real2, *real3;
  posit32_t real_res;
  
  real1 = (posit32_t *)op1Int;
  if(real1 == NULL){
    *real1 = convertDoubleToP32(op1);
  }
	real2 = (posit32_t *)op2Int;
  if(real2 == NULL){
    *real2 = convertDoubleToP32(op2);
  }
	real3 = (posit32_t *)op3Int;
  if(real3 == NULL){
    *real3 = convertDoubleToP32(op3);
  }
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    addRegRes(insIndex, newRegIdx);
  }
  
  if(real1 != NULL && real2 != NULL && real3 != NULL){
    switch(funcCode){
      case 7: //fma
        real_res = fma(real_res, *real1, *real2, *real3, MPFR_RNDD);
        break;
      default:
        std::cout<<"Error!!!!\n";
        break;
    }
  }
  else
    std::cout<<"handleMathFunc3Args: Error!!!\n";
	mpfr_init2(shadowStack[newRegIdx], PRECISION);
	mpfr_set(shadowStack[newRegIdx], real_res, MPFR_RNDN);  
  if(debug)
    std::cout<<"handleMathFunc3Args insert shadow mem::"<<newRegIdx<<"\n";
  
  updateError(real_res, computedRes, insIndex);
  return newRegIdx;
}
*/
void handleOp(size_t opCode, posit32_t *res, posit32_t *op1, posit32_t *op2){
  switch(opCode) {                                                                                            
    case 12: //FADD
      if(debug)
        std::cout<<"\nFADD\n";
			*res = p32_add (*op1, *op2);
      break;
    case 14: //FSUB
      if(debug)
        std::cout<<"FSUB\n";
			*res = p32_sub (*op1, *op2);
      break;
    case 16: //FMUL
      if(debug)
        std::cout<<"FMUL\n";
			*res = p32_mul (*op1, *op2);
      break;
    case 19: //FDIV
      if(debug)
        std::cout<<"FDIV\n";
			*res = p32_div (*op1, *op2);
      break;
    default:
      // do nothing
      break;
  } 
  if(0){
  }
}

extern "C" size_t setRealConstant(size_t AddrInt, double value){
	size_t offset = (AddrInt) & 0xffffff;
	if(0)
	std::cout<<"setRealConstant: Added constant in shadowMem at:"<<AddrInt<<"\n"; 
	shadowMap[offset]= convertDoubleToP32(value);
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
    offset = (AddrInt) & 0xffffff;
    Addr = Addr + 8;
		shadowMap[offset] = convertDoubleToP32(op); 
  }
}

extern "C" void* fpSanLoadFromShadowMem(void *Addr, size_t insIndex){
  size_t newRegIdx = getRegRes(insIndex);
	size_t AddrInt = (size_t) Addr;
	size_t offset = (AddrInt) & 0xffffff;
	shadowStack[newRegIdx] = shadowMap[offset];
	size_t addr = (size_t) &shadowStack[newRegIdx];
	if(debug)
	std::cout<<"fpSanLoadFromShadowMem: set value in shadowStack at:"<<newRegIdx<<" for addr:"<<addr<<" from AddrInt:"<<AddrInt<<"\n";
	return &shadowStack[newRegIdx];
}

extern "C" void* computeReal(size_t opCode, size_t op1Addr, size_t op2Addr, double op1, double op2, 
                                    double computedRes, size_t insIndex){
  size_t regIndex1;
  size_t regIndex2;
  posit32_t *real1;
  posit32_t *real2;
  posit32_t r1;
  posit32_t r2;
  posit32_t op1_mpfr;
  posit32_t op2_mpfr;
  posit32_t real_res;
	if(op1Addr == 0){ //it is a constant
    if(debug)
      std::cout<<"computeReal: real1 is null, using op1 value:"<<op1<<"\n";
    r1 = convertDoubleToP32(op1); 
		real1 = &r1;
	}
	else{
		real1 = (posit32_t *)op1Addr;
      //data might be set without store
  }
	if(op2Addr == 0){
    if(debug)
      std::cout<<"computeReal: real2 is null, using op2 value:"<<op2<<"\n";
    r2 = convertDoubleToP32(op2); 
		real2 = &r2;
	}
	else{
		real2 = (posit32_t *)op2Addr;
	}
	if(debug){
		std::cout<<"computeReal op1:"<<op1<<"\n";
		std::cout<<"computeReal op2:"<<op2<<"\n";
	}
	if(debug){
    std::cout<<"computeReal: op1Addr:"<<op1Addr<<" op1:"<<getDouble(*real1)<<"\n"; 
    std::cout<<"computeReal: op2Addr:"<<op2Addr<<" op2:"<<getDouble(*real2)<<"\n";
  }
  size_t newRegIdx = getRegRes(insIndex);

  handleOp(opCode, &(real_res), real1, real2);
  if(debug){
  	std::cout<<"res:";
  	std::cout<<"\n";
  }
	shadowStack[newRegIdx] = real_res;  
	if(debug)
	std::cout<<"computeReal: stackTop:"<<newRegIdx<<" addr:"<<(size_t)&shadowStack[newRegIdx]<<"\n";
  updateError(real_res, computedRes, insIndex);
  return &shadowStack[newRegIdx];
}

int isNaN(mpfr_t real){
  return mpfr_nan_p(real);
}
extern "C" void checkBranch(double op1, size_t op1Addr, double op2, size_t op2Addr, 
                            int fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
  size_t regIndex1;
  size_t regIndex2;

	posit32_t *real1;
	posit32_t *real2;
	posit32_t r1, r2;

  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
	if(debug){
		std::cout<<"op1:"<<op1<<" op2:"<<op2<<"\n";
	}
	if(op1Addr == 0){ //it is a constant
    if(debug)
      std::cout<<"checkBranch: real1 is null, using op1 value:"<<op1<<"\n";
    r1 = convertDoubleToP32(op1); 
    real1 = &r1;
  }
  else{
    real1 = (posit32_t *)op1Addr;
      //data might be set without store
  }
	if(op2Addr == 0){
    if(debug)
      std::cout<<"checkBranch: real2 is null, using op2 value:"<<op2<<"\n";
    r2 = convertDoubleToP32(op2); 
		real2 = &r2;
	}
	else{
		real2 = (posit32_t *)op2Addr;
	}
  bool realRes = false;
	if(debug){
		std::cout<<"checkBranch: pos r1:"<<getDouble(*real1);
		std::cout<<"checkBranch: pos r2:"<<getDouble(*real2);
	}
  switch(fcmpFlag){
    case 1: 
						realRes = false;
            break;
    case 2: 
   //         if(!isNaN(real1) && !isNaN(real2)){
              //if(*real1 == *real2)
              if(p32_eq(*real1, *real2))
                realRes = true;
     //       }
            break;
    case 3: 
       //     if(!isNaN(real1) && !isNaN(real2)){
              //if(*real1 > *real2)
              if(!p32_le(*real1, *real2))
                realRes = true;
         //   }
            break;
    case 4: 
         //   if(!isNaN(real1) && !isNaN(real2)){
              //if(*real1 >= *real2)
              if(!p32_lt(*real1, *real2))
                realRes = true;
         //   }
            break;
    case 5: 
         //   if(!isNaN(real1) && !isNaN(real2)){
              //if(*real1 < *real2)
              if(p32_lt(*real1, *real2))
                realRes = true;
         //   }
            break;
    case 6:              
			//			if(!isNaN(real1) && !isNaN(real2)){
              //if(*real1 <= *real2)
              if(p32_le(*real1, *real2))
                realRes = true;
       //     }
            break;
    case 7: 
        //    if(!isNaN(real1) && !isNaN(real2)){
              //if(*real1 != *real2)
              if(!p32_eq(*real1, *real2))
                realRes = true;
        //    }
            break;
    case 8: 
       //     if(!isNaN(real1) && !isNaN(real2)){
              realRes = true;
       //     }
            break;
    case 9: 
            //if(*real1 == *real2)
            if(p32_eq(*real1, *real2))
              realRes = true;
            break;
    case 10: 
            //if(*real1 > *real2)
            if(!p32_le(*real1, *real2))
              realRes = true;
            break;
    case 11: 
            //if(*real1 >= *real2)
            if(!p32_lt(*real1, *real2))
              realRes = true;
            break;
		case 12: 
            //if(*real1 < *real2)
            if(p32_lt(*real1, *real2))
              realRes = true;
            break;
    case 14: 
            //if(*real1 <= *real2)
            if(p32_le(*real1, *real2))
              realRes = true;
            break;
    case 15: 
            //if(*real1 != *real2)
            if(!p32_eq(*real1, *real2))
              realRes = true;
            break;
    case 16: 
       //     if(isNaN(real1) || isNaN(real2))
              realRes = true;
            break;
  }

  if(mpfrFlag1){
  }
  if(mpfrFlag2){
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
	std::cout<<"getRealFunArg: stack index:"<<frameCur[frameIdx] - index - 1<<"\n";
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
      mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDD);
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
  if(debug)
	std::cout<<"getRealReturn: addr of return:"<<(size_t)&shadowStack[returnIdx]<<"\n";
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
      mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDD);
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
	posit32_t *real = (posit32_t *)fromAddrInt;
	shadowMap[offset] = *real;
	if(debug)
	std::cout<<"setRealTemp: value stored from:"<<(size_t)fromAddrInt<<" to:"<<offset<<"\n";
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


double getDouble(posit32_t val){  
  return convertP32ToDouble(val);
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

double updateError(posit32_t realVal, double computedVal, size_t insIndex){
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
    std::cout<<"\nThe shadow value is ";
		printf(" %.15f", convertP32ToDouble(realVal));
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
	if(0)
    printf("%f bits error (%llu ulps)\n",
                bitsError, ulpsError);
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
    size_t length = MAX_STACK_SIZE * sizeof(posit32_t);
    size_t len = MAX_SIZE * sizeof(size_t);
    shadowStack = (posit32_t *) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    shadowMap = (posit32_t *) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    insMap = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
		frameCur = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    assert (insMap != (void*)-1);
    assert (varTrack != (void*)-1);
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

