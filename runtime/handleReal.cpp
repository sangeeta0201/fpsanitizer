#include "handleReal.h"
#include <string.h>
#include <fstream>
#include <queue>
#include <iostream>
#include <stdlib.h>
#include <execinfo.h>

/*TODO : 
1. Handle const in llvm - gsl-modpi.c
2. Clean up shadow
3. How to figure out memcpy of only double?
*/
#define debug 1
#define debugCR 1
#define MPFRINIT 100000000 //for spec
//#define MPFRINIT 100
FILE *pFile = fopen ("error.log","w");
FILE *eFile = fopen ("branch.log","w");
/*
void print_trace (void)
{
	void *trace[16];
  char **messages = (char **)NULL;
  int i, trace_size = 0;

  trace_size = backtrace(trace, 16);
  messages = backtrace_symbols(trace, trace_size);
  printf("[bt] Execution path:\n");
  for (i=0; i<trace_size; ++i)
  {
    printf("[bt] #%d %s\n", i, messages[i]);

    char syscom[256];
    sprintf(syscom,"addr2line %p -e sum-50.o", trace[i]); //last parameter is the name of this app
    system(syscom);
  }
  free (messages);
}
*/

void print_trace (void)
{
  void *array[10];
  size_t size;
  char **strings;
  size_t i;

  size = backtrace (array, 10);
  strings = backtrace_symbols (array, size);

  for (i = 0; i < size; i++)
		std::cout<<strings[i]<<"\n"; 
		//fprintf (eFile, "%s\n", strings[i]); 

  free (strings);
}
/*
size_t getRegRes(size_t insIndex){
	assert(newRegIdx + frameCur[frameIdx] < MPFRINIT);
	assert(frameIdx < MAX_SIZE);
  if(insMap[insIndex] != 0){ 
    newRegIdx = insMap[insIndex] + slotIdx[frameIdx];
		std::cout<<"insMap[insIndex]:"<<insMap[insIndex]<<"\n";
//  	slotIdx[frameIdx] = newRegIdx;
  	slotIdx[frameIdx] = newRegIdx + 1;
	}
	else{
		newRegIdx = slotIdx[frameIdx];
		std::cout<<"slotIdx[frameIdx]:"<<slotIdx[frameIdx]<<"\n";
  	insMap[insIndex] = slotIdx[frameIdx];
  	slotIdx[frameIdx] += 1;
	}
	if(debug){
		std::cout<<"getRegRes newRegIdx:"<<newRegIdx<<" frameCur[frameIdx]:"<<frameCur[frameIdx]<<"\n";
	}
	return newRegIdx + frameCur[frameIdx];
}
*/
size_t getRegRes(size_t insIndex){
	assert(newRegIdx + frameCur[frameIdx] < MPFRINIT);
	assert(frameIdx < MAX_SIZE);
  if(insMap[insIndex] != 0){ 
    newRegIdx = insMap[insIndex];
		std::cout<<"insMap:"<<insMap[insIndex]<<" slotIdx[frameIdx]:"<<slotIdx[frameIdx]<<" \n";
		if(newRegIdx > slotIdx[frameIdx])
			slotIdx[frameIdx] = newRegIdx + 1;
	}
	else{
		newRegIdx = slotIdx[frameIdx];
		std::cout<<"slotIdx[frameIdx]:"<<slotIdx[frameIdx]<<"\n";
  	insMap[insIndex] = slotIdx[frameIdx];
		std::cout<<"insMap:"<<insMap[insIndex]<<" slotIdx[frameIdx]:"<<slotIdx[frameIdx]<<" \n";
  	slotIdx[frameIdx] += 1;
	}
	if(debug){
		std::cout<<"getRegRes newRegIdx:"<<newRegIdx<<" frameCur[frameIdx]:"<<frameCur[frameIdx]<<" \n";
	}
	return newRegIdx + frameCur[frameIdx] ;
}

extern "C" size_t getAddr(void *Addr){
  size_t AddrInt = (size_t) Addr;
 // return AddrInt;
}

