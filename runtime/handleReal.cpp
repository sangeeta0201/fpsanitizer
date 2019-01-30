#include "handleReal.h"
#include <string.h>
#include <fstream>
#include <queue>
#include <iostream>
#include <stdlib.h>
#include <execinfo.h>
#include <limits.h>

#define INSSIZE 1000000

const size_t LEVEL1_ENTRIES = ((size_t) 64* (size_t) 1024); //2^16
const size_t LEVEL2_ENTRIES = ((size_t) 64* (size_t) 1024); //2^16
const size_t LEVEL3_ENTRIES = ((size_t) 64* (size_t) 1024); //2^26

const size_t SS_PRIMARY_TABLE_ENTRIES = ((size_t) 4194304);//2^22
const size_t SS_SEC_TABLE_ENTRIES = ((size_t) 64*(size_t) 1024 * (size_t) 1024); // 2^26
//const size_t SS_SEC_TABLE_ENTRIES = ((size_t)4 *(size_t) 1024 * (size_t) 1024); // 2^22

/*TODO : 
1. Handle const in llvm - gsl-modpi.c
2. Clean up shadow
3. How to figure out memcpy of only double?
*/
#define debug 1
#define debugCR 0
//#define MPFRINIT 100000000 //for spec
#define MPFRINIT 100
FILE *pFile = fopen ("error.log","w");
FILE *eFile = fopen ("branch.log","w");
FILE *lbmRef = fopen ("ref.log","w");
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

  for (i = 2; i < 3; i++)
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
	assert(frameIdx < MAX_SIZE)	;
	assert(insIndex < INSSIZE);
  if(insMap[insIndex] != 0){ 
    newRegIdx = insMap[insIndex];
		if(newRegIdx > slotIdx[frameIdx])
			slotIdx[frameIdx] = newRegIdx + 1;
	}
	else{
		newRegIdx = slotIdx[frameIdx];
  	insMap[insIndex] = slotIdx[frameIdx];
  	slotIdx[frameIdx] += 1;
	}
	if(debug){
//		std::cout<<"getRegRes newRegIdx:"<<newRegIdx<<" frameCur[frameIdx]:"<<frameCur[frameIdx]<<" \n";
	}
	return newRegIdx + frameCur[frameIdx] ;
}

extern "C" size_t getAddr(void *Addr){
  size_t AddrInt = (size_t) Addr;
  return AddrInt;
}

extern "C" void* addReturnAddr(){
	returnIdx[frameIdx] = frameCur[frameIdx] + slotIdx[frameIdx];
	size_t retAddr = returnIdx[frameIdx];
	slotIdx[frameIdx]++;
	if(debug){
//		std::cout<<"addReturnAddr: Idx:"<<retAddr;
		printf(" return addr:%p\n", (void *)&shadowStack[retAddr]);
	}
	return &shadowStack[retAddr];
}

extern "C" void addFunArg(size_t argNo, size_t argAddrInt, double op){
	argCount[frameIdx+1] = argCount[frameIdx+1] + 1;
	
	size_t stackTop = frameCur[frameIdx]+slotIdx[frameIdx];
	if(argAddrInt != 0){
		Real *real1 = (Real *)argAddrInt;
		mpfr_set(shadowStack[stackTop].mpfr_val, real1->mpfr_val, MPFR_RNDN);
	}
	else{
		mpfr_set_d(shadowStack[stackTop].mpfr_val, op, MPFR_RNDN);
	}
	shadowStack[stackTop].initFlag = 1;
	if(debug){
//		std::cout<<"addFunArg: arg copied from: "<<argAddrInt<<" stackTop:"<<stackTop<<"\n";
//		printf("addFunArg addr:%p\n", (void *)&shadowStack[stackTop]);
//		printReal((&shadowStack[stackTop])->mpfr_val);
	}
	slotIdx[frameIdx]++;
}

