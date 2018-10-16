#include "handleReal.h"
#include <string.h>
#include <fstream>
#include <queue>
#include <iostream>
#include <stdlib.h>
#include <pthread.h>
#include <errno.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <asm/unistd.h>
#include <sys/syscall.h>
#include <stdlib.h>

/*TODO : 
1. Handle const in llvm - gsl-modpi.c
2. Clean up shadow
3. How to figure out memcpy of only double?
*/
//#define MULTITHREADED 
#define debug 1
#define debugTh 0
#define time 0
#define cycles 0

pthread_t con;
FILE *pFile = fopen ("error.out","w");  


static long
perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
                int cpu, int group_fd, unsigned long flags)
{
    int ret;
    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu,
                    group_fd, flags);
    return ret;
}

void start_count() {
  struct perf_event_attr pe;
  int fd;
  memset(&pe, 0, sizeof(struct perf_event_attr));
  pe.type = PERF_TYPE_HARDWARE;
  pe.size = sizeof(struct perf_event_attr);
  pe.config = PERF_COUNT_HW_CPU_CYCLES;
  pe.disabled = 1;
  pe.exclude_kernel = 0;
  pe.exclude_hv = 1;
  pe.exclude_idle = 1;
  fd = perf_event_open(&pe, 0, -1, -1, 0);
  if (fd == -1) {
    std::cout<<"Error start_count!!!";
  }
  perf_fds = fd;
  ioctl(fd, PERF_EVENT_IOC_RESET, 0);
  ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
}
size_t stop_n_get_count () {
long long count;
    ioctl(perf_fds, PERF_EVENT_IOC_DISABLE, 0);
    read(perf_fds, &count, sizeof(long long));

    close(perf_fds);
    return count;
}

int hashKey(int key){
    return key % MAX_SIZE;
}

size_t hashFind(size_t key){
	size_t hashIndex = key % MAX_SIZE;
	size_t tmp = funRetMap[hashIndex].key;
	struct FunRet *node = &(funRetMap[hashIndex]);
	while(node != NULL){
		if(node->key == key)
			return node->val;
		node = funRetMap[hashIndex].next;
	} 
	return 0;
}

void hashInsert(size_t key, size_t val){
	size_t hashIndex = key % MAX_SIZE;
	struct FunRet *node = &(funRetMap[hashIndex]);
	struct FunRet *newNode;
	std::cout<<"hashInsert: inserting key:"<<key<<" with val:"<<val<<"\n";
	std::cout<<"hashInsert: val:"<<node->val<<"\n";
	if(node->val == 0){
		
		std::cout<<"hashInsert: hashIndex:"<<hashIndex<<"\n";
		funRetMap[hashIndex].key = key;
		funRetMap[hashIndex].val = val;
		std::cout<<"hashInsert: val:"<<node->val<<"\n";
	}
	else if(node->key == key){
		std::cout<<"hasInsert: updating\n";
		funRetMap[hashIndex].val = val;
	}
	else{
		while(node->next != NULL){
			node = node->next;
		}
		if(node->next == NULL){
				std::cout<<"hashInsert: hashIndex collision"<<hashIndex<<"\n";
    		newNode = (struct FunRet *) mmap(0, 1, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
				newNode->key = key;
				newNode->val = val;
				node->next = newNode;	
				std::cout<<"hashInsert: collision val:"<<node->val<<"\n";
		}
	}
}
extern "C" size_t getAddr(void *Addr){
  size_t AddrInt = (size_t) Addr;
  return AddrInt;
}

extern "C" void addFunArg(size_t argNo, size_t funAddrInt, size_t argAddrInt){
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();

    std::map<size_t, size_t> data;
    data.insert(std::pair<size_t, size_t>(funAddrInt, argNo));
    std::map<std::map<size_t, size_t>, size_t>::iterator it = shadowFunArgMap.find(data); 

    if (it != shadowFunArgMap.end()){
        shadowFunArgMap.erase(it);
    }
    shadowFunArgMap.insert(std::pair<std::map<size_t, size_t>, size_t>(data, argAddrInt));
    if(cycles)
        recordAddFunArg += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        addFunArgTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }

}

extern "C" void funcInit(size_t funcAddrInt){
#ifdef MULTITHREADED
		//if(debugTh)
			//std::cout<<"producer funcInit: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
		while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
			if(debugTh)
				std::cout<<"producer funcInit :buffer is full\n";
			sleep(0);
		}
		if(debugTh)
			std::cout<<"producer funcInit: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
		buffer[bufIdxEnd].funcAddrInt = funcAddrInt;	
		buffer[bufIdxEnd].cmd = 1;	
		advance(&bufIdxEnd);
		if(debugTh)
			std::cout<<"producer: process object with cmd:"<<1<<"\n";