extern "C" void* addReturnAddr(){
	std::cout<<"frameCur[frameIdx]:"<<frameCur[frameIdx]<<" slotIdx[frameIdx]:"<<slotIdx[frameIdx]<<"\n";
	returnIdx[frameIdx] = frameCur[frameIdx] + slotIdx[frameIdx];
	size_t retAddr = returnIdx[frameIdx];
	slotIdx[frameIdx]++;
	if(debug)
		std::cout<<"addReturnAddr: Idx:"<<retAddr<<" return addr: "<<(size_t)&shadowStack[retAddr]<<"\n";
	std::cout<<"addReturnAddr: Idx:"<<retAddr<<"\n";
	return &shadowStack[retAddr];
}

extern "C" void addFunArg(size_t argNo, size_t argAddrInt, double op){
	argCount[frameIdx+1] = argCount[frameIdx+1] + 1;
	
	size_t stackTop = frameCur[frameIdx]+slotIdx[frameIdx];
	std::cout<<"addFunArg: add arg to idx:"<<stackTop<<"\n";
	if(argAddrInt != 0){
		Real *real1 = (Real *)argAddrInt;
		mpfr_set(shadowStack[stackTop].mpfr_val, real1->mpfr_val, MPFR_RNDN);
	}
	else{
		mpfr_set_d(shadowStack[stackTop].mpfr_val, op, MPFR_RNDN);
	}
	shadowStack[stackTop].initFlag = 1;
	if(debug){
		std::cout<<"addFunArg: arg copied from: "<<argAddrInt<<" stackTop:"<<stackTop<<"\n";
		std::cout<<"addFunArg: addr:"<<(size_t)&shadowStack[stackTop]<<" set to:";
		printReal((&shadowStack[stackTop])->mpfr_val);
	}
	slotIdx[frameIdx]++;
}

extern "C" void funcInit(void *fName){
	if(!initFlag){
		init();
		initFlag = true;
	}
	frameIdx++;
	memset(insMap, 0, 2048 * sizeof(size_t));
	frameCur[frameIdx] = frameCur[frameIdx-1]+slotIdx[frameIdx-1] /*return index*/ ;
	slotIdx[frameIdx] = 0;
//	if(debug)
		std::cout<<"funcInit:"<<frameCur[frameIdx]<<"\n";
}

extern "C" void funcExit(size_t returnIndex){

  size_t var;
  size_t retAddr = returnIdx[frameIdx - 1];
	if(returnIndex != 0){
		if(debug)
			std::cout<<"funcExit: return copied from:"<<returnIndex<<" to stackTop:"<<retAddr <<" addr:"<<(size_t)&shadowStack[retAddr]<<"\n";
		Real *returnReal = (Real *)returnIndex;
		mpfr_set(shadowStack[retAddr].mpfr_val, returnReal->mpfr_val, MPFR_RNDN);
		shadowStack[retAddr].initFlag = 1;
	}	
	std::cout<<"funcExit:"<<retAddr<<"\n";
	frameIdx--;
	slotIdx[frameIdx] = slotIdx[frameIdx] - argCount[frameIdx+1];
	argCount[frameIdx + 1] = 0;
}

extern "C" void handleAlloca(size_t varAddrInt){
}