extern "C" void funcInit(void *fName){
	if(!initFlag){
		init();
		initFlag = true;
	}
	frameIdx++;
	memset(insMap, 0, INSSIZE * sizeof(size_t));
	frameCur[frameIdx] = frameCur[frameIdx-1]+slotIdx[frameIdx-1] /*return index*/ ;
	slotIdx[frameIdx] = 0;
	if(debug)
		std::cout<<"funcInit:"<<frameCur[frameIdx]<<"\n";
}

extern "C" void funcExit(size_t returnIndex){
	funcCount++;
  size_t var;
  size_t retAddr = returnIdx[frameIdx - 1];
	if(returnIndex != 0){
		if(debug){
			printf("funcExit: return copied from::%p to stackTop:%d\n", (void *)returnIndex, retAddr);
			printf(" addr:%p\n", (void *)&shadowStack[retAddr]);
		}
		Real *returnReal = (Real *)returnIndex;
		mpfr_set(shadowStack[retAddr].mpfr_val, returnReal->mpfr_val, MPFR_RNDN);
		shadowStack[retAddr].initFlag = 1;
	}	
	shadowStack[retAddr].initFlag = 0;
	if(debug)
		std::cout<<"funcExit:"<<retAddr<<"\n";
	frameIdx--;
	slotIdx[frameIdx] = slotIdx[frameIdx] - argCount[frameIdx+1];
	argCount[frameIdx + 1] = 0;
//	if(funcCount >= 11)
	//	exit(0);
}

extern "C" void handleAlloca(size_t varAddrInt){
}
extern "C" void handleFloatToSInt(size_t op1Int, long val, size_t lineNo){
	Real *real1 = (Real *)op1Int;
	long res = mpfr_get_si(real1->mpfr_val, MPFR_RNDN);
	if(res != val){
		print_trace();
		fprintf (eFile, "convert mismatch @ %lld real: %d flaot: %d\n", lineNo, res, val);
		std::cout<<"convert mismatch  real:"<<res<<" float: \n"<<val<<"\n";
		if(lineNo != 118 && lineNo != 131 &&  lineNo != 151 && lineNo != 209 && lineNo != 248)
			exit(0);
	
	}
}

extern "C" void* handleMathFuncF(size_t funcCode, float op1, size_t op1Int, 
                                                float computedRes, size_t insIndex){ 
  Real real_res, r1;
  
  mpfrInit++;
  bool mpfrFlag1 = false; 
  Real *real1 = (Real *)op1Int;
  if(op1Int == 0 || real1->initFlag == 0){
		mpfr_init2(r1.mpfr_val, PRECISION);
		mpfrInit++;
		mpfr_set_flt(r1.mpfr_val, op1, MPFR_RNDN);
		real1 = &r1;
		mpfrFlag1 = true; 
  }
	if(debug){
		printf("handleMathFuncF: op1Addr:%p funcCode:%d computed op1:%e real op1:\n", (void *)op1Int, funcCode, op1);
  	printReal(real1->mpfr_val);
 	}
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
    std::cout<<"handleMathFuncF: Error!!!\n";
    std::cout<<"handleMathFuncF res:";
    std::cout<<"\n";
    std::cout<<"handleMathFuncF op1:";
//    printReal(real1);
    std::cout<<"\n";
  }
	shadowStack[newRegIdx].initFlag = 1;
	
  if(debug){
	//	std::cout<<"handleMathFuncF: stackTop:"<<newRegIdx;
		printf(" addr:%p\n", (void *)&shadowStack[newRegIdx]);
//		std::cout<<"handleMathFuncF: idx:"<<newRegIdx<<"\n";
	}
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
  }
	updateErrorF(shadowStack[newRegIdx].mpfr_val, computedRes, insIndex);
  return &shadowStack[newRegIdx];
}

