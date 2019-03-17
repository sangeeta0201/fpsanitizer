#include <string.h>
#include <fstream>
#include <queue>
#include <iostream>
#include <stdlib.h>
#include <execinfo.h>
#include <limits.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <asm/unistd.h>
#include "handleReal.h"

#define MULTHITHREADED 0
#define PERF 0
#define PERF1 0
#define PERF2 0
#define PERF22 0
#define debug 0
#define debugCR 0

pthread_mutex_t the_mutex;
pthread_cond_t condc, condp;
pthread_t con, con1, con2, con3, con4, con5, con6;

int fd;
long
perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
               int cpu, int group_fd, unsigned long flags)
{
   int ret;

   ret = syscall(__NR_perf_event_open, hw_event, pid, cpu,
                  group_fd, flags);
   return ret;
}

void start_counter(){
   struct perf_event_attr pe;

   memset(&pe, 0, sizeof(struct perf_event_attr));
   pe.type = PERF_TYPE_HARDWARE;
   pe.size = sizeof(struct perf_event_attr);
   pe.config = PERF_COUNT_HW_INSTRUCTIONS;
  //pe.config = PERF_COUNT_HW_CPU_CYCLES;
//  pe.config = PERF_COUNT_HW_CACHE_MISSES;
   pe.disabled = 1;
   pe.exclude_kernel = 1;
   pe.exclude_hv = 1;

   fd = perf_event_open(&pe, 0, -1, -1, 0);
   if (fd == -1) {
      fprintf(stderr, "Error opening leader %llx\n", pe.config);
      exit(EXIT_FAILURE);
   }                                                                                         
	 
   ioctl(fd, PERF_EVENT_IOC_RESET, 0);
   ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
}

size_t stop(){
	long long count;
	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
	read(fd, &count, sizeof(long long));
	close(fd);	
	return count;
}

void updateIndex(){
//	bufIdx.fetch_and_add(1);
	bufIdx++;
}

/***MPFR functions***/
void initMpfr(mpfr_t *val){
//	mpfr_init2(*val, PRECISION);
}

void initAndSetMpfr(mpfr_t *val, double d){
//	mpfr_init2(*val, PRECISION);
//	mpfr_set_d(*val, d, MPFR_RNDN);
}

void initAndSetMpfrF(mpfr_t *val, float f){
//	mpfr_init2(*val, PRECISION);
//	mpfr_set_flt(*val, f, MPFR_RNDN);
}
void setMpfr(mpfr_t *val1, mpfr_t *val2){
//	mpfr_set(*val1, *val2, MPFR_RNDN);
}
void setMpfrD(mpfr_t *val, double d){
//	mpfr_set_d(*val, d, MPFR_RNDN);
}

void setMpfrF(mpfr_t *val, float f){
//	mpfr_set_flt(*val, f, MPFR_RNDN);
}

float getFloat(mpfr_t mpfr_val){  
  return mpfr_get_flt(mpfr_val, MPFR_RNDN);
}

double getDouble(mpfr_t mpfr_val){  
//  return mpfr_get_d(mpfr_val, MPFR_RNDN);
	return 2.3;
}

long double getLongDouble(Real *real){  
  return mpfr_get_ld(real->mpfr_val, MPFR_RNDN);
}
extern "C" void __dummy(){
	countDummy++;
}

void handleOp(size_t opCode, mpfr_t *res, mpfr_t *op1, mpfr_t *op2){
/*
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
*/
}

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
		initMpfr(&(realAddr->mpfr_val));
		realAddr->initMPFRFlag = 1;
	}
	return realAddr;
}

size_t getSlotIndex(size_t InsIndex){
	size_t offset = frameCur[frameIdx];
	size_t idx = offset + InsIndex;
	if(idx >= MAX_STACK_SIZE){
		std::cout<<"idx:"<<idx;
	}
	assert(idx < MAX_STACK_SIZE);
	if(!shadowStack[idx].initMPFRFlag){
		initMpfr(&(shadowStack[idx].mpfr_val));
		shadowStack[idx].initMPFRFlag = 1;
	}
	return idx;	
}

void print_trace (void)
{
  void *array[10];
  size_t size;
  char **strings;
  size_t i;

  size = backtrace (array, 10);
  strings = backtrace_symbols (array, size);

  for (i = 0; i < 5; i++)
		std::cout<<strings[i]<<"\n"; 
		//fprintf (eFile, "%s\n", strings[i]); 

  free (strings);
}

extern "C" size_t __get_addr(void *Addr){
  size_t AddrInt = (size_t) Addr;
  return 0;
}

void add_fun_arg(size_t argNo, size_t opIdx, double op){
#if PERF2
	start_counter();
#endif	
	size_t dest = stackTop + argNo; // this is location where argument is need to be pushed
	size_t src = getSlotIndex(opIdx); //this is index of parameter passed to the function
	if(!shadowStack[dest].initMPFRFlag){
		initMpfr(&(shadowStack[dest].mpfr_val));
		shadowStack[dest].initMPFRFlag = 1;
	}
	if(shadowStack[src].initFlag){
		setMpfr(&(shadowStack[dest].mpfr_val), &( shadowStack[src].mpfr_val));
		if(debug){
			std::cout<<"add_fun_arg:opIdx:"<<opIdx<<" from src:"<<src<<":"<<&(shadowStack[src].mpfr_val)
						<<" arg:"<<argNo<<" pushed to:"<<dest<<":"<<&(shadowStack[dest].mpfr_val)<<"\n";
			printReal(shadowStack[dest].mpfr_val);
		}
	}
	else{
		setMpfrD(&(shadowStack[dest].mpfr_val), op);
		if(debug){
			std::cout<<"add_fun_arg::opIdx:"<<opIdx<<" from op:"<<op<<" arg:"<<argNo<<" pushed to:"
								<<dest<<":"<<&(shadowStack[dest].mpfr_val)<<"\n";
			printReal(shadowStack[dest].mpfr_val);
		}
	}
	shadowStack[dest].initFlag = 1;
#if PERF2
	add_fun_argC += stop();
#endif
}

//called from caller before calling function
extern "C" void __add_fun_arg(size_t argNo, size_t opIdx, double opd){
#if PERF
	start_counter();
#endif	
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = opIdx;
	buf[bufIdx].op1d = opd;
	buf[bufIdx].argNo = argNo;
	buf[bufIdx].cmd = 8;
	updateIndex();

	//worker.push(op);
#else
	add_fun_arg(argNo, opIdx, opd);
	//add_fun_arg(op->argNo, op->op1Addr, op->op1d);
#endif	
#if PERF
	add_fun_argC += stop();
#endif
}

void func_init(size_t totalSlots){
#if PERF2
	start_counter();
#endif
	if(!initFlag){
		__init(totalSlots);
		initFlag = true;
	}
#if 0 //stack analysis
	funcL.push((size_t)Addr);
#endif
/*
	frameIdx is incremented for every func call
*/
	frameIdx++;	
	assert(frameIdx < MAX_SIZE);
/*
	frameCur points to the current frame frameIndex, which is sum of 
old frame index and total number of slots of previous function 
*/
	frameCur[frameIdx] = stackTop;
	stackTop += totalSlots;

	
	if(debug){
		std::cout<<"__func_init totalSlots:"<<totalSlots<<" frameIdx:"<<frameIdx<<" offset:"<<frameCur[frameIdx]<<"******\n";
		std::cout<<"stackTop:"<<stackTop<<"\n";
	}
#if PERF2
	func_initC += stop();
#endif
/*
	curRetIdx stores the index where return needs to be copied in caller
*/
}

extern "C" void __func_init(size_t totalSlots){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].totalSlots = totalSlots;
	buf[bufIdx].cmd = 9;
	updateIndex();

//	worker.push(op);
#else
	func_init(totalSlots);
	//func_init(op->totalSlots);
#endif	
#if PERF
	func_initC += stop();
#endif
}