#else
	fInit(funcAddrInt);
#endif
}

extern "C" void funcExit(size_t funcAddrInt, size_t returnIdx){
	//funRetMap[funcAddrInt] = returnIdx;
	hashInsert(funcAddrInt, returnIdx);
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
			std::cout<<"producer funcExit :buffer is full\n";
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer funcExit: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].funcAddrInt = funcAddrInt;	
	buffer[bufIdxEnd].returnIdx = returnIdx;	
	buffer[bufIdxEnd].cmd = 2;	
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<2<<"\n";
#else
	fExit(funcAddrInt, returnIdx);
#endif
}

extern "C" size_t handleMathFunc(size_t funcCode, double op1, size_t op1Idx, 
                                                double computedRes, size_t insIndex){ 
	size_t newRegIdx = getRegRes(insIndex);
	if(!newRegIdx){
		newRegIdx = getNewRegIndex();
		addRegRes(insIndex, newRegIdx);
	}
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
		std::cout<<"producer handleMathFunc :buffer is full\n";
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer handleMathFunc: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].funcCode = funcCode;
	buffer[bufIdxEnd].op1Idx = op1Idx;
	buffer[bufIdxEnd].op1d = op1;
	buffer[bufIdxEnd].computedRes = computedRes;
	buffer[bufIdxEnd].insIndex = insIndex;
	buffer[bufIdxEnd].cmd = 3;
	buffer[bufIdxEnd].newRegIdx = newRegIdx;	
	advance(&bufIdxEnd);	
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<3<<"\n";
#else
	handleMath(funcCode, op1, op1Idx, computedRes, insIndex, newRegIdx);
#endif
    return newRegIdx;
}

extern "C" size_t handleMathFunc3Args(size_t funcCode, double op1, size_t op1Int,
                                                double op2, size_t op2Int,
                                                double op3, size_t op3Int,
                                                double computedRes, size_t insIndex){ 
	size_t newRegIdx = getRegRes(insIndex);
	if(!newRegIdx){
		newRegIdx = getNewRegIndex();
		addRegRes(insIndex, newRegIdx);
	}
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
			std::cout<<"producer handleMathFunc3Args :buffer is full\n";
	}
	if(debugTh)
		std::cout<<"producer handleMathFunc3Args: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].funcCode = funcCode;
	buffer[bufIdxEnd].op1Idx = op1Int;
	buffer[bufIdxEnd].op1d = op1;
	buffer[bufIdxEnd].op2Idx = op2Int;
	buffer[bufIdxEnd].op2d = op2;
	buffer[bufIdxEnd].op3Idx = op3Int;
	buffer[bufIdxEnd].op3d = op3;
	buffer[bufIdxEnd].computedRes = computedRes;
	buffer[bufIdxEnd].insIndex = insIndex;
	buffer[bufIdxEnd].cmd = 4;
	buffer[bufIdxEnd].newRegIdx = newRegIdx;	
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<4<<"\n";
#else
	handleMath3Args(funcCode, op1, op1Int, op2, op2Int, op3, op3Int, computedRes, insIndex, newRegIdx);
#endif
	return newRegIdx;
}

extern "C" size_t computeReal(size_t opCode, size_t op1Idx, size_t op2Idx, float op1f, float op2f, 
								double op1d, double op2d, double computedRes,
                                    size_t typeId, size_t insIndex){
	
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    size_t newRegIdx = getRegRes(insIndex);
    if(!newRegIdx){
        newRegIdx = getNewRegIndex();
        addRegRes(insIndex, newRegIdx);
    }
    if(time){
        gettimeofday(&tv2, NULL);
        realTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh){
			std::cout<<"producer computeReal: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
			std::cout<<"producer computeReal :buffer is full\n";
		}
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer computeReal: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].opCode = opCode;
	buffer[bufIdxEnd].op1Idx = op1Idx;
	buffer[bufIdxEnd].op2Idx = op2Idx;
	buffer[bufIdxEnd].op1f = op1f;
	buffer[bufIdxEnd].op2f = op2f;
	buffer[bufIdxEnd].op1d = op1d;
	buffer[bufIdxEnd].op2d = op2d;
	buffer[bufIdxEnd].computedRes = computedRes;
	buffer[bufIdxEnd].typeId = typeId;
	buffer[bufIdxEnd].insIndex = insIndex;
	buffer[bufIdxEnd].cmd = 5;
	buffer[bufIdxEnd].newRegIdx = newRegIdx;
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<5<<"\n";
#else 
	computeR(opCode, op1Idx, op2Idx, op1f, op2f, op1d, op2d, computedRes, typeId, insIndex, newRegIdx);