extern "C" void* handleMathFuncD(size_t funcCode, double op1, size_t op1Int, 
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
	if(debug){
		printf("handleMathFuncD: op1Addr:%p funcCode:%d computed op1:%e real op1:\n", (void *)op1Int, funcCode, op1);
  	printReal(real1->mpfr_val);
 	}
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
    std::cout<<"handleMathFuncD: Error!!!\n";
    std::cout<<"handleMathFuncD res:";
    std::cout<<"\n";
    std::cout<<"handleMathFuncD op1:";
//    printReal(real1);
    std::cout<<"\n";
  }
	shadowStack[newRegIdx].initFlag = 1;
	
  if(debug){
	//	std::cout<<"handleMathFuncD: stackTop:"<<newRegIdx;
		printf(" addr:%p\n", (void *)&shadowStack[newRegIdx]);
	}
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
	if(debug){
		std::cout<<"handleSelect: set value in shadowStack at:"<<newRegIdx;
		printf(" for addr:%p\n", (void *)AddrInt);
	}
	return &shadowStack[newRegIdx];
}

extern "C" void* fpSanLoadFromShadowMemF(void *Addr, size_t insIndex, float opf, bool castFlag){
  size_t newRegIdx = getRegRes(insIndex);
	size_t AddrInt = (size_t) Addr;
	struct Real* dest = getAddrIndex(AddrInt);
	if(debug){
			std::cout<<"fpSanLoadFromShadowMem: opf:"<<opf;
			printf(" from addr:%p\n", Addr);
	}
	if(dest->initFlag == 0){
		if(castFlag)
			mpfr_set_flt(shadowStack[newRegIdx].mpfr_val, 0, MPFR_RNDN);
		else
			mpfr_set_flt(shadowStack[newRegIdx].mpfr_val, opf, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[newRegIdx];
			std::cout<<"fpSanLoadFromShadowMemF: set value:";
			printReal( shadowStack[newRegIdx].mpfr_val);
			std::cout<<" in shadowStack at:"<<newRegIdx;;
			printf(" for addr:%p ", (void *)addr);
			std::cout<<" from op"<<"\n";
		}
	}
	else{
		mpfr_set(shadowStack[newRegIdx].mpfr_val, dest->mpfr_val, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[newRegIdx];
			std::cout<<"fpSanLoadFromShadowMemF: set value:";
			printReal( shadowStack[newRegIdx].mpfr_val);
			std::cout<<" in shadowStack at:"<<newRegIdx;
			printf(" for addr:%p ", (void *)addr);
			printf(" from addr:%p\n", Addr);
		}
	}
	shadowStack[newRegIdx].initFlag = 1;
	return &shadowStack[newRegIdx];
}

extern "C" void* fpSanLoadFromShadowMemD(void *Addr, size_t insIndex, double opd, bool castFlag){
  size_t newRegIdx = getRegRes(insIndex);
	size_t AddrInt = (size_t) Addr;
	struct Real* dest = getAddrIndex(AddrInt);
	if(debug){
			std::cout<<"fpSanLoadFromShadowMem: opd:"<<opd;
			printf(" from addr:%p\n", Addr);
	}
	if(dest->initFlag == 0){
		if(castFlag)
			mpfr_set_d(shadowStack[newRegIdx].mpfr_val, 0, MPFR_RNDN);
		else
			mpfr_set_d(shadowStack[newRegIdx].mpfr_val, opd, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[newRegIdx];
			std::cout<<"fpSanLoadFromShadowMemD: set value:";
			printReal( shadowStack[newRegIdx].mpfr_val);
			std::cout<<" in shadowStack at:"<<newRegIdx;;
			printf(" for addr:%p ", (void *)addr);
			std::cout<<" from op"<<"\n";
		}
	}
	else{
		mpfr_set(shadowStack[newRegIdx].mpfr_val, dest->mpfr_val, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[newRegIdx];
			std::cout<<"fpSanLoadFromShadowMemD: set value:";
			printReal( shadowStack[newRegIdx].mpfr_val);
			std::cout<<" in shadowStack at:"<<newRegIdx;
			printf(" for addr:%p ", (void *)addr);
			printf(" from addr:%p\n", Addr);
		}
	}
	shadowStack[newRegIdx].initFlag = 1;
	return &shadowStack[newRegIdx];
}