extern "C" void* handleMathFunc(size_t funcCode, double op1, size_t op1Int, 
                                                double computedRes, size_t insIndex){ 
  Real real_res, r1;
  
  mpfrInit++;
  bool mpfrFlag1 = false; 
  Real *real1 = (Real *)op1Int;
  if(op1Int == 0 || real1->initFlag == 0){
		mpfr_init2(r1.mpfr_val, PRECISION);
		mpfrInit++;
		mpfr_set_d(r1.mpfr_val, op1, MPFR_RNDN);
		real1 = &r1;
		mpfrFlag1 = true; 
  }
	if(debug)
		std::cout<<"handleMathFunc: op1Addr:"<<op1Int<<" funcCode:"<<funcCode<<" computed op:"<<op1<<"\n";
 
  size_t newRegIdx = getRegRes(insIndex);
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        //std::cout<<"handleMathFunc: sqrt:\n";
        mpfr_sqrt(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 2: //floor
        //std::cout<<"handleMathFunc: floor:\n";
        mpfr_floor(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val);
        break;
      case 3: //tan
        //std::cout<<"handleMathFunc: tan:\n";
        mpfr_tan(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 4: //sin
        //std::cout<<"handleMathFunc: sin:\n";
        mpfr_sin(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 5: //cos
        //std::cout<<"handleMathFunc: cos:\n";
        mpfr_cos(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 6: //atan
        //std::cout<<"handleMathFunc: atan:\n";
        mpfr_atan(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 8: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_abs(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 9: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_log(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 10: //asin
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_asin(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
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
	shadowStack[newRegIdx].initFlag = 1;
	
  if(debug)
		std::cout<<"handleMathFunc: stackTop:"<<newRegIdx<<" addr:"<<(size_t)&shadowStack[newRegIdx]<<"\n";
	std::cout<<"handleMathFunc: idx:"<<newRegIdx<<"\n";
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
  }
	updateError(shadowStack[newRegIdx].mpfr_val, computedRes, insIndex);
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
	mpfr_set(shadowStack[newRegIdx].mpfr_val, real_res, MPFR_RNDN);  
	shadowStack[newRegIdx].initFlag = 1;
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
  updateError(shadowStack[newRegIdx].mpfr_val, computedRes, insIndex);
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

extern "C" void setRealConstant(size_t AddrInt, double value){
	size_t offset = (AddrInt) & 0xffffff;
	mpfr_init2(shadowMap[offset].mpfr_val, PRECISION);
	mpfrInitMap++;
	mpfr_set_d(shadowMap[offset].mpfr_val, value, MPFR_RNDN);
	shadowMap[offset].initFlag = 1;
	std::cout<<"setRealConstant: set:"<<value;
	std::cout<<" to addr offset:"<<offset<<"\n";
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
		mpfr_init2(shadowMap[offset].mpfr_val, PRECISION);
		mpfrInit++;
		mpfr_set_d(shadowMap[offset].mpfr_val, op, MPFR_RNDN);
		std::cout<<"handleMalloc: set:"<<op;
		std::cout<<" to addr offset:"<<offset<<"\n";
	}
}

extern "C" void* handleSelect(void *Addr, size_t insIndex, double op){
  size_t newRegIdx = getRegRes(insIndex);
	size_t AddrInt = (size_t) Addr;
	Real *real1;
	real1 = (Real *)Addr;
	if(AddrInt == 0 || real1->initFlag == 0){
		mpfr_set_d(shadowStack[newRegIdx].mpfr_val, op, MPFR_RNDN);
	}
	else
		mpfr_set(shadowStack[newRegIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
	if(debug)
		std::cout<<"handleSelect: set value in shadowStack at:"<<newRegIdx<<" for addr:"<<AddrInt<<"\n";
	
	return &shadowStack[newRegIdx];
}

extern "C" void* fpSanLoadFromShadowMem(void *Addr, size_t insIndex, double op){
  size_t newRegIdx = getRegRes(insIndex);
	size_t AddrInt = (size_t) Addr;
	size_t offset = (AddrInt) & 0xffffff;
	if(shadowMap[offset].initFlag == 0){
		mpfr_set_d(shadowStack[newRegIdx].mpfr_val, op, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[newRegIdx];
			std::cout<<"fpSanLoadFromShadowMem: set value:";
			printReal( shadowStack[newRegIdx].mpfr_val);
			std::cout<<" in shadowStack at:"<<newRegIdx<<" for addr:"<<addr<<" from op:"<<op<<"\n";
		}
	}
	else{
		mpfr_set(shadowStack[newRegIdx].mpfr_val, shadowMap[offset].mpfr_val, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[newRegIdx];
			std::cout<<"fpSanLoadFromShadowMem: set value:";
			printReal( shadowStack[newRegIdx].mpfr_val);
			std::cout<<" in shadowStack at:"<<newRegIdx<<" for addr:"<<addr<<" from offset:"<<offset<<"\n";
		}
	}
	std::cout<<"fpSanLoadFromShadowMem:"<<newRegIdx<<"\n";
	shadowStack[newRegIdx].initFlag = 1;
	return &shadowStack[newRegIdx];
}

extern "C" void* computeReal(size_t opCode, size_t op1Addr, size_t op2Addr, double op1, double op2, 
                                    double computedRes, size_t insIndex){
  std::cout<<"computeReal: insIndex:"<<insIndex<<"\n";
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
  Real *real1;
  Real *real2;
  Real r1;
  Real r2;
	if(op1Addr == 0){ //it is a constant
    if(debugCR)
      std::cout<<"computeReal: real1 is null, using op1 value:"<<op1<<"\n";
    mpfr_init2(r1.mpfr_val, PRECISION);
    mpfrInit++;
		real1 = &r1;
    mpfr_set_d(r1.mpfr_val, op1, MPFR_RNDN);
    mpfrFlag1 = true; 
	}
	else{
		real1 = (Real *)op1Addr;
		if(real1->initFlag == 0){
    	if(debugCR)
				std::cout<<"real1 is null\n";
    	mpfr_init2(r1.mpfr_val, PRECISION);
    	mpfrInit++;
			real1 = &r1;
    	mpfr_set_d(r1.mpfr_val, op1, MPFR_RNDN);
    	mpfrFlag1 = true; 
		}
      //data might be set without store
  }
	if(op2Addr == 0){
    if(debugCR)
      std::cout<<"computeReal: real2 is null, using op2 value:"<<op2<<"\n";
    mpfr_init2(r2.mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(r2.mpfr_val, op2, MPFR_RNDN);
		real2 = &r2;
    mpfrFlag2 = true; 
	}
	else{
		real2 = (Real *)op2Addr;
			if(real2->initFlag == 0){
    		if(debugCR)
					std::cout<<"real2 is null\n";
    		mpfr_init2(r2.mpfr_val, PRECISION);
    		mpfrInit++;
				real2 = &r2;
    		mpfr_set_d(r2.mpfr_val, op2, MPFR_RNDN);
    		mpfrFlag2 = true; 
			}
	}
  size_t newRegIdx = getRegRes(insIndex);

	if(debugCR){
		std::cout<<"computeReal: op1:"<<op1<<" op2:"<<op2<<"\n";
		std::cout<<"computeReal: op1Addr:"<<op1Addr<<" op1:";
  	printReal(real1->mpfr_val);
		std::cout<<"computeReal: op2Addr:"<<op2Addr<<" op2:";
  	printReal(real2->mpfr_val);
	}
	
  handleOp(opCode, &(shadowStack[newRegIdx].mpfr_val), &real1->mpfr_val, &real2->mpfr_val);
	shadowStack[newRegIdx].initFlag = 1;
  if(debugCR){
  	std::cout<<"res:";
  	std::cout<<"\n";
  }
  if(mpfrFlag1){
    mpfr_clear(r1.mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(r2.mpfr_val);
    mpfrClear++;
  }
	if(debugCR)
		std::cout<<"computeReal: stackTop:"<<newRegIdx<<" addr:"<<(size_t)&shadowStack[newRegIdx]<<"\n";
	std::cout<<"computeReal:"<<newRegIdx<<"\n";
  //printReal(shadowStack[newRegIdx]);
  updateError(shadowStack[newRegIdx].mpfr_val, computedRes, insIndex);
  return &shadowStack[newRegIdx];
}

int isNaN(mpfr_t real){
  return mpfr_nan_p(real);
}


int handleCmp(mpfr_t *op1, mpfr_t *op2){
	return mpfr_cmp(*op1, *op2); 
}

extern "C" bool checkBranch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            size_t fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
  Real *real1;
  Real *real2;
  Real r1;
  Real r2;

	bool mpfrFlag1 = false;
	bool mpfrFlag2 = false;
	if(op1Int == 0){ //it is a constant
    if(debug)
      std::cout<<"checkBranch: real1 is null, using op1 value:"<<op1<<"\n";
    mpfr_init2(r1.mpfr_val, PRECISION);
    mpfrInit++;
    real1 = &r1;
    mpfr_set_d(r1.mpfr_val, op1, MPFR_RNDN);
    mpfrFlag1 = true; 
  }
  else{
    real1 = (Real *)op1Int;
    if(real1->initFlag == 0){
    	if(debug)
      	std::cout<<"real1 is null\n";
      mpfr_init2(r1.mpfr_val, PRECISION);
      mpfrInit++;
      real1 = &r1;
      mpfr_set_d(r1.mpfr_val, op1, MPFR_RNDN);
      mpfrFlag1 = true; 
    }
      //data might be set without store
  }
	if(op2Int == 0){ //it is a constant
    if(debug)
      std::cout<<"checkBranch: real2 is null, using op2 value:"<<op2<<"\n";
    mpfr_init2(r2.mpfr_val, PRECISION);
    mpfrInit++;
    real2 = &r2;
    mpfr_set_d(r2.mpfr_val, op2, MPFR_RNDN);
    mpfrFlag2 = true; 
  } 
  else{
    real2 = (Real *)op2Int;
    if(real2->initFlag == 0){
    	if(debug)
      	std::cout<<"real2 is null\n";
      mpfr_init2(r2.mpfr_val, PRECISION);
      mpfrInit++;
      real2 = &r2;
      mpfr_set_d(r2.mpfr_val, op2, MPFR_RNDN);
      mpfrFlag2 = true; 
    }
  }

	bool realRes = false;
	int ret = handleCmp(&real1->mpfr_val, &real2->mpfr_val);
	switch(fcmpFlag){
		case 0: 
			realRes = false;
			break;
		case 1:  //oeq
			if(!isNaN(real1->mpfr_val) && !isNaN(real2->mpfr_val)){
				if(ret == 0)
					realRes = true;
			}
			break;
		case 2:  //ogt
			if(!isNaN(real1->mpfr_val) && !isNaN(real2->mpfr_val)){
				if(ret > 0){
					realRes = true;
				}
			}
			break;
		case 3: 
			if(!isNaN(real1->mpfr_val) && !isNaN(real2->mpfr_val)){
				if(ret > 0 || ret == 0){
					realRes = true;
				}
			}
			break;
		case 4: //olt
			if(!isNaN(real1->mpfr_val) && !isNaN(real2->mpfr_val)){
				if(ret < 0){
					realRes = true;
				}
			}
			break;
		case 5: 
			if(!isNaN(real1->mpfr_val) && !isNaN(real2->mpfr_val)){
				if(ret < 0 || ret == 0){
					realRes = true;
				}
			}
			break;
		case 6: 
			if(!isNaN(real1->mpfr_val) && !isNaN(real2->mpfr_val)){
				if(ret != 0){
					realRes = true;
				}
			}
			break;
		case 7: 
			if(!isNaN(real1->mpfr_val) && !isNaN(real2->mpfr_val)){
				realRes = true;
			}
			break;
		case 8: 
			if(isNaN(real1->mpfr_val) && isNaN(real2->mpfr_val)){
				realRes = true;
			}
			break;
		case 9: 
			if(isNaN(real1->mpfr_val) || isNaN(real2->mpfr_val) || ret == 0)
				realRes = true;
			break;
		case 10: //ugt 
			if(isNaN(real1->mpfr_val) || isNaN(real2->mpfr_val) || ret > 0)
				realRes = true;
			break;
		case 11: 
			if(isNaN(real1->mpfr_val) || isNaN(real2->mpfr_val) || ret >= 0)
				realRes = true;
			break;
		case 12: //ult 
			if(isNaN(real1->mpfr_val) || isNaN(real2->mpfr_val) || ret < 0)
				realRes = true;
			break;
		case 13: 
			if(isNaN(real1->mpfr_val) || isNaN(real2->mpfr_val) || ret <= 0)
				realRes = true;
			break;
		case 14: 
			if(isNaN(real1->mpfr_val) || isNaN(real2->mpfr_val) || ret != 0){
				realRes = true;
			}
			break;
		case 15: 
			realRes = true;
			break;
	}
	if(realRes != computedRes){
		std::cout<<" compare branch flipped @"<< lineNo<<"\n\n";
		fprintf (eFile, " compare branch flipped @ %lld", lineNo);
    fprintf (eFile, "\n\n\n");
		print_trace ();
    fprintf (eFile, "\n\n\n");
	}
	if(debug){
	if(realRes != computedRes){
		std::cout<<"checkBranch: realRes:"<<realRes<<" computedRes:"<<computedRes<<"\n";
    std::cout<<"checkBranch: computed operands op1:"<<op1<<" op2:"<<op2<<"\n";
    std::cout<<"checkBranch fcmpFlag:"<<fcmpFlag<<"\n"; 
    std::cout<<"checkBranch real operands op1Idx:"<<op1Int<<" op1:"; 
    printReal(real1->mpfr_val);
  //  mpfr_out_str (stdout, 10, 0, real1->mpfr_val, MPFR_RNDN);
    std::cout<<"\n";
    std::cout<<"checkBranch op2Idx:"<<op2Int<<" op2:";
  //  mpfr_out_str (stdout, 10, 0, real2->mpfr_val, MPFR_RNDN);
    printReal(real2->mpfr_val);
    std::cout<<"\n";

	}
	}
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(real2->mpfr_val);
    mpfrClear++;
  }
	updateBranchError(realRes, computedRes, insIndex, lineNo);
	return realRes;
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
	std::cout<<"getRealFunArg argCount[frameIdx]:"<<argCount[frameIdx]<<"\n";
	if(argCount[frameIdx] == 0)
		return 0;
	if(debug){
		std::cout<<"getRealFunArg: addr:"<<(size_t)&shadowStack[frameCur[frameIdx] - index - 1]<<"\n";
		//Real *real = &shadowStack[frameCur[frameIdx] - index - 1];
		//printReal(real->mpfr_val);
	}
	std::cout<<"getRealFunArg: get from idx:"<<frameCur[frameIdx] - index - 1<<"\n";
	return &shadowStack[frameCur[frameIdx] - index - 1];
}

extern "C" void setRealFunArg(size_t index, size_t funAddrInt, size_t toAddrInt, double op){
	size_t offset = (toAddrInt) & 0xffffff;
	Real *real = &shadowStack[frameCur[frameIdx] - index - 1];
	mpfr_init2(shadowMap[offset].mpfr_val, PRECISION);
	mpfrInitMap++;
	mpfr_set(shadowMap[offset].mpfr_val, real->mpfr_val, MPFR_RNDN);
	shadowMap[offset].initFlag = 1;
	if(debug){
		std::cout<<"setRealFunArg: set:"<<(size_t)&shadowStack[frameCur[frameIdx] - index - 1]<<" ";
		printReal(real->mpfr_val);
		std::cout<<" to addr offset:"<<offset<<"\n";
	}
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
	Real *real = (Real *)fromAddrInt;
	mpfr_init2(shadowMap[offset].mpfr_val, PRECISION);
	mpfrInitMap++;
	mpfr_set(shadowMap[offset].mpfr_val, real->mpfr_val, MPFR_RNDN);
	shadowMap[offset].initFlag = 1;
	if(debug){
		std::cout<<"setRealTemp: set:";
		printReal(real->mpfr_val);
		std::cout<<" from:"<<(size_t)fromAddrInt<<" to addr offset:"<<offset<<"\n";
	}
}

extern "C" void handleLLVMMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
	size_t tmp = 0;
	while(size != tmp){ //handling only double
	std::cout<<"handleLLVMMemcpy size:"<<size<<"\n";
		//setRealTemp(toAddrInt+tmp, fromAddrInt+tmp);
		tmp += 8;
	}
}

extern "C" void* handleExtractValue(size_t idx, size_t op1Addr){
	size_t shadowIdx = 0;
	if(debug)
	std::cout<<"handleExtractValue: idx:"<<idx<<" op1Addr:"<<op1Addr<<"\n";

	Real *real1 = (Real *)(op1Addr + idx * sizeof(double));
	return real1; //TODO: handling just double, generate error for other cases
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

 // shadowValStr = mpfr_get_str(NULL, &shadowValExpt, 10, 0, mpfr_val, MPFR_RNDN);
//  printf("%c.%se%ld", shadowValStr[0], shadowValStr+1, shadowValExpt-1);
//	std::cout<<shadowValStr[0]<<"."<<shadowValStr+1<<"e"<<shadowValExpt-1;
//  mpfr_free_str(shadowValStr);
  //mpfr_out_str (stdout, 10, 0, mpfr_val, MPFR_RNDN);
  mpfr_out_str (stdout, 10, 15, mpfr_val, MPFR_RNDN);
	std::cout<<"\n";
} 

void ppFloat(double val){                                                                                                         
  int i = 0;
  if (val != val){
    std::cout<<"+nan.0";
  } else if (val == INFINITY){
    std::cout<<"+inf.0";
  } else if (val == -INFINITY){
    std::cout<<"-inf.0";
  } else if (val > 0 && val < 1){
    while (val < 1) {
      val *= 10;
      i++;
    }
//    printf("%fe-%d", val, i);
		std::cout<<val<<"e-"<<i;
  } else if (val < 0 && val > -1){
    while (val > -1) {
      val *= 10;
      i++;
    }
    //printf("%fe-%d", val, i);
		std::cout<<val<<"e-"<<i;
  } else if (val >= 9.9999999){
    while (val >= 9.9999999){
      val /= 10;
      i++;
    }
    //printf("%fe%d", val, i);
		std::cout<<val<<"e"<<i;
  } else if (val <= -9.9999999){
    while (val <= -9.9999999){
      val /= 10;
      i++;
    }
    //printf("%fe%d", val, i);
		std::cout<<val<<"e"<<i;
  } else {
    //printf("%f", val);
		std::cout<<val;
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
    std::cout<<"\nThe shadow value is ";
    printReal(realVal);
//  	mpfr_out_str (stdout, 10, 0, realVal, MPFR_RNDN);
    if (computedVal != computedVal){
      std::cout<<", but NaN was computed.\n";
    } else {
      std::cout<<", but ";
      ppFloat(computedVal);
      std::cout<<" was computed.\n";
    std::cout<<"updateError: computedVal:"<<computedVal<<" insIndex:"<<insIndex<<"\n";
    }
//    printf("%f bits error (%llu ulps)\n",
  //              bitsError, ulpsError);
		std::cout<<bitsError<<" bits error ("<<ulpsError<<" ulps)\n";
  	std::cout<<"****************\n\n"; 
  }
		if(bitsError>30){
			print_trace ();
			exit(0);
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
	if(!initFlag){
		initFlag = true;
		std::cout<<"init called\n";
    size_t length = MAX_STACK_SIZE * sizeof(struct Real);
    size_t len = MAX_SIZE * sizeof(size_t);
    //size_t len = 128 * sizeof(size_t);
    shadowStack = (Real *) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    shadowMap = (Real *) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    //insMap = (size_t(*)[100]) mmap(0, len * 100, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    insMap = (size_t*)mmap(0, 2048*sizeof(size_t), PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    frameCur = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    argCount = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    slotIdx = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    returnIdx = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    assert (insMap != (void*)-1);
    assert (varTrack != (void*)-1);
		for(int i = 0; i <= MPFRINIT; i++)
			mpfr_init2(shadowStack[i].mpfr_val, PRECISION);
		frameCur[0] = 0;
		argCount[0] = 0;
		slotIdx[0] = 0;
		funcInit(0);
//#ifdef MULTITHREADED
  // Create the threads
	//	pthread_create(&con, NULL, consumer, NULL);
//    report<<"thread created\n";
//#endif
	}
}
extern "C" void finish(){
	std::cout<<"finish called\n";
  int n;
  char name [100];
  bool flag = false;
  //  mpfr_clear(it->second->mpfr_val);
   // delete(it->second);
  //  shadowMap.erase(it);
  //  mpfrClear++;


  std::cout<<"mpfrInit:"<<mpfrInit<<"\n";
  std::cout<<"mpfrClear:"<<mpfrClear<<"\n";
  std::cout<<"mpfrInitMap:"<<mpfrInitMap<<"\n";
  std::cout<<"mpfrClearMap:"<<mpfrClearMap<<"\n";
  for (std::map<size_t, struct ErrorAggregate*>::iterator it=errorMap.begin(); it!=errorMap.end(); ++it){
    double avg = it->second->total_error/it->second->num_evals;
    fprintf (pFile, "%f bits average error\n",avg);
    fprintf (pFile, "%f max  error\n\n",  it->second->max_error);
  }
/*
	 for (std::map<size_t, struct BrError*>::iterator it=errBrMap.begin(); it!=errBrMap.end(); ++it){
        fprintf (pFile, "compare\n");
        fprintf (pFile, "branch flipped %lld",  it->second->incorrRes);
        fprintf (pFile, " times out of %lld",  it->second->num_evals);
        fprintf (pFile, " compare @ %lld", it->second->lineNo);
        fprintf (pFile, "\n\n\n");
    }
*/
//  fclose (pFile);
}