#endif
    return newRegIdx;
}


extern "C" void checkBranch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            int fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
			std::cout<<"producer checkBranch: buffer is full\n";
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer checkBranch: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].op1Idx = op1Int;
	buffer[bufIdxEnd].op2Idx = op2Int;
	buffer[bufIdxEnd].op1d = op1;
	buffer[bufIdxEnd].op2d = op2;
	buffer[bufIdxEnd].fcmpFlag = fcmpFlag;
	buffer[bufIdxEnd].computedRes = computedRes;
	buffer[bufIdxEnd].insIndex = insIndex;
	buffer[bufIdxEnd].lineNo = lineNo;
	buffer[bufIdxEnd].cmd = 6;
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<6<<"\n";
#else
    compareBranch(op1, op1Int, op2, op2Int, fcmpFlag, computedRes, insIndex, lineNo);
#endif
}

extern "C" size_t setRealReg(size_t index, double value){
 
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
			std::cout<<"producer setRealReg :buffer is full\n";
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer setRealReg: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].op1Idx = index;
	buffer[bufIdxEnd].op1d = value;
	buffer[bufIdxEnd].cmd = 7;
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<7<<"\n";
#else 
	setReal(index, value);
#endif
	return index;
}

extern "C" size_t getRealFunArg(size_t index, size_t funAddrInt){
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
    std::vector<size_t>::iterator it; 
    std::map<size_t, size_t> shadowAddrMap;
    size_t shadowAddr = 0;
    shadowAddrMap.insert(std::pair<size_t, size_t>(funAddrInt, index));
    if(shadowFunArgMap.count(shadowAddrMap) != 0){ 
        shadowAddr = shadowFunArgMap.at(shadowAddrMap);
    }
    if(cycles)
        recordGetRealFunArg += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        getRealFunArgTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
    return shadowAddr;
}

//TODO
extern "C" void setRealFunArg(size_t shadowAddr, size_t toAddrInt, double value){
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
			std::cout<<"producer setRealFunArg :buffer is full\n";
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer setRealFunArg: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].shadowAddr = shadowAddr;
	buffer[bufIdxEnd].toAddrInt = toAddrInt;
	buffer[bufIdxEnd].op1d = value;
	buffer[bufIdxEnd].cmd = 11;
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<11<<"\n";
#else 
	setFunArg(shadowAddr, toAddrInt, value);
#endif
}

extern "C" size_t getRealReturn(size_t funAddrInt){

  struct timeval  tv1, tv2;
  if(time){
      gettimeofday(&tv1, NULL);
  }
  if(cycles)       
		start_count();
	size_t val = hashFind(funAddrInt);
/*	
	if(funRetMap[funAddrInt] != 0){
		idx = funRetMap[funAddrInt];
  }
*/
	if(val == 0)
		if(debug)
			std::cout<<"getRealReturn: Error !!!! return value not found in funRetMap\n";
  if(cycles)
		recordGetRealReturn += stop_n_get_count();  
  if(time){
		gettimeofday(&tv2, NULL);
		getRealReturnTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
	}
	return val;
}

extern "C" void setRealReturn(size_t toAddrInt){
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
			std::cout<<"producer setRealReturn :buffer is full\n";
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer setRealReturn: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].toAddrInt = toAddrInt;
	buffer[bufIdxEnd].cmd = 8;
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<8<<"\n";
#else
	setReturn(toAddrInt);
#endif
}

extern "C" void setRealTemp(size_t toAddrInt, size_t fromAddrInt, double val){
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
			std::cout<<"producer setRealTemp :buffer is full\n";
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer setRealTemp: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].toAddrInt = toAddrInt;
	buffer[bufIdxEnd].fromAddrInt = fromAddrInt;
	buffer[bufIdxEnd].op1d = val;
	buffer[bufIdxEnd].cmd = 9;
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<9<<"\n";
#else
	setTemp(toAddrInt, fromAddrInt, val);
#endif
}