void setOperandsFloat(size_t opCode, size_t newRegIdx, size_t op1Addr, size_t op2Addr, 
												float op1f, float op2f, Real *real1, Real *real2){
  Real r1;
  Real r2;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
	if(op1Addr == 0){ //it is a constant
    if(debugCR)
      std::cout<<"computeReal: real1 is null, using op1 value:"<<op1f<<"\n";
    mpfr_init2(r1.mpfr_val, PRECISION);
    mpfrInit++;
		real1 = &r1;
    mpfr_set_flt(r1.mpfr_val, op1f, MPFR_RNDN);
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
    	mpfr_set_flt(r1.mpfr_val, op1f, MPFR_RNDN);
    	mpfrFlag1 = true; 
		}
      //data might be set without store
  }
	if(op2Addr == 0){
    if(debugCR)
      std::cout<<"computeReal: real2 is null, using op2 value:"<<op2f<<"\n";
    mpfr_init2(r2.mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_flt(r2.mpfr_val, op2f, MPFR_RNDN);
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
    		mpfr_set_flt(r2.mpfr_val, op2f, MPFR_RNDN);
    		mpfrFlag2 = true; 
			}
	}
	if(debugCR){
		std::cout<<"computeReal: op1:"<<op1f<<" op2:"<<op2f<<"\n";
		printf("computeReal: op1Addr:: %p op1:", (void *)op1Addr);
  	printReal(real1->mpfr_val);
		printf("computeReal: op2Addr:: %p op2:", (void *)op2Addr);
  	printReal(real2->mpfr_val);
	}
  handleOp(opCode, &(shadowStack[newRegIdx].mpfr_val), &real1->mpfr_val, &real2->mpfr_val);
	shadowStack[newRegIdx].initFlag = 1;
	if(debugCR){
		std::cout<<"computeReal: stackTop:"<<newRegIdx;;
		printf(" addr %p:\n", (void *)&shadowStack[newRegIdx]);
	}
  //printReal(shadowStack[newRegIdx]);
  if(mpfrFlag1){
    mpfr_clear(r1.mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(r2.mpfr_val);
    mpfrClear++;
  }
}

void setOperandsDouble(size_t opCode, size_t newRegIdx, size_t op1Addr, size_t op2Addr, 
													double op1d, double op2d, Real *real1, Real *real2){
  Real r1;
  Real r2;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
	if(op1Addr == 0){ //it is a constant
    if(debugCR)
      std::cout<<"computeReal: real1 is null, using op1 value:"<<op1d<<"\n";
    mpfr_init2(r1.mpfr_val, PRECISION);
    mpfrInit++;
		real1 = &r1;
    mpfr_set_d(r1.mpfr_val, op1d, MPFR_RNDN);
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
    	mpfr_set_d(r1.mpfr_val, op1d, MPFR_RNDN);
    	mpfrFlag1 = true; 
		}
      //data might be set without store
  }
	if(op2Addr == 0){
    if(debugCR)
      std::cout<<"computeReal: real2 is null, using op2 value:"<<op2d<<"\n";
    mpfr_init2(r2.mpfr_val, PRECISION);
    mpfrInit++;
    mpfr_set_d(r2.mpfr_val, op2d, MPFR_RNDN);
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
    		mpfr_set_d(r2.mpfr_val, op2d, MPFR_RNDN);
    		mpfrFlag2 = true; 
			}
	}
	if(debugCR){
		std::cout<<"computeReal: op1:"<<op1d<<" op2:"<<op2d<<"\n";
		printf("computeReal: op1Addr:: %p op1:", (void *)op1Addr);
  	printReal(real1->mpfr_val);
		printf("computeReal: op2Addr:: %p op2:", (void *)op2Addr);
  	printReal(real2->mpfr_val);
	}
  handleOp(opCode, &(shadowStack[newRegIdx].mpfr_val), &real1->mpfr_val, &real2->mpfr_val);
	shadowStack[newRegIdx].initFlag = 1;
	if(debugCR){
		std::cout<<"computeReal: stackTop:"<<newRegIdx;;
		printf(" addr %p:\n", (void *)&shadowStack[newRegIdx]);
	}
  //printReal(shadowStack[newRegIdx]);
  if(mpfrFlag1){
    mpfr_clear(r1.mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(r2.mpfr_val);
    mpfrClear++;
  }
}
extern "C" void* computeRealF(size_t opCode, size_t op1Addr, size_t op2Addr,
														 float op1f, float op2f, float computedResf, size_t insIndex){
  Real *real1;
  Real *real2;
  size_t newRegIdx = getRegRes(insIndex);
	setOperandsFloat(opCode, newRegIdx, op1Addr, op2Addr, op1f, op2f, real1, real2);
		
	
  updateErrorF(shadowStack[newRegIdx].mpfr_val, computedResf, insIndex);
	//print_trace();
  return &shadowStack[newRegIdx];
}

