#include "handleReal.h"
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

#define MULTHITHREADED 0
#define TIME 0
#define debug 1 
#define debugCR 1

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
//  pe.config = PERF_COUNT_HW_CPU_CYCLES;
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

void stop(){
   long long count;
   ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
   read(fd, &count, sizeof(long long));
	 totalIns++;
   sumIns += count;
	 close(fd);	
//   printf("Used %lld instructions\n", count);

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
		mpfr_init2(realAddr->mpfr_val, PRECISION);
		realAddr->initMPFRFlag = 1;
	}
	return realAddr;
}

void print_trace (void)
{
  void *array[10];
  size_t size;
  char **strings;
  size_t i;

  size = backtrace (array, 10);
  strings = backtrace_symbols (array, size);

  for (i = 0; i < 4; i++)
		std::cout<<strings[i]<<"\n"; 
		//fprintf (eFile, "%s\n", strings[i]); 

  free (strings);
}

extern "C" void* __add_return_addr(){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
#if TIME
	gettimeofday(&tv2, NULL);
	addAddrTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
  return &shadowStack[0];
}

extern "C" size_t __get_addr(void *Addr){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
  size_t AddrInt = (size_t) Addr;
#if TIME
	gettimeofday(&tv2, NULL);
	getAddrTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
  return AddrInt;
}

extern "C" void __add_fun_arg(size_t argNo, size_t argAddrInt, double op){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
//TODO assert, as it might crash here
#if TIME
	gettimeofday(&tv2, NULL);
	addFunTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" void __func_init(size_t totalSlots, size_t returnIdx){
	std::cout<<"__func_init totalSlots:"<<totalSlots<<"******\n";
	std::cout<<"__func_init returnIdx:"<<returnIdx<<"******\n";
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	if(!initFlag){
		__init(totalSlots);
		initFlag = true;
	}
	frameIdx++;	
	frameCur[frameIdx] = totalSlots;
	curRetIdx = returnIdx; // current return index for this function, this function should copy its return index to curRetIdx
#if TIME
	gettimeofday(&tv2, NULL);
	funcInitTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" void __func_exit(size_t returnIndex){
	std::cout<<"__func_exit ******\n";
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	Real *returnReal = &(shadowStack[returnIndex]);
	mpfr_set(shadowStack[curRetIdx].mpfr_val, returnReal->mpfr_val, MPFR_RNDN);
	shadowStack[curRetIdx].initFlag = 1;
	std::cout<<"return copied from index:"<<returnIndex<<" to index:"<<curRetIdx<<"\n";
	frameIdx--;	
#if TIME
	gettimeofday(&tv2, NULL);
	funcExitTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 

#endif
/*
	while(worker.unsafe_size() > 0 || ready1.unsafe_size() > 0 || ready2.unsafe_size() > 0){
		printf("__func_exit waiting\n");
	}
*/
}