extern "C" void handleLLVMMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
#ifdef MULTITHREADED
	while((bufIdxEnd + 1) % BUFLEN == bufIdxBgn){
		if(debugTh)
			std::cout<<"producer handleLLVMMemcpy :buffer is full\n";
		sleep(0);
	}
	if(debugTh)
		std::cout<<"producer handleLLVMMemcpy: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
	buffer[bufIdxEnd].toAddrInt = toAddrInt;
	buffer[bufIdxEnd].fromAddrInt = fromAddrInt;
	buffer[bufIdxEnd].size = size;
	buffer[bufIdxEnd].cmd = 10;
	advance(&bufIdxEnd);
	if(debugTh)
		std::cout<<"producer: process object with cmd:"<<10<<"\n";
#else
	handleMemcpy(toAddrInt, fromAddrInt, size);
#endif
}

extern "C" size_t handleExtractValue(size_t idx, size_t funAddrInt){
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
	if(debug)
	    std::cout<<"handleExtractValue: idx:"<<idx<<"\n";
/*
	if(funRetMap[funAddrInt] != 0){
		shadowIdx = funRetMap[funAddrInt];
		if(debug)
			std::cout<<"handleExtractValue:"<< shadowIdx + idx * sizeof(double)<<"\n";
	}
*/
	size_t shadowIdx = hashFind(funAddrInt);
    if(cycles)
        recordHandleExtractValue += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        handleExtractValueTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
    
	return shadowIdx + idx * sizeof(double); //TODO: handling just double, generate error for other cases
}

extern "C" void init(){
	initMain();
}