extern "C" void* computeRealD(size_t opCode, size_t op1Addr, size_t op2Addr, 
											double op1d, double op2d, double computedResd, size_t insIndex){
  Real *real1;
  Real *real2;
  size_t newRegIdx = getRegRes(insIndex);
	setOperandsDouble(opCode, newRegIdx, op1Addr, op2Addr, op1d, op2d, real1, real2);
		
	
  updateError(shadowStack[newRegIdx].mpfr_val, computedResd, insIndex);
	//print_trace();

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
//		std::cout<<" compare branch flipped @"<< lineNo<<"\n\n";
		fprintf (eFile, " compare branch flipped @ %lld\n", lineNo);
		//print_trace ();
	}
	if(realRes != computedRes){
//	if(realRes != computedRes){
		std::cout<<"checkBranch: realRes:"<<realRes<<" computedRes:"<<computedRes<<"\n";
    std::cout<<"checkBranch: computed operands op1:"<<op1<<" op2:"<<op2<<"\n";
    std::cout<<"checkBranch fcmpFlag:"<<fcmpFlag<<"\n"; 
		printf("checkBranch real operands op1Idx: :%p op1:", (void *)op1Int);
    printReal(real1->mpfr_val);
  //  mpfr_out_str (stdout, 10, 0, real1->mpfr_val, MPFR_RNDN);
    std::cout<<"\n";
		printf("checkBranch real operands op2Idx: :%p op2:", (void *)op2Int);
  //  mpfr_out_str (stdout, 10, 0, real2->mpfr_val, MPFR_RNDN);
    printReal(real2->mpfr_val);
    std::cout<<"\n";
		//exit(0);
//		}
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
	if(argCount[frameIdx] == 0)
		return 0;
	if(debug){
		std::cout<<"getRealFunArg: addr:"<<(size_t)&shadowStack[frameCur[frameIdx] - index - 1]<<"\n";
		std::cout<<"getRealFunArg: get from idx:"<<frameCur[frameIdx] - index - 1<<"\n";
	}
	return &shadowStack[frameCur[frameIdx] - index - 1];
}