extern "C" void __handle_f_to_sint(size_t op1Int, long val, size_t lineNo){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	Real *real1 = &(shadowStack[op1Int]);
	long res = mpfr_get_si(real1->mpfr_val, MPFR_RNDN);
	if(res != val){
		fprintf (eFile, "convert mismatch %lu real: %ld float: %ld\n", lineNo, res, val);
		std::cout<<"convert mismatch  real:"<<res<<" float: \n"<<val<<"\n";
	}
#if TIME
	gettimeofday(&tv2, NULL);
	fToITime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

void handle_math_f(size_t funcCode, float op1, size_t op1Int, 
                                float computedRes, size_t insIndex){ 
  
  Real r1;

  mpfrInit++;
  bool mpfrFlag1 = false; 
  Real *real1 = &(shadowStack[op1Int]);
  if(op1Int == 0 || real1->initFlag == 0){
		mpfr_init2(r1.mpfr_val, PRECISION);
		mpfrInit++;
		mpfr_set_flt(r1.mpfr_val, op1, MPFR_RNDN);
		real1 = &r1;
		mpfrFlag1 = true; 
  }
	if(debug){
		printf("handleMathFuncF: op1Addr:%p funcCode:%lu computed op1:%e real op1:\n", (void *)op1Int, funcCode, op1);
  	printReal(real1->mpfr_val);
 	}
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        //std::cout<<"handleMathFunc: sqrt:\n";
        mpfr_sqrt(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 2: //floor
        //std::cout<<"handleMathFunc: floor:\n";
        mpfr_floor(shadowStack[insIndex].mpfr_val, real1->mpfr_val);
        break;
      case 3: //tan
        //std::cout<<"handleMathFunc: tan:\n";
        mpfr_tan(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 4: //sin
        //std::cout<<"handleMathFunc: sin:\n";
        mpfr_sin(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 5: //cos
        //std::cout<<"handleMathFunc: cos:\n";
        mpfr_cos(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 6: //atan
        //std::cout<<"handleMathFunc: atan:\n";
        mpfr_atan(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 8: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_abs(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 9: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_log(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 10: //asin
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_asin(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
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
	shadowStack[insIndex].initFlag = 1;
	
  if(debug){
		printf(" addr:%p\n", (void *)&shadowStack[insIndex]);
	}
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
  }
	updateErrorF(shadowStack[insIndex].mpfr_val, computedRes, insIndex);
}

void handle_math_d(size_t funcCode, double op1, size_t op1Int, 
                                double computedRes, size_t insIndex){ 
  Real r1;
  mpfrInit++;
  bool mpfrFlag1 = false; 
  Real *real1 = &(shadowStack[op1Int]);
  if(op1Int == 0 || real1->initFlag == 0){
		mpfr_init2(r1.mpfr_val, PRECISION);
		mpfrInit++;
		mpfr_set_d(r1.mpfr_val, op1, MPFR_RNDN);
		real1 = &r1;
		mpfrFlag1 = true; 
  }
	if(debug){
		printf("handleMathFuncD: op1Addr:%p funcCode:%lu computed op1:%e real op1:\n", (void *)op1Int, funcCode, op1);
  	printReal(real1->mpfr_val);
 	}
  if(real1 != NULL){
    switch(funcCode){
      case 1: //sqrt
        //std::cout<<"handleMathFunc: sqrt:\n";
        mpfr_sqrt(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 2: //floor
        //std::cout<<"handleMathFunc: floor:\n";
        mpfr_floor(shadowStack[insIndex].mpfr_val, real1->mpfr_val);
        break;
      case 3: //tan
        //std::cout<<"handleMathFunc: tan:\n";
        mpfr_tan(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 4: //sin
        //std::cout<<"handleMathFunc: sin:\n";
        mpfr_sin(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 5: //cos
        //std::cout<<"handleMathFunc: cos:\n";
        mpfr_cos(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 6: //atan
        //std::cout<<"handleMathFunc: atan:\n";
        mpfr_atan(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 8: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_abs(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 9: //atan
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_log(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
        break;
      case 10: //asin
        //std::cout<<"handleMathFunc: abs:\n";
        mpfr_asin(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
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
	shadowStack[insIndex].initFlag = 1;
	
  if(debug){
		printf(" addr:%p\n", (void *)&shadowStack[insIndex]);
	}
  if(mpfrFlag1){
    mpfr_clear(real1->mpfr_val);
    mpfrClear++;
  }
	updateError(shadowStack[insIndex].mpfr_val, computedRes, insIndex);
}

extern "C" void* __handle_math_f(size_t funcCode, float op1, size_t op1Int, 
                                float computedRes, size_t insIndex){ 
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif

#if MULTHITHREADED
	Compute *op = new Compute;
	op->opCode = funcCode;
	op->op1Addr = op1Int;
	op->op1d = op1;
	op->computedResf = computedRes;
	op->insIndex = insIndex;
	op->cmd = 4;

	worker.push(op);
#else
	handle_math_f(funcCode, op1, op1Int, 
								computedRes, insIndex);
#endif	
#if TIME
	gettimeofday(&tv2, NULL);
	mathFTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
	return &shadowStack[insIndex];
}

extern "C" void* __handle_math_d(size_t funcCode, double op1, size_t op1Int, 
                                double computedRes, size_t insIndex){ 
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif

#if MULTHITHREADED
	Compute *op = new Compute;
	op->opCode = funcCode;
	op->op1Addr = op1Int;
	op->op1d = op1;
	op->computedResd = computedRes;
	op->insIndex = insIndex;
	op->cmd = 3;

	worker.push(op);	
#else
	handle_math_d(funcCode, op1, op1Int, 
								computedRes, insIndex);
#endif	
#if TIME
	gettimeofday(&tv2, NULL);
	mathDTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
	return &shadowStack[insIndex];
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

void handle_select(size_t AddrInt, size_t insIndex, double op){
	Real *real1;
	real1 = &(shadowStack[AddrInt]);
	if(AddrInt == 0) {
		mpfr_set_d(shadowStack[insIndex].mpfr_val, op, MPFR_RNDN);
	}
	else if(real1->initFlag == 0)
		mpfr_set_d(shadowStack[insIndex].mpfr_val, op, MPFR_RNDN);
	else
		mpfr_set(shadowStack[insIndex].mpfr_val, real1->mpfr_val, MPFR_RNDN);
	if(debug){
		std::cout<<"handleSelect: set value in shadowStack at:"<<insIndex;
		printf(" for addr:%p\n", (void *)AddrInt);
	}
}
extern "C" void* __handle_select(void *Addr, size_t insIndex, double opd){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	size_t AddrInt = (size_t) Addr;
#if MULTHITHREADED
	Compute *op = new Compute;
	op->op1Addr = AddrInt;
	op->op1d = opd;
	op->insIndex = insIndex;
	op->cmd = 6;

	worker.push(op);	
#else
	handle_select(AddrInt, insIndex, opd);
#endif
#if TIME
	gettimeofday(&tv2, NULL);
	selectTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
	return &shadowStack[insIndex];
}

extern "C" void* __load_f(void *Addr, size_t insIndex, float opf, 
																						bool castFlag){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	size_t AddrInt = (size_t) Addr;
	struct Real* dest = getAddrIndex(AddrInt);
	if(debug){
			std::cout<<"fpSanLoadFromShadowMem: opf:"<<opf;
			printf(" from addr:%p\n", Addr);
	}
	if(dest->initFlag == 0){
		if(castFlag)
			mpfr_set_flt(shadowStack[insIndex].mpfr_val, 0, MPFR_RNDN);
		else
			mpfr_set_flt(shadowStack[insIndex].mpfr_val, opf, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[insIndex];
			std::cout<<"fpSanLoadFromShadowMemF: set value:";
			printReal( shadowStack[insIndex].mpfr_val);
			std::cout<<" in shadowStack at:"<<insIndex;;
			printf(" for addr:%p ", (void *)addr);
			std::cout<<" from op"<<"\n";
		}
	}
	else{
		mpfr_set(shadowStack[insIndex].mpfr_val, dest->mpfr_val, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[insIndex];
			std::cout<<"fpSanLoadFromShadowMemF: set value:";
			printReal( shadowStack[insIndex].mpfr_val);
			std::cout<<" in shadowStack at:"<<insIndex;
			printf(" for addr:%p ", (void *)addr);
			printf(" from addr:%p\n", Addr);
		}
	}
	shadowStack[insIndex].initFlag = 1;
#if TIME
	gettimeofday(&tv2, NULL);
	loadFTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
	return &shadowStack[insIndex];
}

extern "C" void* __load_d(void *Addr, size_t insIndex, double opd, 
																								bool castFlag){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	size_t AddrInt = (size_t) Addr;
	struct Real* dest = getAddrIndex(AddrInt);
	if(debug){
			std::cout<<"fpSanLoadFromShadowMem: opd:"<<opd;
			printf(" from addr:%p\n", Addr);
	}
	if(dest->initFlag == 0){
		if(castFlag)
			mpfr_set_d(shadowStack[insIndex].mpfr_val, 0, MPFR_RNDN);
		else
			mpfr_set_d(shadowStack[insIndex].mpfr_val, opd, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[insIndex];
			std::cout<<"fpSanLoadFromShadowMemD: set value:";
			printReal( shadowStack[insIndex].mpfr_val);
			std::cout<<" in shadowStack at:"<<insIndex;;
			printf(" for addr:%p ", (void *)addr);
			std::cout<<" from op"<<"\n";
		}
	}
	else{
		mpfr_set(shadowStack[insIndex].mpfr_val, dest->mpfr_val, MPFR_RNDN);
		if(debug){
			size_t addr = (size_t) &shadowStack[insIndex];
			std::cout<<"fpSanLoadFromShadowMemD: set value:";
			printReal( shadowStack[insIndex].mpfr_val);
			std::cout<<" in shadowStack at:"<<insIndex;
			printf(" for addr:%p ", (void *)addr);
			printf(" from addr:%p\n", Addr);
		}
	}
	shadowStack[insIndex].initFlag = 1;
#if TIME
	gettimeofday(&tv2, NULL);
	loadDTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
	return &shadowStack[insIndex];
}

int handleCmp(mpfr_t *op1, mpfr_t *op2){
	return mpfr_cmp(*op1, *op2); 
}
void check_branch(double op1, size_t op1Int, double op2, size_t op2Int, 
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
    real1 = &(shadowStack[op1Int]);
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
    real2 = &(shadowStack[op2Int]);
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
		//fprintf (eFile, " compare branch flipped @ %lu\n", lineNo);
		//print_trace ();
	}
	if(debug){
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
}

void setOperandsFloat(size_t opCode, size_t op1Addr, size_t op2Addr, 
												float op1f, float op2f, float computedResf, 
												size_t insIndex){
	Real *real1;
	Real *real2;
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
		real1 = &(shadowStack[op1Addr]);
		if(real1->initFlag == 0){
    	if(debugCR)
				std::cout<<"real1 is null\n"; //why?
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
		real2 = &(shadowStack[op2Addr]);
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
	//start_counter();	
  handleOp(opCode, &(shadowStack[insIndex].mpfr_val), &real1->mpfr_val, &real2->mpfr_val);
	//stop();
	shadowStack[insIndex].initFlag = 1;
	if(debugCR){
		std::cout<<"computeReal: stackTop:"<<insIndex;;
		printf(" addr %p:\n", (void *)&shadowStack[insIndex]);
	}
  if(mpfrFlag1){
    mpfr_clear(r1.mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(r2.mpfr_val);
    mpfrClear++;
  }
	updateErrorF(shadowStack[insIndex].mpfr_val, computedResf, insIndex);
}

void setOperandsDouble(size_t opCode, size_t op1Addr, size_t op2Addr, 
													double op1d, double op2d, double computedResd, 
														size_t insIndex){
	Real *real1;
	Real *real2;
  Real r1;
  Real r2;
  bool mpfrFlag1 = false;
  bool mpfrFlag2 = false;
	std::cout<<"setOperandsDouble: insIndex"<<insIndex<<" frameIdx:"<<frameIdx<<"\n";
	insIndex += frameIdx;
	std::cout<<"op1Addr:"<<op1Addr<<" op2Addr:"<<op2Addr<<"\n";
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
		real1 = &(shadowStack[op1Addr + frameIdx]);
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
		real2 = &(shadowStack[op2Addr + frameIdx]);
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
		std::cout<<"computeReal: op1Addr:"<<op1Addr<<" op1:"<<op1d<<" op2Addr:"<<op2Addr<<" op2:"<<op2d<<"\n";
  	printReal(real1->mpfr_val);
  	printReal(real2->mpfr_val);
	}
	if(real1 == NULL || real2 == NULL)
		std::cout<<"Error!!!!\n";
		
	//start_counter();	
  handleOp(opCode, &(shadowStack[insIndex].mpfr_val), &real1->mpfr_val, &real2->mpfr_val);
	//stop();

	shadowStack[insIndex].initFlag = 1;

	if(debugCR){
		std::cout<<"computeReal: stackTop:"<<insIndex;;
		printf(" addr %p:\n", (void *)&shadowStack[insIndex]);
	}
  if(mpfrFlag1){
    mpfr_clear(r1.mpfr_val);
    mpfrClear++;
  }
  if(mpfrFlag2){
    mpfr_clear(r2.mpfr_val);
    mpfrClear++;
  }
	updateError(shadowStack[insIndex].mpfr_val, computedResd, insIndex);
}

int isNaN(mpfr_t real){
  return mpfr_nan_p(real);
}

extern "C" void* __compute_real_f(size_t opCode, size_t op1Addr, size_t op2Addr,
                             float op1f, float op2f, float computedResf, size_t insIndex){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	
#if MULTHITHREADED
	Compute *op = new Compute;
	op->opCode = opCode;
	op->op1Addr = op1Addr;
	op->op2Addr = op2Addr;
	op->op1f = op1f;
	op->op2f = op2f;
	op->computedResf = computedResf;
	op->insIndex = insIndex;
	op->cmd = 1;
	worker.push(op);	
#else
	setOperandsFloat(opCode, op1Addr, op2Addr, 
												op1f, op2f, computedResf, insIndex);
	std::cout<<"not pushed  in worker\n";
#endif
#if TIME
	gettimeofday(&tv2, NULL);
	computeFTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
	return &shadowStack[insIndex];
}

extern "C" void __compute_real_d(size_t opCode, size_t op1Addr, size_t op2Addr, 
                      double op1d, double op2d, double computedResd, size_t insIndex){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif

#if MULTHITHREADED
	Compute *op = new Compute;
	op->opCode = opCode;
	op->op1Addr = op1Addr;
	op->op2Addr = op2Addr;
	op->op1d = op1d;
	op->op2d = op2d;
	op->computedResd = computedResd;
	op->insIndex = insIndex;
	op->cmd = 2;
	worker.push(op);	

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

#endif
#if TIME
	gettimeofday(&tv2, NULL);
	computeTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" bool __check_branch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            size_t fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
#if MULTHITHREADED
	Compute *op = new Compute;
	op->op1Addr = op1Int;
	op->op2Addr = op2Int;
	op->op1d = op1;
	op->op2d = op2;
	op->fcmpRes = computedRes;
	op->fcmpFlag = fcmpFlag;
	op->insIndex = insIndex;
	op->lineNo = lineNo;
	op->cmd = 5;
	worker.push(op);	
#else
	check_branch(op1, op1Int, op2, op2Int, 
               fcmpFlag, computedRes, insIndex, lineNo);
#endif
#if TIME
	gettimeofday(&tv2, NULL);
	checkBrTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
	return true;
}

extern "C" void* __handle_alloca(size_t index){
}
extern "C" void* __get_real_fun_arg(size_t index){
}

extern "C" void __set_real_fun_arg(size_t index, size_t funAddrInt, size_t toAddrInt, double op){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
#if TIME
	gettimeofday(&tv2, NULL);
	setRealFArgTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" void __set_real_cons_d(size_t toAddrInt, double value){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	if(debug){
		std::cout<<"setRealConstantD: set:"<<value;
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
	struct Real* dest = getAddrIndex(toAddrInt);
	mpfr_set_d(dest->mpfr_val, value, MPFR_RNDN);
	dest->initFlag = 1;
#if TIME
	gettimeofday(&tv2, NULL);
	setRealCDTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" void __set_real_cons_f(size_t toAddrInt, float value){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	struct Real* dest = getAddrIndex(toAddrInt);
	mpfrInitMap++;
	mpfr_set_flt(dest->mpfr_val, value, MPFR_RNDN);
	if(debug){
		std::cout<<"setRealConstantF: set:";
		printReal(dest->mpfr_val);
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
	dest->initFlag = 1;
#if TIME
	gettimeofday(&tv2, NULL);
	setRealCFTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

void set_real(size_t toAddrInt, size_t fromAddrInt, double op){
	Real* dest = getAddrIndex(toAddrInt);
	Real* real =  &(shadowStack[fromAddrInt]);
	if(real->initFlag == 0)
		mpfr_set_d(dest->mpfr_val, op, MPFR_RNDN);
	else
		mpfr_set(dest->mpfr_val, real->mpfr_val, MPFR_RNDN);
	dest->initFlag = 1;
	if(debug){
		std::cout<<"setRealTemp: dest->initFlag:"<<dest->initFlag<<"\n";
		std::cout<<"setRealTemp: dest set to:";
		printReal(dest->mpfr_val);
		printf("from: %ld", fromAddrInt);
		printf(" to addr:%p\n", (void *)toAddrInt);
	}
}

extern "C" void __set_real_return(size_t toAddrInt){
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


extern "C" void __set_real(size_t toAddrInt, size_t fromAddrInt, double op1){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
#if MULTHITHREADED
	Compute *op = new Compute;
	op->op1Addr = toAddrInt;
	op->op2Addr = fromAddrInt;
	op->op1d = op1;
	op->cmd = 7;
#else
	set_real(toAddrInt, fromAddrInt, op1);
#endif

#if TIME
	gettimeofday(&tv2, NULL);
	setRealTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" void __handle_calloc(size_t toAddrInt, size_t size1, size_t size2){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
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
#if TIME
	gettimeofday(&tv2, NULL);
	callocTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" void __handle_malloc(size_t toAddrInt, size_t size){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
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
#if TIME
	gettimeofday(&tv2, NULL);
	mallocTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" void __handle_memset(size_t toAddrInt, size_t val, size_t size){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	size_t tmp = 0;
	if(debug){
		printf("handleLLVMMemset to addr:%p val:%lu\n", (void *)toAddrInt, val);
		std::cout<<"handleLLVMMemset val:"<<val<<"\n";
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
#if TIME
	gettimeofday(&tv2, NULL);
	memsetTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

extern "C" void handleAlloca(size_t toAddrInt){
}

extern "C" void __handle_memcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
	size_t tmp = 0;
	struct Real* dest, *src;
	src = getAddrIndex(fromAddrInt);
	dest = getAddrIndex(toAddrInt);

	while(tmp < size ){ //handling only double
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
#if TIME
	gettimeofday(&tv2, NULL);
	memcpyTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
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
		if(bitsError>62){
			//print_trace ();
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
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
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
		if(bitsError>62){
			//print_trace ();
			//exit(0);
		}
//    printf("%f bits error (%llu ulps)\n",
 //               bitsError, ulpsError);
  std::map<size_t, struct ErrorAggregate*>::iterator it = errorMap.find(insIndex); 
  if (it != errorMap.end()){
    it->second = eagg; 
  } 
  errorMap.insert(std::pair<size_t, struct ErrorAggregate*>(insIndex, eagg)); 

#if TIME
	gettimeofday(&tv2, NULL);
	uErrorTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
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

extern "C" void __init(size_t totalSlots){
#if TIME
	struct timeval  tv1, tv2;
	gettimeofday(&tv1, NULL);
#endif
  if(!initFlag){
    initFlag = true;
    std::cout<<"init called\n";
    size_t length = MAX_STACK_SIZE * sizeof(struct Real);
    size_t memLen = SS_PRIMARY_TABLE_ENTRIES * sizeof(struct Real);
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
    __func_init(totalSlots, 0);

		std::cout<<"init1\n";	
  	// Create the threads
  //	pthread_create(&rdy, NULL, ready, NULL);
//  	pthread_create(&con, NULL, consumer, NULL);

 // 	pthread_create(&con1, NULL, consumer1, NULL);
//  	pthread_create(&con2, NULL, consumer2, NULL);
//  	pthread_create(&con3, NULL, consumer3, NULL);
//  	pthread_create(&con4, NULL, consumer4, NULL);

  	std::cout<<"thread created\n";

//#ifdef MULTITHREADED
  // Create the threads
  //  pthread_create(&con, NULL, consumer, NULL);
//    report<<"thread created\n";
//#endif
  }
#if TIME
	gettimeofday(&tv2, NULL);
	initTime += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec); 
#endif
}

#if MULTITHREADED
void* consumer(void *ptr) {
	Compute *op; 
	bool op1 = false;
	bool op2 = false;
	while(!consumerFlag || worker.unsafe_size() > 0){
				pthread_mutex_lock(&the_mutex);
			if(worker.try_pop(op) ) {
				count++;
				if(op->cmd == 6 || op->cmd == 3 || op->cmd == 4){
					Real *real1 = (Real *)op->op1Addr; 
					if(op->op1Addr == 0 || op->op1Addr == 1 || op->op1Addr == 2){
						op1 = true;
					}
			//		else{
				//		if(real1->initFlag){
					//		op1 = true;
					//	}
				//	}
					if(op1){
						if(count%2){
							ready1.push(op);	
						}
						else{
							ready2.push(op);	
						}
					}
					else{
						std::cout<<"pushing back to worker\n";
						worker.push(op);	
					}
				}
				else{
					Real *real1 = (Real *)op->op1Addr; 
					Real *real2 = (Real *)op->op2Addr; 
					if(op->op1Addr == 0 || op->op1Addr == 1 || op->op1Addr == 2){
						op1 = true;
					}
					else{
						if(real1->initFlag){
							op1 = true;
						}
					}
					if(op->op2Addr == 0|| op->op2Addr == 1 || op->op2Addr == 2){
						op2 = true;
					}
					else{
						if(real2->initFlag){
							op2 = true;
						}
					}
					if(op1 && op2){
						if(count%2){
							ready1.push(op);	
						}
						else{
							ready2.push(op);	
						}
					}
					else{
						std::cout<<"pushing back to worker\n";
						worker.push(op);	
					}
				}
			}
				pthread_mutex_unlock(&the_mutex);
		}	
	return NULL;
}

void* consumer1(void *ptr) {
	
	Compute *op; 
	while(!consumerFlag || ready1.unsafe_size() > 0){
				pthread_mutex_lock(&the_mutex);
	if(ready1.try_pop(op)){
			switch(op->cmd){
				case 1:
					setOperandsFloat(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1f, op->op2f, op->computedResf, op->insIndex);
					break;
				case 2:
					setOperandsDouble(op->opCode, op->op1Addr, op->op2Addr, 
												op->op1d, op->op2d, op->computedResd, op->insIndex);
					count1++;
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
				pthread_mutex_unlock(&the_mutex);
	}
	return NULL;
}

void* consumer2(void *ptr) {
	Compute *op; 
	while(!consumerFlag || ready2.unsafe_size() > 0){
				pthread_mutex_lock(&the_mutex);
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
				pthread_mutex_unlock(&the_mutex);
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
	consumerFlag = true;
	std::cout<<"Avg Instructions:"<<(double)sumIns/totalIns<<"\n";
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
*/
	std::cout<<"count:"<<count<<"\n";
	std::cout<<"count1:"<<count1<<"\n";
	std::cout<<"count2:"<<count2<<"\n";
	std::cout<<"count3:"<<count3<<"\n";
	std::cout<<"count4:"<<count4<<"\n";
	std::cout<<"count5:"<<count5<<"\n";
	std::cout<<"count6:"<<count6<<"\n";

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