extern "C" void finish(){
#ifdef MULTITHREADED
	consumerFlag = true;
	std::cout<<"finish join\n";
	pthread_join(con, NULL);	
#endif
	std::cout<<"alloced:"<<alocced<<"\n";
	std::cout<<"freed:"<<freed<<"\n";
/*
	for (std::list<struct MyShadow*>::iterator it=varTrack.begin(); it!=varTrack.end(); ++it){
    if((*it)->real != NULL){
      mpfr_clear((*it)->real->mpfr_val);
      mpfrClear++;
      delete (*it)->real;
    }
    delete (*it);
  }
*/
//    for (std::list<struct MyShadow*>::iterator it=varTrack.begin(); it!=varTrack.end(); ++it){
//        it = varTrack.erase(it);
 //   }
    std::cout<<"list:";
    std::cout<<"mpfrInit:"<<mpfrInit<<"\n";
    std::cout<<"mpfrClear:"<<mpfrClear<<"\n";
	std::cout<<"totalCompute:"<<totalCompute<<"\n";

     std::cout<<"cycles spent in each handler****\n";
  if(recordAddFunArg)
    std::cout<<"addFunArg:"<<recordAddFunArg<<"\n";
  if(recordFInit)
    std::cout<<"funcInit:"<<recordFInit<<"\n";
  if(recordFExit)
    std::cout<<"funcExit:"<<recordFExit<<"\n";
  if(recordHandleMath)
    std::cout<<"handleMathFunc:"<<recordHandleMath<<"\n";
  if(recordHandleMath3)
    std::cout<<"handleMathFunc3:"<<recordHandleMath3<<"\n";
  if(recordComputeR > 0)
    std::cout<<"computeReal:"<<recordComputeR<<"\n";
  if(recordCmpBranch)
    std::cout<<"checkBranch:"<<recordCmpBranch<<"\n";
  if(recordSetReal)
    std::cout<<"setRealReg:"<<recordSetReal<<"\n";
  if(recordGetRealFunArg)
    std::cout<<"getRealFunArg:"<<recordGetRealFunArg<<"\n";
  if(recordSetFunArg)
    std::cout<<"setRealFunArg:"<<recordSetFunArg<<"\n";
  if(recordGetRealReturn)
    std::cout<<"getRealReturn:"<<recordGetRealReturn<<"\n";
  if(recordSetReturn)
    std::cout<<"setRealReturn:"<<recordSetReturn<<"\n";
  if(recordSetTemp)                  
     std::cout<<"setRealTemp:"<<recordSetTemp<<"\n";
  if(recordHandleMemcpy)
    std::cout<<"handleLLVMMemcpy:"<<recordHandleMemcpy<<"\n";
  if(recordHandleExtractValue)
    std::cout<<"handleExtractValue:"<<recordHandleExtractValue<<"\n";
  std::cout<<"time spent in each handler*****\n";
  if(realTT)
    std::cout<<"realTT:"<<realTT<<"\n";
  if(addFunArgTT)
    std::cout<<"addFunArg:"<<addFunArgTT<<"\n";
  if(fInitTT)
    std::cout<<"funcInit:"<<fInitTT<<"\n";
  if(fExitTT)
    std::cout<<"funcExit:"<<fExitTT<<"\n";
  if(handleMathTT)
    std::cout<<"handleMathFunc:"<<handleMathTT<<"\n";
  if(handleMath3TT)
    std::cout<<"handleMathFunc3:"<<handleMath3TT<<"\n";
  if(computeRTT)
    std::cout<<"computeReal:"<<computeRTT<<"\n";
  if(computeRTT1)
    std::cout<<"computeReal1:"<<computeRTT1<<"\n";
  if(cmpBranchTT)
    std::cout<<"checkBranch:"<<cmpBranchTT<<"\n";
  std::cout<<"setRealTT:"<<setRealTT<<"\n";
  if(setRealTT)
    std::cout<<"setRealReg:"<<setRealTT<<"\n";
  if(getRealFunArgTT)
    std::cout<<"getRealFunArg:"<<getRealFunArgTT<<"\n";
  if(setFunArgTT)
    std::cout<<"setRealFunArg:"<<setFunArgTT<<"\n";
  if(getRealReturnTT)
    std::cout<<"getRealReturn:"<<getRealReturnTT<<"\n";
  if(setReturnTT)    
     std::cout<<"setRealReturn:"<<setReturnTT<<"\n";
  if(setTempTT)
    std::cout<<"setRealTemp:"<<setTempTT<<"\n";
  if(handleMemcpyTT)
    std::cout<<"handleLLVMMemcpy:"<<handleMemcpyTT<<"\n";
  if(handleExtractValueTT)
    std::cout<<"handleExtractValue:"<<handleExtractValueTT<<"\n";

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

int isNaN(Real *real){
  return mpfr_nan_p(real->mpfr_val);                                                            
}

Real* getReal(size_t AddrInt){
	//for (std::list<struct MyShadow*>::reverse_iterator rit=varTrack.rbegin(); rit!=varTrack.rend(); ++rit){
	for (size_t top = stackIdx-1; top > 0; top--){
  	    if(currentFunc == shdStack[top].key){
			return NULL;
		}
  	    if(AddrInt == shdStack[top].key){
			return shdStack[top].real;	
	    }
	}
    return NULL;
}

void addRegRes(size_t insIndex, size_t resRegIndex){
//    insMap.insert(std::pair<size_t,size_t>(insIndex, resRegIndex));
    
	insMap[insIndex] = resRegIndex;
}

size_t getRegRes(size_t insIndex){
    if(insMap[insIndex] != 0){ 
        size_t resRegIndex = insMap[insIndex];
        return resRegIndex;
    }
    return 0;
}

size_t getNewRegIndex(){
    regIndex += 1;
    return regIndex;
}

void printStack(){
	//for (std::list<struct MyShadow*>::reverse_iterator rit=varTrack.rbegin(); rit!=varTrack.rend(); ++rit){
//		std::cout<<(*rit)->key<<"\n";
//	}
}

struct MyShadow* existInStack(size_t key){
	for (size_t top = stackIdx-1; top > 0; top--){
  	    if(currentFunc == shdStack[top].key){
			return NULL;
		}
  	    if(key == shdStack[top].key){
			return &shdStack[top];	
	    }
	}
	return NULL;
}

void handleMath(size_t funcCode, double op1, size_t op1Int, 
                          double computedRes, size_t insIndex, size_t newRegIdx){ 
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
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
#if 1 
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
    #endif
	MyShadow *shadow = existInStack(newRegIdx);
	if(shadow == NULL){
        shdStack[stackIdx].key = newRegIdx;
        shdStack[stackIdx].real = real_res;
        stackIdx++;
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
    if(cycles)
        recordHandleMath += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        handleMathTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}

void handleMath3Args(size_t funcCode, double op1, size_t op1Int,
                                                double op2, size_t op2Int,
                                                double op3, size_t op3Int,
                                                double computedRes, size_t insIndex, size_t newRegIdx){ 
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();

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
  
#if 1
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
#endif
	MyShadow *shadow = existInStack(newRegIdx);
	if(shadow == NULL){
        shdStack[stackIdx].key = newRegIdx;
        shdStack[stackIdx].real = real_res;
        stackIdx++;
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
    if(cycles)
        recordHandleMath3 += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        handleMath3TT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
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
        std::cout<<"Error !!! op not found\n";
      // do nothing
      break;
  } 
}

void computeR(size_t opCode, size_t op1Idx, size_t op2Idx, float op1f, float op2f,
                                    double op1d, double op2d, double computedRes,
                                    size_t typeId, size_t insIndex, size_t newRegIdx){
    struct timeval  tv1, tv2;
    struct timeval  t1, t2;
    if(cycles)
        start_count();
	totalCompute++;	
	double op1, op2;

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
	
    bool mpfrFlag1 = false;
    bool mpfrFlag2 = false;
    Real *real1;
    Real *real2;

    struct Real* real_res = new Real;
    if(debug){
		std::cout<<"computeReal op1Idx:"<<op1Idx<<" op1:"<<op1<<"\n";	
		std::cout<<"computeReal op2Idx:"<<op2Idx<<" op2:"<<op2<<"\n";
    }
    if(time){
        gettimeofday(&t1, NULL);
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
    if(time){
        gettimeofday(&t2, NULL);
        computeRTT1 += (double) (t2.tv_usec - t1.tv_usec) / 1000000 +
                        (double) (t2.tv_sec - t1.tv_sec);
    }
    mpfr_init2 (real_res->mpfr_val, PRECISION); 
    mpfrInit++;

    handleOp(opCode, &(real_res->mpfr_val), &(real1->mpfr_val), &(real2->mpfr_val));
    if(time){
        gettimeofday(&tv1, NULL);
    }
		MyShadow *shadow = existInStack(newRegIdx);
    if(time){
        gettimeofday(&tv2, NULL);
        computeRTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
	if(shadow == NULL){
        shdStack[stackIdx].key = newRegIdx;
        shdStack[stackIdx].real = real_res;
        stackIdx++;
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
    if(cycles)
        recordComputeR += stop_n_get_count();  
}
void fInit(size_t funcAddrInt){ 
    struct timeval  tv1, tv2;
    if(time){                                                                                        
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
 
    currentFunc = funcAddrInt;
    shdStack[stackIdx].key = funcAddrInt;
    stackIdx++;
    if(cycles)
        recordFInit += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        fInitTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}
/*
void fExit(size_t funcAddrInt, size_t returnIdx){
  struct MyShadow *shadow = NULL;
  struct MyShadow *newShadow = NULL;
  if(debug)
    std::cout<<"funcExit:"<<returnIdx<<"\n";
  retTrack.push(returnIdx);
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
*/
void fExit(size_t funcAddrInt, size_t returnIdx){
    struct timeval  tv1, tv2;
    if(time){                                                                                        
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();

    struct MyShadow *shadow = NULL;
    struct MyShadow *newShadow = NULL;
    if(debug)
        std::cout<<"funcExit:"<<returnIdx<<"\n";
    retTrack[retIdx] = returnIdx;
    retIdx++;

    while(stackIdx > 0){
        shadow = &shdStack[stackIdx-1];
        if(shadow->key == funcAddrInt){
            stackIdx--;    
            if(newShadow != NULL){
            shdStack[stackIdx].key = newShadow->key;
            shdStack[stackIdx].real = newShadow->real;
            stackIdx++;    
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
//    delete shadow;
    stackIdx--;    
  }
    if(cycles)
        recordFExit += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        fExitTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}


void compareBranch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            int fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){

    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
    Real *real1;
    Real *real2;

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
    if(cycles)
        recordCmpBranch += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        cmpBranchTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}

void setReal(size_t index, double value){
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
                                                                                                                                
    MyShadow *shadow = existInStack(index);
    if(shadow == NULL){
        struct Real* real = new Real;
        mpfr_init2(real->mpfr_val, PRECISION);
        mpfrInit++;
        mpfr_set_d(real->mpfr_val, value, MPFR_RNDN);
        shdStack[stackIdx].key = index;
        shdStack[stackIdx].real = real;
        stackIdx++;    
        if(debug)
            std::cout<<"setRealReg insert shadow stack::"<<index<<"\n";
    }
    if(cycles)
        recordSetReal += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        setRealTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}

void setFunArg(size_t shadowAddr, size_t toAddrInt, double op){
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
    if(shadowAddr != 0){ 
        MyShadow *shadow = existInStack(shadowAddr);
        if(shadow == NULL){
            struct Real* real = new Real;
            mpfr_init2(real->mpfr_val, PRECISION);
            mpfrInit++;
            mpfr_set_d(real->mpfr_val, op, MPFR_RNDN);
            shdStack[stackIdx].key = toAddrInt;
            shdStack[stackIdx].real = real;
            stackIdx++;    
            if(debug)
                std::cout<<"setRealFunArg insert shadow stack::"<<toAddrInt<<"\n";
        }
		else{//just update the value in stack
            struct Real* toReal = new Real;
            mpfr_init2(toReal->mpfr_val, PRECISION);
            mpfrInit++;
            mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDD);
            shdStack[stackIdx].key = toAddrInt;
            shdStack[stackIdx].real = toReal;
            stackIdx++;    

            if(debug)
                std::cout<<"setRealFunArg update from:"<<shadow->key<<" to :"<<toAddrInt<<"\n";
        }
    }
    else{
        if(debug)
            std::cout<<"setRealFunArg Error !!! Argument not found\n";
    }
    if(cycles)
        recordSetFunArg += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        setFunArgTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}

void setReturn(size_t toAddrInt){
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
		std::cout<<"retIdx:"<<retIdx<<"\n";
    if(retIdx){
        size_t idx = retTrack[retIdx-1];
        retIdx--;
        MyShadow *shadow = existInStack(idx);
        if(shadow != NULL){//just update the value in stack
            struct Real* toReal = new Real;
            mpfr_init2(toReal->mpfr_val, PRECISION);
            mpfrInit++;
            mpfr_set(toReal->mpfr_val, shadow->real->mpfr_val, MPFR_RNDD);
            shdStack[stackIdx].key = toAddrInt;
            shdStack[stackIdx].real = toReal;
            stackIdx++;    
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
    
    if(cycles)
        recordSetReturn += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        setReturnTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}

void setTemp(size_t toAddrInt, size_t fromAddrInt, double op){
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
    MyShadow *fromShadow = existInStack(fromAddrInt);
    MyShadow *toShadow = existInStack(toAddrInt);

    if(fromShadow != NULL){
      if(toShadow == NULL){
        struct Real* toReal = new Real;
        mpfr_init2(toReal->mpfr_val, PRECISION);
        mpfrInit++;
        mpfr_set(toReal->mpfr_val, fromShadow->real->mpfr_val, MPFR_RNDN);
        shdStack[stackIdx].key = toAddrInt;
        shdStack[stackIdx].real = toReal;
            stackIdx++;    
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
        shdStack[stackIdx].key = toAddrInt;
        shdStack[stackIdx].real = toReal;
            stackIdx++;    
    if(debug)
      std::cout<<"setRealTemp insert:"<<op<<" shadow stack to:"<<toAddrInt<<"\n";
  }
    if(cycles)
        recordSetTemp += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        setTempTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}

void handleMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
    struct timeval  tv1, tv2;
    if(time){
        gettimeofday(&tv1, NULL);
    }
    if(cycles)
        start_count();
    size_t tmp = 0;                                                                                                               
    while(size != tmp){ //handling only double
        setTemp(toAddrInt+tmp, fromAddrInt+tmp, 0);
        tmp += 8;
    }
    if(cycles)
        recordHandleMemcpy += stop_n_get_count();  
    if(time){
        gettimeofday(&tv2, NULL);
        handleMemcpyTT += (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
                        (double) (tv2.tv_sec - tv1.tv_sec);
    }
}

void initMain(){
    size_t length = MAX_STACK_SIZE * sizeof(struct MyShadow);
    size_t len = MAX_SIZE * sizeof(struct FunRet);
    size_t len1 = BUFLEN * sizeof(struct ComputeR);
    shdStack = (struct MyShadow*) mmap(0, length, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    buffer = (struct ComputeR*) mmap(0, len1, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    funRetMap = (struct FunRet *) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    insMap = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    retTrack = (size_t*) mmap(0, len, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    assert (shdStack != (void*)-1);
		shdStack[0].key = 1;
#ifdef MULTITHREADED
  // Create the threads
		pthread_create(&con, NULL, consumer, NULL);
    std::cout<<"thread created\n";
#endif
}
/*
static inline int advance(volatile size_t *idx)
{
	size_t oldIdx, newIdx;
	newIdx = (oldIdx + 1) % BUFLEN;
	oldIdx = __sync_lock_test_and_set(idx, newIdx);
	return oldIdx;
}
*/
static inline int advance(volatile size_t *idx)
{
	size_t oldIdx, newIdx;
	do
	{
		oldIdx = *idx;
		newIdx = (oldIdx + 1) % BUFLEN;
	} while(!__sync_bool_compare_and_swap(idx, oldIdx, newIdx));
	return oldIdx;
}


//TODO: why operands can not be uplifted to double? 
//Do i need to pass computedRes in float as well?
void* consumer(void *ptr) {
	std::cout<<"thread enter\n";
	ComputeR *op; 
	size_t opCode;
	size_t op1Idx; 
	size_t op2Idx; 
	size_t op3Idx; 
	float op1f;
	float op2f; 
	double op1d; 
	double op2d; 
	double op3d; 
	double computedRes;
	size_t typeId;
	size_t insIndex;
	size_t newRegIdx;
	size_t funcAddrInt;
	size_t returnIdx; 
	size_t cmd;
	size_t funcCode;
	size_t fcmpFlag;
	size_t lineNo;
	size_t toAddrInt;
	size_t fromAddrInt;
	size_t size;
	size_t shadowAddr;

	while(true){
		if(debugTh)
			std::cout<<"consumer: bufIdxEnd - bufIdxBgn:"<<bufIdxEnd - bufIdxBgn<<"\n";
		while(bufIdxEnd == bufIdxBgn){
			if(consumerFlag){
				std::cout<<"consumer:exiting\n";
				pthread_exit(0);
			}
			sleep(0);
		}
		size_t index = advance(&bufIdxBgn);
		op = &buffer[index];
		cmd = op->cmd;
		if(debugTh){
				std::cout<<"consumer: process object with cmd:"<<cmd<<"\n";
			std::cout<<"consumer: bufIdxEnd:"<<bufIdxEnd<<" bufIdxBgn:"<<bufIdxBgn<<"\n";
		}
			switch(cmd){
				case 1:
						funcAddrInt = op->funcAddrInt;
						fInit(funcAddrInt);	
						break;
				case 2:
						funcAddrInt = op->funcAddrInt;
						returnIdx = op->returnIdx;
						fExit(funcAddrInt, returnIdx);
						break;
				case 3:
						funcCode = op->funcCode;
						op1d = op->op1d;	
						op1Idx = op->op1Idx;
						computedRes = op->computedRes;
						insIndex = op->insIndex;
						newRegIdx = op->newRegIdx;
						handleMath(funcCode, op1d, op1Idx, computedRes, insIndex, newRegIdx);
						break;
				case 4:
						funcCode = op->funcCode;
						op1Idx = op->op1Idx;
						op1d = op->op1d;
						op2Idx = op->op2Idx;
						op2d = op->op2d;
						op3Idx = op->op3Idx;
						op3d = op->op3d;
						computedRes = op->computedRes;
						insIndex = op->insIndex;
						newRegIdx = op->newRegIdx;
						handleMath3Args(funcCode, op1d, op1Idx, op2d, op2Idx, op3d, op3Idx, computedRes, insIndex, newRegIdx);
						break;
				case 5:
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
						computeR(opCode, op1Idx, op2Idx, op1f, op2f, op1d, op2d, computedRes, typeId, insIndex, newRegIdx);
						break;
				case 6:
						op1Idx = op->op1Idx;
						op2Idx = op->op2Idx;
						op1d = op->op1d;
						op2d = op->op2d;
						fcmpFlag = op->fcmpFlag;
						computedRes = op->computedRes;
						insIndex = op->insIndex;
						lineNo = op->lineNo;
						compareBranch(op1d, op1Idx, op2d, op2Idx, fcmpFlag, computedRes, insIndex, lineNo);
						break;
				case 7:
						op1Idx = op->op1Idx;
						op1d = op->op1d;
						setReal(op1Idx, op1d);
						break;
				case 8:
						toAddrInt = op->toAddrInt;
						setReturn(toAddrInt);
						break;
				case 9:
						toAddrInt = op->toAddrInt;
						fromAddrInt = op->fromAddrInt;
						op1d = op->op1d;
						setTemp(toAddrInt, fromAddrInt, op1d);
						break;
				case 10:
						toAddrInt = op->toAddrInt;
						fromAddrInt = op->fromAddrInt;
						size = op->size;
						handleMemcpy(toAddrInt, fromAddrInt, size);
						break;
				case 11: 
						shadowAddr = op->shadowAddr;
						toAddrInt = op->toAddrInt;
						op1d = op->op1d;
						setFunArg(shadowAddr, toAddrInt, op1d);
						break;
				default: 
						std::cout<<"Error !!! unknown operation\n";
			}
	}
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