extern "C" void setRealFunArg(size_t index, size_t funAddrInt, size_t toAddrInt, double op){
	struct Real* dest = getAddrIndex(toAddrInt);
	Real *real = &shadowStack[frameCur[frameIdx] - index - 1];
	mpfr_set(dest->mpfr_val, real->mpfr_val, MPFR_RNDN);
	dest->initFlag = 1;
	if(debug){
		std::cout<<"setRealFunArg: set:"<<(size_t)&shadowStack[frameCur[frameIdx] - index - 1]<<" ";
		printReal(real->mpfr_val);
		std::cout<<" to addr:"<<toAddrInt<<"\n";
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
extern "C" void setRealConstantD(size_t toAddrInt, double value){
	if(debug){
		std::cout<<"setRealConstantD: set:"<<value;
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
	struct Real* dest = getAddrIndex(toAddrInt);
	mpfr_set_d(dest->mpfr_val, value, MPFR_RNDN);
	dest->initFlag = 1;
}

extern "C" void setRealConstantF(size_t toAddrInt, float value){
	struct Real* dest = getAddrIndex(toAddrInt);
	mpfrInitMap++;
	mpfr_set_flt(dest->mpfr_val, value, MPFR_RNDN);
	if(debug){
		std::cout<<"setRealConstantF: set:";
		printReal(dest->mpfr_val);
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
	dest->initFlag = 1;
}

extern "C" void setRealTemp(size_t toAddrInt, size_t fromAddrInt, double op){
	struct Real* dest = getAddrIndex(toAddrInt);
	Real *real = (Real *)fromAddrInt;
	if(debug)
		std::cout<<"setRealTemp op:"<<op<<"\n";
	mpfrInitMap++;
	mpfr_set(dest->mpfr_val, real->mpfr_val, MPFR_RNDN);
	dest->initFlag = 1;
	if(debug){
		std::cout<<"setRealTemp: set:";
		printReal(real->mpfr_val);
		printf("from: %p", (void *)fromAddrInt);
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
}

extern "C" void handleCalloc(size_t toAddrInt, size_t size1, size_t size2){
	size_t size = size1 * size2;
	size_t tmp = 0;
	if(debug){
		std::cout<<"***handleCalloc size:"<<size<<"\n";
		printf("handleCalloc to addr:%p \n ", (void *)toAddrInt);
	}

	struct Real* dest;
	dest = getAddrIndex(toAddrInt);
	
//			std::cout<<"handleCalloc dest->initFlag:"<<dest->initFlag<<"\n";
		while(tmp < size){
	//		if(debug)
//			std::cout<<"size:"<<size<<" tmp:"<<tmp<<"\n";
	//			printf("handleCalloc to addr:%p \n ", (void *)toAddrInt);
			dest->initFlag = 0;
			toAddrInt = toAddrInt + 1;
			dest = getAddrIndex(toAddrInt);
		//	std::cout<<"handleCalloc dest->initFlag:"<<dest->initFlag<<"\n";
			tmp += 1;
		}
}

extern "C" void handleMalloc(size_t toAddrInt, size_t size){
	size_t tmp = 0;
	if(debug){
		std::cout<<"handleMalloc size:"<<size<<"\n";
	}

	struct Real* dest;
	dest = getAddrIndex(toAddrInt);
		while(tmp < size && dest->initFlag){
			//if(debug)
				//printf("handleMalloc to addr:%p \n ", (void *)toAddrInt);
			dest->initFlag = 0;
			toAddrInt = toAddrInt + 1;
			dest = getAddrIndex(toAddrInt);
			tmp += 1;
		}
}
extern "C" void handleLLVMMemset(size_t toAddrInt, size_t val, size_t size){
	size_t tmp = 0;
	if(debug){
		printf("handleLLVMMemset to addr:%p val:%e\n", (void *)toAddrInt, val);
		std::cout<<"handleLLVMMemset val:"<<val<<"\n";
		std::cout<<"handleLLVMMemset size:"<<size<<"\n";
	}

	struct Real* dest;
	dest = getAddrIndex(toAddrInt);
	while(tmp < size){
//		if(debug)
	//		printf("handleLLVMMemset to addr:%p val:%e\n", (void *)toAddrInt, val);
		dest->initFlag = 0;
		toAddrInt = toAddrInt + 1;
		dest = getAddrIndex(toAddrInt);
		tmp += 1;
	}
}

extern "C" void handleLLVMMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
	size_t tmp = 0;
	struct Real* dest, *src;
	src = getAddrIndex(fromAddrInt);
	dest = getAddrIndex(toAddrInt);

	while(tmp < size ){ //handling only double
//		if(debug)
	//		printf("handleLLVMMemcpy to addr:%p from addr:%p\n", (void *)toAddrInt, (void *)fromAddrInt);
		if(src->initFlag){
			mpfr_set(dest->mpfr_val, src->mpfr_val, MPFR_RNDN);
			dest->initFlag = 1;
		}
		else{
			dest->initFlag = 0;
		}
		toAddrInt = toAddrInt + 1;
		dest = getAddrIndex(toAddrInt);
		fromAddrInt = fromAddrInt + 1;
		src = getAddrIndex(fromAddrInt);
		tmp += 1;
	}

}

extern "C" void* handleExtractValue(size_t idx, size_t op1Addr){
	size_t shadowIdx = 0;
	if(debug)
		std::cout<<"handleExtractValue: idx:"<<idx<<" op1Addr:"<<op1Addr<<"\n";

	Real *real1 = (Real *)(op1Addr + idx * sizeof(double));
	return real1; //TODO: handling just double, generate error for other cases
}


float getFloat(mpfr_t mpfr_val){  
  return mpfr_get_flt(mpfr_val, MPFR_RNDN);
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
  printf("%fe-%d", val, i);
//		std::cout<<val<<"e-"<<i;
  } else if (val < 0 && val > -1){
    while (val > -1) {
      val *= 10;
      i++;
    }
    printf("%fe-%d", val, i);
		//std::cout<<val<<"e-"<<i;
  } else if (val >= 9.9999999){
    while (val >= 9.9999999){
      val /= 10;
      i++;
    }
    printf("%fe%d", val, i);
		//std::cout<<val<<"e"<<i;
  } else if (val <= -9.9999999){
    while (val <= -9.9999999){
      val /= 10;
      i++;
    }
    printf("%fe%d", val, i);
		//std::cout<<val<<"e"<<i;
  } else {
    printf("%f", val);
		//std::cout<<val;
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

double updateErrorF(mpfr_t realVal, float computedVal, size_t insIndex){
  struct ErrorAggregate* eagg;
  if(errorMap.count(insIndex) != 0){ 
    eagg = errorMap.at(insIndex);
  }
  else{
    eagg = new ErrorAggregate;
    initializeErrorAggregate(eagg);
  }

  float shadowRounded = getFloat(realVal);
  unsigned long ulpsError = ulpf(shadowRounded, computedVal);
  double bitsError = log2(ulpsError + 1);
  if (bitsError > eagg->max_error){
    eagg->max_error = bitsError;
  }
  eagg->total_error += bitsError;
  eagg->num_evals += 1;
   if (debug){
    std::cout<<"\nThe shadow value is ";
//    printReal(realVal);
  	mpfr_out_str (stdout, 10, 0, realVal, MPFR_RNDN);
    if (computedVal != computedVal){
      std::cout<<", but NaN was computed.\n";
    } else {
      std::cout<<", but ";
			printf("%.20g\n", computedVal);
      std::cout<<computedVal<<" was computed.\n";
    std::cout<<"updateErrorF: computedVal:"<<computedVal<<" insIndex:"<<insIndex<<"\n";
    }
   printf("%f bits error (%llu ulps)\n",
               bitsError, ulpsError);
	//	std::cout<<bitsError<<" bits error ("<<ulpsError<<" ulps)\n";
  	std::cout<<"****************\n\n"; 
  }
		if(bitsError>62){
			print_trace ();
			//exit(0);
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
   printf("%f bits error (%llu ulps)\n",
               bitsError, ulpsError);
	//	std::cout<<bitsError<<" bits error ("<<ulpsError<<" ulps)\n";
  	std::cout<<"****************\n\n"; 
  }
		if(bitsError>62){
			print_trace ();
			//exit(0);
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

unsigned long ulpf(float x, float y){
  if (x == 0) x = 0; // -0 == 0
  if (y == 0) y = 0; // -0 == 0

  /* if (x != x && y != y) return 0; */
  if (x != x) return UINT_MAX - 1; // Maximum error
  if (y != y) return UINT_MAX - 1; // Maximum error
  int xx = *((int*) &x);
  xx = xx < 0 ? INT_MIN - xx : xx;
  int yy = *((int*) &y);
  yy = yy < 0 ? INT_MIN - yy : yy;
  return xx >= yy ? xx - yy : yy - xx;
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
/*
struct Real* getAddrIndex(size_t addrInt){
  size_t primary_index = (addrInt >> 32) & 0xffff;
  struct Real* primary_ptr = shadowMap[primary_index];
  if (primary_ptr == NULL) {
	 //mmap secondary table
    size_t sec_length = (LEVEL2_ENTRIES) * sizeof(struct Real);
    primary_ptr = (struct Real*)mmap(0, sec_length, PROT_READ| PROT_WRITE,
          MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0);
    size_t third_length = (LEVEL3_ENTRIES) * sizeof(struct Real);
    primary_ptr = (struct Real*)mmap(0, sec_length, PROT_READ| PROT_WRITE,
          MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0);
    shadowMap[primary_index] = primary_ptr;
  }

  //size_t offset = (addrInt) & 0x3fffff; 
  size_t offset = (addrInt) & 0x3ffffff; 
  struct Real* realAddr = primary_ptr + offset;
	return realAddr;
}
*/
struct Real* getAddrIndex(size_t addrInt){
//	addrInt = addrInt >> 4;
  //size_t primary_index = (addrInt >> 22) & 0x3fffff;
  size_t primary_index = (addrInt >> 26) & 0x3fffff;
  struct Real* primary_ptr = shadowMap[primary_index];
  if (primary_ptr == NULL) {
	 //mmap secondary table
    size_t sec_length = (SS_SEC_TABLE_ENTRIES) * sizeof(struct Real);
    primary_ptr = (struct Real*)mmap(0, sec_length, PROT_READ| PROT_WRITE,
          MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0);
    shadowMap[primary_index] = primary_ptr;
  }

  //size_t offset = (addrInt) & 0x3fffff; 
  size_t offset = (addrInt) & 0x3ffffff; 
  struct Real* realAddr = primary_ptr + offset;
	if(!realAddr->initMPFRFlag){
		mpfr_init2(realAddr->mpfr_val, PRECISION);
		realAddr->initMPFRFlag = 1;
	}
	return realAddr;
}

extern "C" void init(){
	if(!initFlag){
		initFlag = true;
		std::cout<<"init called\n";
    size_t length = MAX_STACK_SIZE * sizeof(struct Real);
    size_t memLen = SS_PRIMARY_TABLE_ENTRIES * sizeof(struct Real);
//    size_t memLen = LEVEL1_ENTRIES * sizeof(struct Real);
    size_t len = MAX_SIZE * sizeof(size_t);
    //size_t len = 128 * sizeof(size_t);
    shadowStack = (Real *) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    shadowMap = (Real **) mmap(0, memLen, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    //insMap = (size_t(*)[100]) mmap(0, len * 100, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    insMap = (size_t*)mmap(0, INSSIZE*sizeof(size_t), PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    frameCur = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    argCount = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    slotIdx = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    returnIdx = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    assert (shadowStack != (void*)-1);
    assert (shadowMap != (void*)-1);
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

extern "C" void printToFile(void* op1Addr, void* op2Addr, void* op3Addr){
	Real* real1 = getAddrIndex((size_t)op1Addr);
	Real* real2 = getAddrIndex((size_t)op2Addr);
	Real* real3 = getAddrIndex((size_t)op3Addr);
	printf("printToFile addr1:%p\n", op1Addr);
	printf("printToFile addr2:%p\n", op2Addr);
	printf("printToFile addr3:%p\n", op3Addr);
  	mpfr_out_str (lbmRef, 10, 15, real1->mpfr_val, MPFR_RNDN);
    fprintf (lbmRef, " ");
  	mpfr_out_str (lbmRef, 10, 15, real2->mpfr_val, MPFR_RNDN);
    fprintf (lbmRef, " ");
  	mpfr_out_str (lbmRef, 10, 15, real3->mpfr_val, MPFR_RNDN);
    fprintf (lbmRef, "\n");
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