void copy_return(size_t returnIndex, double op){
#if PERF2
	start_counter();
#endif
	if(returnIndex){	//if we are returning zero while recursing, we just need to set the frame index
		size_t offset = frameCur[frameIdx];
		size_t calleFrame = curRetIdx + stackTop; //return always copied to index 1
		Real *returnReal = &(shadowStack[calleFrame]); //return is copied to index 0
		if(curRetIdx == 0){ //returned constant
			if(!shadowStack[returnIndex + offset].initMPFRFlag){
				initMpfr(&(shadowStack[returnIndex + offset].mpfr_val));
				shadowStack[returnIndex + offset].initMPFRFlag = 1;
			}
			setMpfrD(&(shadowStack[returnIndex + offset].mpfr_val), op);
		}
		else if(returnReal->initFlag){ // we don't need to do anything if return is not initialized
			if(!shadowStack[returnIndex + offset].initMPFRFlag){
				initMpfr(&(shadowStack[returnIndex + offset].mpfr_val));
				shadowStack[returnIndex + offset].initMPFRFlag = 1;
			}
			setMpfr(&(shadowStack[returnIndex + offset].mpfr_val), &(returnReal->mpfr_val));
			shadowStack[returnIndex + offset].initFlag = 1;
			if(debug){
				std::cout<<"src:"; 
				printReal(returnReal->mpfr_val);
				std::cout<<"\ndst:"; 
				printReal(shadowStack[returnIndex + offset].mpfr_val);
				std::cout<<"\ncopied from index:"<<calleFrame<<":"<<&(shadowStack[calleFrame].mpfr_val)
						<<" to index:"<<returnIndex + offset<<":"<<&(shadowStack[returnIndex + offset].mpfr_val)<<"\n";
			}
		}
		else
			if(debug)
				std::cout<<"copy_return src:"<<calleFrame<<" is not set\n";
	}
#if PERF2
	copy_returnC += stop();
#endif	
}

extern "C" void __copy_return(size_t returnIndex, double opd){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].returnIndex = returnIndex;
	buf[bufIdx].cmd = 10;
	buf[bufIdx].op1d = opd;
	updateIndex();

	//worker.push(op);
#else
	copy_return(returnIndex, opd);
	//copy_return(op->returnIndex, op->op1d);
#endif
#if PERF
	copy_returnC += stop();
#endif	
}

//This copies retIndex to index 1
void func_exit(size_t retIndex){
#if PERF2
	start_counter();
#endif
	for(int i = frameCur[frameIdx]; i < stackTop; i++){
		shadowStack[i].initFlag = 0;
	} 
	//If I won't reset the iniFlag, then old value might be read
	stackTop = frameCur[frameIdx];
	frameIdx--;	
	curRetIdx = retIndex;
#if PERF2
	func_exitC += stop();
#endif
#if 0 // stack analysis
	size_t newAddr = (size_t)Addr;
	size_t oldAddr = funcL.top();
	if(oldAddr != newAddr){
		print_trace();
		std::cout<<"crash\n";
		exit(0);
	}
	funcL.pop();
#endif
}

extern "C" void __func_exit(size_t retIndex){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
//	Compute *op = new Compute;
	buf[bufIdx].returnIndex = retIndex;
	buf[bufIdx].cmd = 11;
	updateIndex();

	//worker.push(op);
#else
	func_exit(retIndex);
	//func_exit(op->returnIndex);
#endif	
#if PERF
	func_exitC += stop();
#endif
}

void handle_f_to_sint(size_t op1Int, long val, size_t lineNo){
#if PERF2
	start_counter();
#endif
	size_t op1Idx = getSlotIndex(op1Int);
	Real *real1 = &(shadowStack[op1Idx]);

	long res = mpfr_get_si(real1->mpfr_val, MPFR_RNDN);
	if(res != val){
		fprintf (eFile, "convert mismatch %lu real: %ld float: %ld\n", lineNo, res, val);
		//std::cout<<"convert mismatch  real:"<<res<<" float: \n"<<val<<"\n";
			std::cout<<"convert mismatch  real:"<<res<<" float: \n"<<val<<"\n";
	}
#if PERF2
	handle_f_to_sintC += stop();
#endif
}

extern "C" void __handle_f_to_sint(size_t op1Int, long val, size_t lineNo){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
//	Compute *op = new Compute;
	buf[bufIdx].op1Addr = op1Int;
	buf[bufIdx].val = val;
	buf[bufIdx].lineNo = lineNo;
	buf[bufIdx].cmd = 12;

	updateIndex();
	//worker.push(op);
#else
	handle_f_to_sint(op1Int, val, lineNo);
	//handle_f_to_sint(op->op1Addr, op->val, op->lineNo);
#endif	
#if PERF
	handle_f_to_sintC += stop();
#endif
}

void handle_math_f(size_t funcCode, float op1, size_t op1Int, 
                                float computedRes, size_t insIndex){ 
  Real r1;

  mpfrInit++;
  bool mpfrFlag1 = false; 

	size_t op1Idx = getSlotIndex(op1Int);
	size_t resIdx = getSlotIndex(insIndex);

  Real *real1 = &(shadowStack[op1Idx]);
  if(op1Int == 0 || real1->initMPFRFlag == 0){
		initMpfr(&(r1.mpfr_val));
		mpfrInit++;
		mpfr_set_flt(r1.mpfr_val, op1, MPFR_RNDN);
		real1 = &r1;
		mpfrFlag1 = true; 
  }
	if(debug){
		printf("handleMathFuncF: op1Addr:%lu funcCode:%lu computed op1:%e real op1:\n", op1Idx, funcCode, op1);
  	printReal(real1->mpfr_val);
 	}
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        //std::cout<<"handleMathFunc: sqrt:\n";
        mpfr_sqrt(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 2: //floor
        //std::cout<<"handleMathFunc: floor:\n";
        mpfr_floor(shadowStack[resIdx].mpfr_val, real1->mpfr_val);
        break;
      case 3: //tan
        //std::cout<<"handleMathFunc: tan:\n";
        mpfr_tan(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 4: //sin
        //std::cout<<"handleMathFunc: sin:\n";
        mpfr_sin(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 5: //cos
        //std::cout<<"handleMathFunc: cos:\n";
        mpfr_cos(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 6: //atan
        //std::cout<<"handleMathFunc: atan:\n";
        mpfr_atan(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 8: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_abs(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 9: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_log(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 10: //asin
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_asin(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
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
    std::cout<<"\n";
  }
	
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
  }
	shadowStack[resIdx].initFlag = 1;
	updateErrorF(shadowStack[resIdx].mpfr_val, computedRes, insIndex);
}

void handle_math_d(size_t funcCode, double op1, size_t op1Int, 
                                double computedRes, size_t insIndex){ 
#if PERF2
	start_counter();
#endif
	Real *real1;
  Real r1;
  mpfrInit++;
  bool mpfrFlag1 = false; 
	size_t op1Idx = getSlotIndex(op1Int);
	size_t resIdx = getSlotIndex(insIndex);

	if(debug){
		std::cout<<"handle_math_d: op1Int:"<<op1Int<<" op1Idx:"<<op1Idx<<":"<<&(shadowStack[op1Idx].mpfr_val)<<"\n";
		std::cout<<"handle_math_d: funcCode:"<<funcCode<<" op1:"<<op1<<"\n";
	}

	if(op1Int == 0){ //it is a constant
    if(debugCR)
      std::cout<<"handle_math_d: real1 is null, using op1 value:"<<op1<<"\n";
		initAndSetMpfr(&(r1.mpfr_val), op1);
    mpfrInit++;
		real1 = &r1;
    mpfrFlag1 = true; 
	}
	else{
		real1 = &(shadowStack[op1Idx]);
		if(real1->initMPFRFlag == 0){
    	if(debugCR)
				std::cout<<"handle_math_d: real1 is null\n";
			initAndSetMpfr(&(r1.mpfr_val), op1);
    	mpfrInit++;
			real1 = &r1;
    	mpfrFlag1 = true; 
		}
		else if(real1->initFlag == 0){
			setMpfrD(&(real1->mpfr_val), op1);
				std::cout<<"handle_math_d: real1 is null\n";
		}
  }

	std::cout<<"handle_math_d: real:";
	printReal(real1->mpfr_val);
	std::cout<<"\n";

  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        //std::cout<<"handleMathFunc: sqrt:\n";
        mpfr_sqrt(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 2: //floor
        //std::cout<<"handleMathFunc: floor:\n";
        mpfr_floor(shadowStack[resIdx].mpfr_val, real1->mpfr_val);
        break;
      case 3: //tan
        //std::cout<<"handleMathFunc: tan:\n";
        mpfr_tan(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 4: //sin
        //std::cout<<"handleMathFunc: sin:\n";
        mpfr_sin(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 5: //cos
        //std::cout<<"handleMathFunc: cos:\n";
        mpfr_cos(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 6: //atan
        //std::cout<<"handleMathFunc: atan:\n";
        mpfr_atan(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 8: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_abs(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 9: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_log(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 10: //asin
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_asin(shadowStack[resIdx].mpfr_val, real1->mpfr_val, MPFR_RNDN);
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
    std::cout<<"\n";
  }
	
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
  }
	shadowStack[resIdx].initFlag = 1;
	if(debug)
		std::cout<<"handle_math_d: stackTop:"<<resIdx<<":"<<&(shadowStack[resIdx].mpfr_val)<<"\n";
	updateError(shadowStack[resIdx].mpfr_val, computedRes, insIndex);
#if PERF2
	handle_math_dC += stop();
#endif	
}

extern "C" void __handle_math_f(size_t funcCode, float op1, size_t op1Int, 
                                float computedRes, size_t insIndex){ 

#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].opCode = funcCode;
	buf[bufIdx].op1Addr = op1Int;
	buf[bufIdx].op1f = op1;
	buf[bufIdx].computedResf = computedRes;
	buf[bufIdx].insIndex = insIndex;
	buf[bufIdx].cmd = 4;

	updateIndex();
	//worker.push(op);
#else
	handle_math_f(funcCode, op1, op1Int, 
								computedRes, insIndex);
	//handle_math_f(op->opCode, op->op1f, op->op1Addr, 
		//						op->computedResf, op->insIndex);
#endif	
#if PERF
	handle_math_fC += stop(); 
#endif
}

extern "C" void __handle_math_d(size_t funcCode, double op1, size_t op1Int, 
                                double computedRes, size_t insIndex){ 
#if PERF
	start_counter();
#endif

#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].opCode = funcCode;
	buf[bufIdx].op1Addr = op1Int;
	buf[bufIdx].op1d = op1;
	buf[bufIdx].computedResd = computedRes;
	buf[bufIdx].insIndex = insIndex;
	buf[bufIdx].cmd = 3;

	updateIndex();
	//worker.push(op);	
#else
	handle_math_d(funcCode, op1, op1Int, 
								computedRes, insIndex);
	//handle_math_d(op->opCode, op->op1d, op->op1Addr, 
		//						op->computedResd, op->insIndex);
#endif
#if PERF
	handle_math_dC += stop();
#endif	
}



void load_f(size_t AddrInt, size_t insIndex, float opf, 
																						bool castFlag){
	struct Real* dest = getAddrIndex(AddrInt);
	size_t resIdx = getSlotIndex(insIndex);

	if(debug){
			std::cout<<"fpSanLoadFromShadowMem: opf:"<<opf<<" AddrInt:"<<AddrInt<<"";
	}
	if(dest->initFlag == 0){
		if(castFlag)
			setMpfrF(&(shadowStack[resIdx].mpfr_val), 0);
		else
			setMpfrF(&(shadowStack[resIdx].mpfr_val), opf);
		if(debug){
			size_t addr = (size_t) &shadowStack[resIdx];
			std::cout<<"fpSanLoadFromShadowMemF: set value:";
			printReal( shadowStack[resIdx].mpfr_val);
			std::cout<<" in shadowStack at:"<<resIdx;;
			printf(" for addr:%p ", (void *)addr);
			std::cout<<" from op"<<"\n";
		}
	}
	else{
		setMpfr(&(shadowStack[resIdx].mpfr_val), &(dest->mpfr_val));
		if(debug){
			size_t addr = (size_t) &shadowStack[resIdx];
			std::cout<<"fpSanLoadFromShadowMemF: set value:";
			printReal( shadowStack[resIdx].mpfr_val);
			std::cout<<" in shadowStack at:"<<resIdx;
			printf(" for addr:%p ", (void *)addr);
			printf(" from addr:%p\n",  (void *)AddrInt);
		}
	}
	shadowStack[resIdx].initFlag = 1;
}

extern "C" void __load_f(void *Addr, size_t insIndex, float opf, 
																						bool castFlag){
#if PERF
	start_counter();
#endif
	size_t AddrInt = (size_t) Addr;
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = AddrInt;
	buf[bufIdx].op1f = opf;
	buf[bufIdx].castFlag = castFlag;
	buf[bufIdx].insIndex = insIndex;
	buf[bufIdx].cmd = 13; //TODO

	updateIndex();
	//worker.push(op);	
#else
	load_f(AddrInt, insIndex, opf, castFlag);
	//load_f(op->op1Addr, op->insIndex, op->op1f, op->castFlag);
#endif
#if PERF
	load_fC += stop(); 
#endif
}

void load_d(size_t AddrInt, size_t insIndex, double opd, 
																								bool castFlag){
#if PERF2
	start_counter();
#endif
	struct Real* dest = getAddrIndex(AddrInt);
	size_t resIdx = getSlotIndex(insIndex);
	if(dest->initFlag == 0){
		if(castFlag)
			setMpfrD(&(shadowStack[resIdx].mpfr_val), 0);
		else
			setMpfrD(&(shadowStack[resIdx].mpfr_val), opd);

		if(debug){
			size_t addr = (size_t) &shadowStack[resIdx];
			std::cout<<"load_d: set value:";
			printReal( shadowStack[resIdx].mpfr_val);
			std::cout<<" from op"<<"\n";
		}
	}
	else{
		setMpfr(&(shadowStack[resIdx].mpfr_val), &(dest->mpfr_val));
		if(debug){
			size_t addr = (size_t) &shadowStack[resIdx];
			std::cout<<"load_d: set value:";
			printReal( shadowStack[resIdx].mpfr_val);
			std::cout<<" from: "<<&(dest->mpfr_val)<<"\n";
		}
	}
	shadowStack[resIdx].initFlag = 1;
	if(debug)
		std::cout<<"load_d: stackTop:"<<resIdx<<":"<<&(shadowStack[resIdx].mpfr_val)<<"\n";
#if PERF2
	load_dC += stop();
#endif
}

extern "C" void __load_d(void *Addr, size_t insIndex, double opd, 
																								bool castFlag){
#if PERF
	start_counter();
#endif
	size_t AddrInt = (size_t) Addr;
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = AddrInt;
	buf[bufIdx].op1d = opd;
	buf[bufIdx].castFlag = castFlag;
	buf[bufIdx].insIndex = insIndex;
	buf[bufIdx].cmd = 14; 

	updateIndex();
	//worker.push(op);	
#else
	
	load_d(AddrInt, insIndex, opd, castFlag);
	//load_d(op->op1Addr, op->insIndex, op->op1d, op->castFlag);
#endif
#if PERF
	load_dC += stop();
#endif
}

int handleCmp(mpfr_t *op1, mpfr_t *op2){
	return mpfr_cmp(*op1, *op2); 
}

void check_branch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            size_t fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
#if PERF2
	start_counter();
#endif
  Real *real1;
  Real *real2;
  Real r1;
  Real r2;

	bool mpfrFlag1 = false;
	bool mpfrFlag2 = false;

	size_t op1Idx = getSlotIndex(op1Int);
	size_t op2Idx = getSlotIndex(op2Int);
	size_t resIdx = getSlotIndex(insIndex);

	if(debug){
		std::cout<<"check_branch: op1Int:"<<op1Int<<" op1Idx:"<<&(shadowStack[op1Idx].mpfr_val)<<"\n";
		std::cout<<"check_branch: op2Int:"<<op2Int<<" op2Idx:"<<&(shadowStack[op2Idx].mpfr_val)<<"\n";
	}
	if(op1Int == 0){ //it is a constant
    if(debug)
      std::cout<<"checkBranch: real1 is null, using op1 value:"<<op1<<"\n";
		initAndSetMpfr(&(r1.mpfr_val), op1);
    mpfrInit++;
    real1 = &r1;
    mpfrFlag1 = true; 
  }
  else{
    real1 = &(shadowStack[op1Idx]);
    if(real1->initMPFRFlag == 0){
    	if(debug)
      	std::cout<<"checkBranch: real1 is null\n";
			initAndSetMpfr(&(r1.mpfr_val), op1);
      mpfrInit++;
      real1 = &r1;
      mpfrFlag1 = true; 
    }
		else if(real1->initFlag == 0){
			setMpfrD(&(real1->mpfr_val), op1);
				std::cout<<"checkBranch: real1 is null\n";
		}
      //data might be set without store
  }
	if(op2Int == 0){ //it is a constant
    if(debug)
      std::cout<<"checkBranch: real2 is null, using op2 value:"<<op2<<"\n";
		initAndSetMpfr(&(r2.mpfr_val), op2);
    mpfrInit++;
    real2 = &r2;
    mpfrFlag2 = true; 
  } 
  else{
    real2 = &(shadowStack[op2Idx]);
    if(real2->initMPFRFlag == 0){
    	if(debug)
      	std::cout<<"checkBranch: real2 is null\n";
			initAndSetMpfr(&(r2.mpfr_val), op2);
      mpfrInit++;
      real2 = &r2;
      mpfrFlag2 = true; 
    }
		else if(real2->initFlag == 0){
			setMpfrD(&(real2->mpfr_val), op2);
				std::cout<<"checkBranch: real1 is null\n";
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
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(real2->mpfr_val);
    mpfrClear++;
  }

	updateBranchError(realRes, computedRes, insIndex, lineNo);
	if(debug)
		std::cout<<"\n\n";
#if PERF2
	check_branchC += stop();
#endif
}

void setOperandsFloat(size_t opCode, size_t op1Addr, size_t op2Addr, 
												float op1f, float op2f, float computedResf, 
												size_t insIndex){
#if PERF2
	start_counter();
#endif
	Real *real1;
	Real *real2;
  Real r1;
  Real r2;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;

	size_t op1Idx = getSlotIndex(op1Addr);
	size_t op2Idx = getSlotIndex(op2Addr);
	size_t resIdx = getSlotIndex(insIndex);
	if(op1Addr == 0){ //it is a constant
    if(debugCR)
      std::cout<<"computeReal: real1 is null, using op1 value:"<<op1f<<"\n";
		initAndSetMpfrF(&(r1.mpfr_val), op1f);
    mpfrInit++;
		real1 = &r1;
    mpfrFlag1 = true; 
	}
	else{
		real1 = &(shadowStack[op1Idx]);
		if(real1->initMPFRFlag == 0){
    	if(debugCR)
				std::cout<<"computeReal: real1 is null\n"; //why?
			initAndSetMpfrF(&(r1.mpfr_val), op1f);
    	mpfrInit++;
			real1 = &r1;
    	mpfrFlag1 = true; 
		}
      //data might be set without store
  }
	if(op2Addr == 0){
    if(debugCR)
      std::cout<<"computeReal: real2 is null, using op2 value:"<<op2f<<"\n";
		initAndSetMpfrF(&(r2.mpfr_val), op2f);
    mpfrInit++;
		real2 = &r2;
    mpfrFlag2 = true; 
	}
	else{
		real2 = &(shadowStack[op2Idx]);
			if(real2->initMPFRFlag == 0){
    		if(debugCR)
					std::cout<<"computeReal: real2 is null\n";
				initAndSetMpfrF(&(r2.mpfr_val), op2f);
    		mpfrInit++;
				real2 = &r2;
    		mpfrFlag2 = true; 
			}
	}
	if(debugCR){
		std::cout<<"computeReal: op1:"<<op1f<<" op2:"<<op2f<<"\n";
		std::cout<<"computeReal: op1Idx:"<<op1Idx;
  	printReal(real1->mpfr_val);
		std::cout<<"computeReal: op2Idx:"<<op2Idx;
  	printReal(real2->mpfr_val);
	}
  handleOp(opCode, &(shadowStack[resIdx].mpfr_val), &real1->mpfr_val, &real2->mpfr_val);
	shadowStack[resIdx].initFlag = 1;
	if(debugCR){
		std::cout<<"computeReal: stackTop:"<<resIdx<<":"<<"\n";
	}
  if(mpfrFlag1){
    mpfr_clear(r1.mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(r2.mpfr_val);
    mpfrClear++;
  }
	updateErrorF(shadowStack[resIdx].mpfr_val, computedResf, insIndex);
#if PERF2
	setOperandsFloatC += stop();
#endif
}

void setOperandsDouble(size_t opCode, size_t op1Addr, size_t op2Addr, 
													double op1d, double op2d, double computedResd, 
														size_t insIndex){
#if PERF22
	start_counter();
#endif
	Real *real1;
	Real *real2;
  Real r1;
  Real r2;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;

	size_t op1Idx = getSlotIndex(op1Addr);
	size_t op2Idx = getSlotIndex(op2Addr);
	size_t resIdx = getSlotIndex(insIndex);

  if(debugCR){
		std::cout<<"computeReal: op1Addr:"<<op1Addr<<" op1Idx:"<<op1Idx<<":"<<&(shadowStack[op1Idx].mpfr_val)<<"\n";
		std::cout<<"computeReal: op2Addr:"<<op2Addr<<" op2Idx:"<<op2Idx<<":"<<&(shadowStack[op2Idx].mpfr_val)<<"\n";
	}

  if(debugCR){
		std::cout<<"op1d:"<<op1d<<" op2d:"<<op2d<<"\n";
	}
	if(op1Addr == 0){ //it is a constant
    if(debugCR)
      std::cout<<"computeReal: real1 is null, using op1 value:"<<op1d<<"\n";
		initAndSetMpfr(&(r1.mpfr_val), op1d);
    mpfrInit++;
		real1 = &r1;
    mpfrFlag1 = true; 
	}
	else{
		real1 = &(shadowStack[op1Idx]);
		if(real1->initMPFRFlag == 0){
    	if(debugCR)
				std::cout<<"computeReal: real1 is null\n";
			initAndSetMpfr(&(r1.mpfr_val), op1d);
    	mpfrInit++;
			real1 = &r1;
    	mpfrFlag1 = true; 
		}
		else if(real1->initFlag == 0){
			setMpfrD(&(real1->mpfr_val), op1d);
		}
      //data might be set without store
  }
	if(op2Addr == 0){
    if(debugCR)
      std::cout<<"computeReal: real2 is null, using op2 value:"<<op2d<<"\n";
		initAndSetMpfr(&(r2.mpfr_val), op2d);
    mpfrInit++;
		real2 = &r2;
    mpfrFlag2 = true; 
	}
	else{
		real2 = &(shadowStack[op2Idx]);
			if(real2->initMPFRFlag == 0){
    		if(debugCR)
					std::cout<<"computeReal: real2 is null\n";
				initAndSetMpfr(&(r2.mpfr_val), op2d);
    		mpfrInit++;
				real2 = &r2;
    		mpfrFlag2 = true; 
			}
			else if(real2->initFlag == 0){
				setMpfrD(&(real2->mpfr_val), op2d);
			}
	}
	if(debugCR){
		std::cout<<"computeReal: op1 index:"<<op1Idx<<" ";
  	printReal(real1->mpfr_val);
		std::cout<<"\n";
		std::cout<<"computeReal: op2 index:"<<op2Idx<<" ";
  	printReal(real2->mpfr_val);
		std::cout<<"\n";
	}
	if(real1 == NULL || real2 == NULL)
		std::cout<<"Error!!!!\n";
		
  handleOp(opCode, &(shadowStack[resIdx].mpfr_val), &real1->mpfr_val, &real2->mpfr_val);
	shadowStack[resIdx].initFlag = 1;
	if(debugCR){
		std::cout<<"computeReal:insIndex:"<<insIndex<<" stackTop:"<<resIdx<<":"<<&(shadowStack[resIdx].mpfr_val);
	}
  if(mpfrFlag1){
    mpfr_clear(r1.mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(r2.mpfr_val);
    mpfrClear++;
  }
	updateError(shadowStack[resIdx].mpfr_val, computedResd, insIndex);
#if PERF22
	setOperandsDoubleC += stop(); 
#endif
}

int isNaN(mpfr_t real){
  return mpfr_nan_p(real);
}

extern "C" void __compute_real_f(size_t opCode, size_t op1Addr, size_t op2Addr,
                             float op1f, float op2f, float computedResf, size_t insIndex){
#if PERF
	start_counter();
#endif
	
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].opCode = opCode;
	buf[bufIdx].op1Addr = op1Addr;
	buf[bufIdx].op2Addr = op2Addr;
	buf[bufIdx].op1f = op1f;
	buf[bufIdx].op2f = op2f;
	buf[bufIdx].computedResf = computedResf;
	buf[bufIdx].insIndex = insIndex;
	buf[bufIdx].cmd = 1;
	updateIndex();
//	worker.push(op);	
#else
	setOperandsFloat(opCode, op1Addr, op2Addr, 
												op1f, op2f, computedResf, insIndex);
	//setOperandsFloat(op->opCode, op->op1Addr, op->op2Addr, 
		//										op->op1f, op->op2f, op->computedResf, op->insIndex);
#endif
#if PERF
	setOperandsFloatC += stop();
#endif
}

extern "C" void __compute_real_d(size_t opCode, size_t op1Addr, size_t op2Addr, 
                      double op1d, double op2d, double computedResd, size_t insIndex){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].opCode = opCode;
	buf[bufIdx].op1Addr = op1Addr;
	buf[bufIdx].op2Addr = op2Addr;
	buf[bufIdx].op1d = op1d;
	buf[bufIdx].op2d = op2d;
	buf[bufIdx].computedResd = computedResd;
	buf[bufIdx].insIndex = insIndex;
	buf[bufIdx].cmd = 2;
	updateIndex();
//	worker.push(op);	

//	else if(count == 2)
//		ready2.push(op);	
///	else if(count == 3)
//		ready3.push(op);	
//	else if(count == 4)
//		ready4.push(op);	
//	if(count == 3)
//		count = 0;
	
#else
	setOperandsDouble(opCode, op1Addr, op2Addr, 
												op1d, op2d, computedResd, insIndex);
	//setOperandsDouble(op->opCode, op->op1Addr, op->op2Addr, 
		//										op->op1d, op->op2d, op->computedResd, op->insIndex);
#endif
#if PERF
	setOperandsDoubleC += stop(); 
#endif
}

extern "C" bool __check_branch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            size_t fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = op1Int;
	buf[bufIdx].op2Addr = op2Int;
	buf[bufIdx].op1d = op1;
	buf[bufIdx].op2d = op2;
	buf[bufIdx].fcmpRes = computedRes;
	buf[bufIdx].fcmpFlag = fcmpFlag;
	buf[bufIdx].insIndex = insIndex;
	buf[bufIdx].lineNo = lineNo;
	buf[bufIdx].cmd = 5;
	updateIndex();
//	worker.push(op);	
#else
	check_branch(op1, op1Int, op2, op2Int, 
               fcmpFlag, computedRes, insIndex, lineNo);
	//check_branch(op->op1d, op->op1Addr, op->op2d, op->op2Addr, 
    //           op->fcmpFlag, op->fcmpRes, op->insIndex, op->lineNo);
#endif
#if PERF
	check_branchC += stop();
#endif
	return true;
}

extern "C" void* __handle_alloca(size_t index){
}
//TODO
extern "C" void __set_real_fun_arg(size_t index, size_t funAddrInt, size_t toAddrInt, double op){
}

void set_real_cons_d(size_t toAddrInt, double value){
#if PERF2
	start_counter();
#endif
	if(debug){
		std::cout<<"setRealConstantD: set:"<<value;
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
	struct Real* dest = getAddrIndex(toAddrInt);
	setMpfrD(&(dest->mpfr_val), value);
	dest->initFlag = 1;
#if PERF2
	set_real_cons_dC += stop();
#endif
}

extern "C" void __set_real_cons_d(size_t toAddrInt, double value){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = toAddrInt;
	buf[bufIdx].op1d = value;
	buf[bufIdx].cmd = 15;
	updateIndex();
//	worker.push(op);	
#else
	set_real_cons_d(toAddrInt, value);
	//set_real_cons_d(op->op1Addr, op->op1d);
#endif
#if PERF
	set_real_cons_dC += stop();
#endif
}

void set_real_cons_f(size_t toAddrInt, float value){
	struct Real* dest = getAddrIndex(toAddrInt);
	mpfrInitMap++;
	setMpfrF(&(dest->mpfr_val), value);
	if(debug){
		std::cout<<"setRealConstantF: set:";
		printReal(dest->mpfr_val);
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
	dest->initFlag = 1;
}

extern "C" void __set_real_cons_f(size_t toAddrInt, float value){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = toAddrInt;
	buf[bufIdx].op1f = value;
	buf[bufIdx].cmd = 16;
	updateIndex();
//	worker.push(op);	
#else
	set_real_cons_f(toAddrInt, value);
	//set_real_cons_f(op->op1Addr, op->op1f);
#endif
#if PERF
	set_real_cons_fC += stop();
#endif
}

void set_real(size_t toAddrInt, size_t fromAddrInt, double op){
#if PERF2
	start_counter();
#endif
	size_t fromIdx = getSlotIndex(fromAddrInt);
	Real* dest = getAddrIndex(toAddrInt);
	Real* real =  &(shadowStack[fromIdx]);
	if(real->initFlag == 0){
		setMpfrD(&(dest->mpfr_val), op);
		if(debug){
			std::cout<<"setRealTemp: from double:"<<op<<"\n";
		}
	}
	else{
		setMpfr(&(dest->mpfr_val), &(real->mpfr_val));
		if(debug){
			std::cout<<"setRealTemp from "<<fromAddrInt<<":";
			printReal(real->mpfr_val);
		}
	}
	dest->initFlag = 1;
	if(debug){
		std::cout<<"setRealTemp: dest set to:";
		printReal(dest->mpfr_val);
		printf("from: %ld", fromIdx);
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
#if PERF2
	set_realC += stop();
#endif
}

extern "C" void __set_real(size_t toAddrInt, size_t fromAddrInt, double op1){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = toAddrInt;
	buf[bufIdx].op2Addr = fromAddrInt;
	buf[bufIdx].op1d = op1;
	buf[bufIdx].cmd = 7;
	updateIndex();
//	worker.push(op);	
#else
	set_real(toAddrInt, fromAddrInt, op1);
	//set_real(op->op1Addr, op->op2Addr, op->op1d);
#endif
#if PERF
	set_realC += stop();
#endif

}

void handle_calloc(size_t toAddrInt, size_t size1, size_t size2){
#if PERF2
	start_counter();
#endif
	size_t size = size1 * size2;
	size_t tmp = 0;
	if(debug){
		std::cout<<"***handleCalloc size:"<<size<<"\n";
		printf("handleCalloc to addr:%p \n ", (void *)toAddrInt);
	}

	struct Real* dest;
	dest = getAddrIndex(toAddrInt);
	
	while(tmp < size){
		dest->initFlag = 0;
		toAddrInt = toAddrInt + 1;
		dest = getAddrIndex(toAddrInt);
		tmp += 1;
	}

#if PERF2
	handle_callocC += stop();
#endif
}

extern "C" void __handle_calloc(size_t toAddrInt, size_t size1, size_t size2){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = toAddrInt;
	buf[bufIdx].size1 = size1;
	buf[bufIdx].size2 = size2;
	buf[bufIdx].cmd = 17;
	updateIndex();
//	worker.push(op);	
#else
	handle_calloc(toAddrInt, size1, size2);
	//handle_calloc(op->op1Addr, op->size1, op->size2);
#endif
#if PERF
	handle_callocC += stop();
#endif
}

void handle_malloc(size_t toAddrInt, size_t size){
#if PERF2
	start_counter();
#endif
	size_t tmp = 0;
	if(debug){
		std::cout<<"handleMalloc size:"<<size<<"\n";
	}

	struct Real* dest;
	dest = getAddrIndex(toAddrInt);

	while(tmp < size && dest->initFlag){
		dest->initFlag = 0;
		toAddrInt = toAddrInt + 1;
		dest = getAddrIndex(toAddrInt);
		tmp += 1;
	}

#if PERF2
	handle_mallocC += stop();
#endif
}

extern "C" void __handle_malloc(size_t toAddrInt, size_t size){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
//	Compute *op = new Compute;
	buf[bufIdx].op1Addr = toAddrInt;
	buf[bufIdx].size1 = size;
	buf[bufIdx].cmd = 18;
	updateIndex();
//	worker.push(op);	
#else
	handle_malloc(toAddrInt, size);
	//handle_malloc(op->op1Addr, op->size1);
#endif
#if PERF
	handle_mallocC += stop();
#endif
}

void handle_memset(size_t toAddrInt, size_t size){
#if PERF2
	start_counter();
#endif
	size_t tmp = 0;
	if(debug){
		std::cout<<"handleLLVMMemset size:"<<size<<"\n";
	}

	struct Real* dest;
	dest = getAddrIndex(toAddrInt);

	while(tmp < size){
		dest->initFlag = 0;
		toAddrInt = toAddrInt + 1;
		dest = getAddrIndex(toAddrInt);
		tmp += 1;
	}

#if PERF2
	handle_memsetC += stop();
#endif
}

extern "C" void __handle_memset(size_t toAddrInt, size_t size){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = toAddrInt;
	buf[bufIdx].size1 = size;
	buf[bufIdx].cmd = 19;

	updateIndex();
	//worker.push(op);	
#else
	handle_memset(toAddrInt, size);
	//handle_memset(op->op1Addr, op->size1);
#endif
#if PERF
	handle_memsetC += stop();
#endif
}

void handle_memcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
#if PERF2
	start_counter();
#endif

	size_t tmp = 0;
	struct Real* dest, *src;
	src = getAddrIndex(fromAddrInt);
	dest = getAddrIndex(toAddrInt);

	while(tmp < size ){ //handling only double
		if(src->initFlag){
			//mpfr_set(dest->mpfr_val, src->mpfr_val, MPFR_RNDN);
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

#if PERF2
	handle_memcpyC += stop(); 
#endif
}

extern "C" void __handle_memcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
#if PERF
	start_counter();
#endif
#if MULTHITHREADED
	//Compute *op = new Compute;
	buf[bufIdx].op1Addr = toAddrInt;
	buf[bufIdx].op2Addr = fromAddrInt;
	buf[bufIdx].size1 = size;
	buf[bufIdx].cmd = 20;
	updateIndex();
	//worker.push(op);	
#else
	handle_memcpy(toAddrInt, fromAddrInt, size);
	//handle_memcpy(op->op1Addr, op->op2Addr, op->size1);
#endif
#if PERF
	handle_memcpyC += stop(); 
#endif
}

void printReal(mpfr_t mpfr_val){
/*
  char* shadowValStr;
  mpfr_exp_t shadowValExpt;

  shadowValStr = mpfr_get_str(NULL, &shadowValExpt, 10, 0, mpfr_val, MPFR_RNDN);
  printf("%c.%se%ld", shadowValStr[0], shadowValStr+1, shadowValExpt-1);
  std::cout<<shadowValStr[0]<<"."<<shadowValStr+1<<"e"<<shadowValExpt-1;
  mpfr_free_str(shadowValStr);
  mpfr_out_str (stdout, 10, 0, mpfr_val, MPFR_RNDN);
*/
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
   printf("%f bits error (%lu ulps)\n",
               bitsError, ulpsError);
	//	std::cout<<bitsError<<" bits error ("<<ulpsError<<" ulps)\n";
  	std::cout<<"****************\n\n"; 
  }
		if(bitsError>63){
			print_trace ();
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
   printf("%f bits error (%lu ulps)\n",
               bitsError, ulpsError);
	//	std::cout<<bitsError<<" bits error ("<<ulpsError<<" ulps)\n";
  	std::cout<<"****************\n\n"; 
  }
		if(bitsError>50){
			print_trace();
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

void init(size_t totalSlots){
}

extern "C" void __init(size_t totalSlots){
#if PERF
	start_counter();
#endif

  if(!initFlag){
    initFlag = true;
    size_t length = MAX_STACK_SIZE * sizeof(struct Real);
    size_t length1 = MAX_BUF_SIZE * sizeof(struct Compute);
    size_t memLen = SS_PRIMARY_TABLE_ENTRIES * sizeof(struct Real);
    size_t len = MAX_SIZE * sizeof(size_t);
    //size_t len = 128 * sizeof(size_t);
    shadowStack = (Real *) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    shadowMap = (Real **) mmap(0, memLen, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    frameCur = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    buf = (Compute *) mmap(0, length1, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    assert (shadowStack != (void*)-1);
    assert (shadowMap != (void*)-1);
    frameCur[0] = 0;

	std::cout<<"__init stop counting:"<<initC<<"\n";
#if PERF
	initC += stop(); 
#endif
	std::cout<<"__init stop counting:"<<initC<<"\n";
    __func_init(totalSlots);

		std::cout<<"init1\n";	
  	// Create the threads
  //	pthread_create(&rdy, NULL, ready, NULL);
//  	pthread_create(&con, NULL, consumer, NULL);

#if MULTHITHREADED
  	pthread_create(&con1, NULL, consumer1, NULL);
//  	pthread_create(&con2, NULL, consumer2, NULL);
//  	pthread_create(&con3, NULL, consumer3, NULL);
//  	pthread_create(&con4, NULL, consumer4, NULL);

  	std::cout<<"thread created\n";

#endif
  }

}

void* consumer1(void *ptr) {
	bool flag = false;	
	while(true){
		if(resCount < bufIdx ){
			switch(buf[resCount].cmd){
				case 1:
					setOperandsFloat(buf[resCount].opCode, buf[resCount].op1Addr, buf[resCount].op2Addr, 
												buf[resCount].op1f, buf[resCount].op2f, buf[resCount].computedResf, buf[resCount].insIndex);
					resCount++;
					break;
				case 2:
				//std::cout<<"buf[resCount].cmd:"<<buf[resCount].cmd<<"\n";
					setOperandsDouble(buf[resCount].opCode, buf[resCount].op1Addr, buf[resCount].op2Addr, 
												buf[resCount].op1d, buf[resCount].op2d, buf[resCount].computedResd, buf[resCount].insIndex);
/*
					if(buf[resCount].op1Addr == 0 && buf[resCount].op2Addr == 0){	
						if(flag){
							ready1[readyIdx] = resCount;
							ready1Idx++;	
							flag = true;
						}
						else{
							ready2[readyIdx] = resCount;
							ready2Idx++;	
							flag = false;
						}
					}
*/
					resCount++;
					break;
				case 3:
					handle_math_d(buf[resCount].opCode, buf[resCount].op1d, buf[resCount].op1Addr, 
								buf[resCount].computedResd, buf[resCount].insIndex);
					resCount++;
					break;
				case 4:
					handle_math_f(buf[resCount].opCode, buf[resCount].op1f, buf[resCount].op1Addr, 
								buf[resCount].computedResf, buf[resCount].insIndex);
					resCount++;
					break;
				case 5:
					check_branch(buf[resCount].op1d, buf[resCount].op1Addr, buf[resCount].op2d, buf[resCount].op2Addr, 
                     buf[resCount].fcmpFlag, buf[resCount].fcmpRes, buf[resCount].insIndex, buf[resCount].lineNo);
					resCount++;
					break;
				case 6:
					//handle_select(op->op1Addr, op->insIndex, op->op1d);
					break;
				case 7:
  				set_real(buf[resCount].op1Addr, buf[resCount].op2Addr, buf[resCount].op1d);  
					resCount++;
					break;
				case 8:
					add_fun_arg(buf[resCount].argNo, buf[resCount].op1Addr, buf[resCount].op1d);
					resCount++;
					break;
				case 9:
					func_init(buf[resCount].totalSlots);
					resCount++;
					break;
				case 10:
					copy_return(buf[resCount].returnIndex, buf[resCount].op1d);
					resCount++;
					break;
				case 11:
					func_exit(buf[resCount].returnIndex);
					resCount++;
					break;
				case 12:
					handle_f_to_sint(buf[resCount].op1Addr, buf[resCount].val, buf[resCount].lineNo);
					resCount++;
					break;
				case 13:
					load_f(buf[resCount].op1Addr, buf[resCount].insIndex, buf[resCount].op1f, buf[resCount].castFlag);
					resCount++;
					break;
				case 14:
					load_d(buf[resCount].op1Addr, buf[resCount].insIndex, buf[resCount].op1d, buf[resCount].castFlag);
					resCount++;
					break;
				case 15:
					set_real_cons_d(buf[resCount].op1Addr, buf[resCount].op1d);
					resCount++;
					break;
				case 16:
					set_real_cons_f(buf[resCount].op1Addr, buf[resCount].op1f);
					resCount++;
					break;
				case 17:
					handle_calloc(buf[resCount].op1Addr, buf[resCount].size1, buf[resCount].size2);
					resCount++;
					break;
				case 18:
					handle_malloc(buf[resCount].op1Addr, buf[resCount].size1);
					resCount++;
					break;
				case 19:
					handle_memset(buf[resCount].op1Addr, buf[resCount].size1);
					resCount++;
					break;
				case 20:
					handle_memcpy(buf[resCount].op1Addr, buf[resCount].op2Addr, buf[resCount].size1);
					resCount++;
					break;
				case 21:
					std::cout<<"consumer1: cmd 21****\n";
					return NULL; //we have finished 
				default:
					break;
			}
		}	
	}
	return NULL;
}
#if 0
void* consumer2(void *ptr) {
	Compute *op; 
	while(true){
		if(ready2.try_pop(op)){
			switch(op->cmd){
				case 1:
					setOperandsFloat(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1f, op->op2f, op->computedResf, op->insIndex);
					break;
				case 2:
					setOperandsDouble(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1d, op->op2d, op->computedResd, op->insIndex);
					count2++;
					break;
				case 3:
					handle_math_d(op->opCode, op->op1d, op->op1Addr, 
								op->computedResd, op->insIndex);
					break;
				case 4:
					handle_math_f(op->opCode, op->op1f, op->op1Addr, 
								op->computedResf, op->insIndex);
					break;
				case 5:
					check_branch(op->op1d, op->op1Addr, op->op2d, op->op2Addr, 
                     op->fcmpFlag, op->computedResd, op->insIndex, op->lineNo);
					break;
				case 6:
					handle_select(op->op1Addr, op->insIndex, op->op1d);
					break;
				case 7:
  				set_real(op->op1Addr, op->op2Addr, op->op1d);  
					break;
				default:
					break;
			delete op;
			}
		}	
	}
	return NULL;
}
void* consumer3(void *ptr) {
	Compute *op; 
	while(!consumerFlag || ready3.unsafe_size() > 0){
		if(ready3.try_pop(op)){
			switch(op->cmd){
				case 1:
					setOperandsFloat(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1f, op->op2f, op->computedResf, op->insIndex);
					break;
				case 2:
					setOperandsDouble(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1d, op->op2d, op->computedResd, op->insIndex);
					count3++;
					break;
				case 3:
					handle_math_d(op->opCode, op->op1d, op->op1Addr, 
								op->computedResd, op->insIndex);
					break;
				case 4:
					handle_math_f(op->opCode, op->op1f, op->op1Addr, 
								op->computedResf, op->insIndex);
					break;
				case 5:
					check_branch(op->op1d, op->op1Addr, op->op2d, op->op2Addr, 
                     op->fcmpFlag, op->computedResd, op->insIndex, op->lineNo);
					break;
				case 6:
					handle_select(op->op1Addr, op->insIndex, op->op1d);
					break;
				case 7:
  				set_real(op->op1Addr, op->op2Addr, op->op1d);  
					break;
				default:
					break;
			}
			delete op;
		}	
	}
	return NULL;
}
void* consumer4(void *ptr) {
	Compute *op; 
	while(!consumerFlag || ready4.unsafe_size() > 0){
	if(ready4.try_pop(op)){
			switch(op->cmd){
				case 1:
					setOperandsFloat(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1f, op->op2f, op->computedResf, op->insIndex);
					break;
				case 2:
					setOperandsDouble(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1d, op->op2d, op->computedResd, op->insIndex);
					count4++;
					break;
				case 3:
					handle_math_d(op->opCode, op->op1d, op->op1Addr, 
								op->computedResd, op->insIndex);
					break;
				case 4:
					handle_math_f(op->opCode, op->op1f, op->op1Addr, 
								op->computedResf, op->insIndex);
					break;
				case 5:
					check_branch(op->op1d, op->op1Addr, op->op2d, op->op2Addr, 
                     op->fcmpFlag, op->computedResd, op->insIndex, op->lineNo);
					break;
				case 6:
					handle_select(op->op1Addr, op->insIndex, op->op1d);
					break;
				case 7:
  				set_real(op->op1Addr, op->op2Addr, op->op1d);  
					break;
				default:
					break;
			}
			delete op;
		}	
	}
	return NULL;
}

void* consumer5(void *ptr) {
	Compute *op; 
//	while(!consumerFlag || ready2.unsafe_size() > 0 || worker.unsafe_size() > 0){
	while(!consumerFlag){
		if(ready5.try_pop(op) ) {
			switch(op->cmd){
				case 1:
					setOperandsFloat(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1f, op->op2f, op->computedResf, op->insIndex);
					break;
				case 2:
					setOperandsDouble(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1d, op->op2d, op->computedResd, op->insIndex);
					count4++;
					break;
				case 3:
					handle_math_d(op->opCode, op->op1d, op->op1Addr, 
								op->computedResd, op->insIndex);
					break;
				case 4:
					handle_math_f(op->opCode, op->op1f, op->op1Addr, 
								op->computedResf, op->insIndex);
					break;
				case 5:
					check_branch(op->op1d, op->op1Addr, op->op2d, op->op2Addr, 
                     op->fcmpFlag, op->computedResd, op->insIndex, op->lineNo);
					break;
				case 6:
					handle_select(op->op1Addr, op->insIndex, op->op1d);
					break;
				case 7:
  				set_real(op->op1Addr, op->op2Addr, op->op1d);  
					break;
				default:
					break;
			}
		}	
	}
	return NULL;
}

void* consumer6(void *ptr) {
	Compute *op; 
//	while(!consumerFlag || ready2.unsafe_size() > 0 || worker.unsafe_size() > 0){
		while(!consumerFlag || ready6.unsafe_size() > 0 ){
		if(ready6.try_pop(op) ) {
			switch(op->cmd){
				case 1:
					setOperandsFloat(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1f, op->op2f, op->computedResf, op->insIndex);
					break;
				case 2:
					setOperandsDouble(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1d, op->op2d, op->computedResd, op->insIndex);
					count4++;
					break;
				case 3:
					handle_math_d(op->opCode, op->op1d, op->op1Addr, 
								op->computedResd, op->insIndex);
					break;
				case 4:
					handle_math_f(op->opCode, op->op1f, op->op1Addr, 
								op->computedResf, op->insIndex);
					break;
				case 5:
					check_branch(op->op1d, op->op1Addr, op->op2d, op->op2Addr, 
                     op->fcmpFlag, op->computedResd, op->insIndex, op->lineNo);
					break;
				case 6:
					handle_select(op->op1Addr, op->insIndex, op->op1d);
					break;
				case 7:
  				set_real(op->op1Addr, op->op2Addr, op->op1d);  
					break;
				default:
					break;
			}
		}	
	}
	return NULL;
}
#endif
extern "C" void __finish(){
	
#if MULTHITHREADED
//	Compute *op = new Compute;
	buf[bufIdx].cmd = 21;
	bufIdx++;
	buf[bufIdx].cmd = 21;
	bufIdx++;
	std::cout<<"bufIdx:"<<bufIdx;
//	worker.push(op);

	consumerFlag = true;
	std::cout<<"waiting for consumer\n";
	pthread_join(con1, NULL);
#endif
#if PERF
	start_counter();
#endif

	//std::cout<<"__finish: worker.unsafe_size():"<<worker.unsafe_size()<<"\n";
//	std::cout<<"Avg Instructions:"<<(double)sumIns/totalIns<<"\n";
	std::cout<<"countDummy:"<<countDummy<<"\n";
	std::cout<<"initTime:"<<initTime<<"\n";
	std::cout<<"computeTime:"<<computeTime<<"\n";
	std::cout<<"setRealTime:"<<setRealTime<<"\n";
	std::cout<<"getAddrTime:"<<getAddrTime<<"\n";
	std::cout<<"funcInitTime:"<<funcInitTime<<"\n";
	std::cout<<"funcExitTime:"<<funcExitTime<<"\n";
	std::cout<<"mallocTime:"<<mallocTime<<"\n";
	std::cout<<"callocTime:"<<callocTime<<"\n";
	std::cout<<"memsetTime:"<<memsetTime<<"\n";
	std::cout<<"memcpyTime:"<<memcpyTime<<"\n";
	std::cout<<"uErrorTime:"<<uErrorTime<<"\n";
	std::cout<<"loadFTime:"<<loadFTime<<"\n";
	std::cout<<"loadDTime:"<<loadDTime<<"\n";
	std::cout<<"addAddrTime:"<<addAddrTime<<"\n";
	std::cout<<"addFunTime:"<<addFunTime<<"\n";
	std::cout<<"fToITime:"<<fToITime<<"\n";
	std::cout<<"mathFTime:"<<mathFTime<<"\n";
	std::cout<<"mathDTime:"<<mathDTime<<"\n";
	std::cout<<"selectTime:"<<selectTime<<"\n";
	std::cout<<"computeFTime:"<<computeFTime<<"\n";
	std::cout<<"checkBrTime:"<<checkBrTime<<"\n";
	std::cout<<"setRealFArgTime:"<<setRealFArgTime<<"\n";
	std::cout<<"setRealCDTime:"<<setRealCDTime<<"\n";
	std::cout<<"setRealCFTime:"<<setRealCFTime<<"\n";
	std::cout<<"copyRetTime:"<<copyRetTime<<"\n";
	std::cout<<"popTime:"<<popTime<<"\n";
	std::cout<<"popCount:"<<popCount<<"\n";

/*
	time_t begin = time(NULL);
  	pthread_create(&con1, NULL, consumer1, NULL);
  	pthread_create(&con2, NULL, consumer2, NULL);
  	pthread_create(&con3, NULL, consumer3, NULL);
  	pthread_join(con1, NULL);
  	pthread_join(con2, NULL);
  	pthread_join(con3, NULL);
	time_t end = time(NULL);
	double time_taken = double(end - begin); 
    std::cout << "Time taken by program is : " << time_taken;
    std::cout << " sec " << "\n"; 

	std::cout<<"totComputations:"<<totComputations<<"\n";
	std::cout<<"count1:"<<count1<<"\n";
	std::cout<<"count2:"<<count2<<"\n";
	std::cout<<"count3:"<<count3<<"\n";
	std::cout<<"count4:"<<count4<<"\n";
	std::cout<<"count5:"<<count5<<"\n";
	std::cout<<"count6:"<<count6<<"\n";
*/
  for (std::map<size_t, struct ErrorAggregate*>::iterator it=errorMap.begin(); it!=errorMap.end(); ++it){
    double avg = it->second->total_error/it->second->num_evals;
		if(it->second->total_error > 0) {
    	fprintf (pFile, "%f bits average error\n",avg);
    	fprintf (pFile, "%f max  error\n\n",  it->second->max_error);
		}
  }

	for (std::map<size_t, struct BrError*>::iterator it=errBrMap.begin(); it!=errBrMap.end(); ++it){
		if(it->second->incorrRes > 0){
			fprintf (eFile, "compare\n");
			fprintf (eFile, "branch flipped %lld",  it->second->incorrRes);
			fprintf (eFile, " times out of %lld",  it->second->num_evals);
			fprintf (eFile, " compare @ %lld", it->second->lineNo);
			fprintf (eFile, "\n\n\n");
		}
	}
#if PERF
	finishC += stop();
#endif
	std::cout<<"add_fun_argC:         "<<add_fun_argC<<"\n";
	std::cout<<"func_initC:         "<<func_initC<<"\n";
	std::cout<<"copy_returnC:         "<<copy_returnC<<"\n";
	std::cout<<"func_exitC:         "<<func_exitC<<"\n";
	std::cout<<"handle_f_to_sintC:         "<<handle_f_to_sintC<<"\n";
	std::cout<<"handle_math_fC:         "<<handle_math_fC<<"\n";
	std::cout<<"handle_math_dC:         "<<handle_math_dC<<"\n";
	std::cout<<"load_fC:         "<<load_fC<<"\n";
	std::cout<<"load_dC:         "<<load_dC<<"\n";
	std::cout<<"setOperandsFloatC:         "<<setOperandsFloatC<<"\n";
	std::cout<<"setOperandsDoubleC:         "<<setOperandsDoubleC<<"\n";
	std::cout<<"check_branchC:         "<<check_branchC<<"\n";
	std::cout<<"set_real_cons_dC:         "<<set_real_cons_dC<<"\n";
	std::cout<<"set_real_cons_fC:         "<<set_real_cons_fC<<"\n";
	std::cout<<"set_realC:         "<<set_realC<<"\n";
	std::cout<<"handle_callocC:         "<<handle_callocC<<"\n";
	std::cout<<"handle_memsetC:         "<<handle_memsetC<<"\n";
	std::cout<<"handle_memcpyC:         "<<handle_memcpyC<<"\n";
	std::cout<<"initC:         "<<initC<<"\n";
	std::cout<<"finishC:         "<<finishC<<"\n";
	std::cout<<"consumer:         "<<conC<<"\n";
	std::cout<<"resCount:         "<<resCount<<"\n";
	std::cout<<"count:         "<<count<<"\n";
	totalC = add_fun_argC+func_initC+copy_returnC+func_exitC+handle_f_to_sintC+
						handle_math_fC+handle_math_dC+load_fC+load_dC+setOperandsFloatC+setOperandsDoubleC+
						check_branchC+set_real_cons_dC+set_real_cons_fC+set_realC+handle_callocC+handle_memsetC+
						handle_memcpyC+initC+finishC;
	std::cout<<"totalC:         "<<totalC<<"\n";
//  fclose (pFile);

}

