#include "handlers.h"
#include "common.h"
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
#define MULTITHREADED 0
#define debug 0


extern "C" size_t getAddr(void *Addr){
  size_t AddrInt = (size_t) Addr;
  return AddrInt;
}
#if 0
extern "C" void addFunArg(size_t argNo, size_t funAddrInt, size_t argAddrInt){
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->argNo = argNo;
	op->funAddrInt = funAddrInt;
	op->argAddrInt = argAddrInt;

	pthread_mutex_lock(&the_mutex);
	buffer.push(op);	
	pthread_cond_signal(&condc);
	std::cout<<"producer buffer size:"<<buffer.size()<<"\n";
	pthread_mutex_unlock(&the_mutex);
#else
	funArgMap(size_t argNo, size_t funAddrInt, size_t argAddrInt);
#endif
}
#endif

extern "C" void addFunArg(size_t argNo, size_t funAddrInt, size_t argAddrInt){
	std::map<size_t, size_t> data;
  data.insert(std::pair<size_t, size_t>(funAddrInt, argNo));
  std::map<std::map<size_t, size_t>, size_t>::iterator it = shadowFunArgMap.find(data); 

  if (it != shadowFunArgMap.end()){
    shadowFunArgMap.erase(it);
  }
  shadowFunArgMap.insert(std::pair<std::map<size_t, size_t>, size_t>(data, argAddrInt));
}

extern "C" void funcInit(size_t funcAddrInt){
	
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->funcAddrInt = funcAddrInt;
	op->cmd = 1; //fInit 1
	pthread_mutex_lock(&the_mutex);
	buffer.push(op);	
	pthread_cond_signal(&condc);
	std::cout<<"producer buffer size:"<<buffer.size()<<"\n";
	pthread_mutex_unlock(&the_mutex);
#else
	fInit(funcAddrInt);
#endif
}

extern "C" void funcExit(size_t funcAddrInt, size_t returnIdx){
	funRetMap.insert(std::pair<size_t, size_t>(funcAddrInt, returnIdx));
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->funcAddrInt = funcAddrInt;
	op->returnIdx = returnIdx;
	op->cmd = 2;
	pthread_mutex_lock(&the_mutex);
	buffer.push(op);	
	pthread_cond_signal(&condc);
	std::cout<<"producer buffer size:"<<buffer.size()<<"\n";
	pthread_mutex_unlock(&the_mutex);
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
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->funcCode = funcCode;
	op->op1Idx = op1Idx;
	//op->op1f = op1f; TODO add support for float math functions
	op->op1d = op1;
	op->computedRes = computedRes;
	//op->typeId = typeId;
	op->insIndex = insIndex;
	op->cmd = 3;
	op->newRegIdx = newRegIdx;
	pthread_mutex_lock(&the_mutex);
	buffer.push(op);	
	pthread_cond_signal(&condc);
	std::cout<<"producer pushed in buffer:"<<op->newRegIdx<<"\n";
	std::cout<<"producer buffer size:"<<buffer.size()<<"\n";
	pthread_mutex_unlock(&the_mutex);
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
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->funcCode = funcCode;
	op->op1Idx = op1Int;
	//op->op1f = op1f; TODO add support for float math functions
	op->op1d = op1;
	op->op2Idx = op2Int;
	op->op2d = op2;
	op->op3Idx = op3Int;
	op->op3d = op3;
	op->computedRes = computedRes;
	//op->typeId = typeId;
	op->insIndex = insIndex;
	op->cmd = 4;
	op->newRegIdx = newRegIdx;
	pthread_mutex_lock(&the_mutex);
	buffer.push(op);	
	pthread_cond_signal(&condc);
	std::cout<<"producer pushed in buffer:"<<op->newRegIdx<<"\n";
	std::cout<<"producer buffer size:"<<buffer.size()<<"\n";
	pthread_mutex_unlock(&the_mutex);
#else
	handleMath3Args(funcCode, op1, op1Int, op2, op2Int, op3, op3Int, computedRes, insIndex, newRegIdx);
#endif
  return newRegIdx;
}




extern "C" size_t computeReal(size_t opCode, size_t op1Idx, size_t op2Idx, float op1f, float op2f, 
																		double op1d, double op2d, double computedRes,
                                    size_t typeId, size_t insIndex){
	
  size_t newRegIdx = getRegRes(insIndex);
  if(!newRegIdx){
    newRegIdx = getNewRegIndex();
    addRegRes(insIndex, newRegIdx);
  }
#if MULTITHREADED
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
	op->cmd = 5;

	op->newRegIdx = newRegIdx;
	pthread_mutex_lock(&the_mutex);
	buffer.push(op);	
	pthread_cond_signal(&condc);
	std::cout<<"producer pushed in buffer:"<<op->newRegIdx<<"\n";
	std::cout<<"producer buffer size:"<<buffer.size()<<"\n";
	pthread_mutex_unlock(&the_mutex);
#else 
	computeR(opCode, op1Idx, op2Idx, op1f, op2f, op1d, op2d, computedRes, typeId, insIndex, newRegIdx);
#endif
  return newRegIdx;
}


extern "C" void checkBranch(double op1, size_t op1Int, double op2, size_t op2Int, 
                            int fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo){
#if MULTITHREADED
	ComputeR *op = new ComputeR;
  op->op1Idx = op1Int;
  op->op2Idx = op2Int;
  op->op1f = op1f; //TODO
  op->op1d = op1;
  op->op2d = op2;
  op->fcmpFlag = fcmpFlag;
  op->computedRes = computedRes;
  op->insIndex = insIndex;
  op->lineNo = lineNo;
	op->cmd = 6;

  pthread_mutex_lock(&the_mutex);
  buffer.push(op);  
  pthread_cond_signal(&condc);
  std::cout<<"producer pushed in buffer:"<<op->newRegIdx<<"\n";
  std::cout<<"producer buffer size:"<<buffer.size()<<"\n";
  pthread_mutex_unlock(&the_mutex);
#else
  compareBranch(op1, op1Int, op2, op2Int, fcmpFlag, computedRes, insIndex, lineNo);
#endif

}

extern "C" size_t setRealReg(size_t index, double value){
 
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->op1Idx = index;
	op->op1d = value;
	op->cmd = 7;

	pthread_mutex_lock(&the_mutex);
	buffer.push(op);	
	pthread_cond_signal(&condc);
	pthread_mutex_unlock(&the_mutex);
#else 
	setReal(index, value);
#endif
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

//TODO
extern "C" void setRealFunArg(size_t shadowAddr, size_t toAddrInt, double op){
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->shadowAddr = shadowAddr;
	op->toAddrInt = toAddrInt;
	op->op1d = op;

	pthread_mutex_lock(&the_mutex);
	buffer.push(op);	
	pthread_cond_signal(&condc);
	pthread_mutex_unlock(&the_mutex);
#else 
	setFunArg(shadowAddr, toAddrInt, op);
#endif
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
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->toAddrInt = toAddrInt;
	op->cmd = 8;
#else
	setReturn(toAddrInt);
#endif
}


extern "C" void setRealTemp(size_t toAddrInt, size_t fromAddrInt, double op){
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->toAddrInt = toAddrInt;
	op->fromAddrInt = fromAddrInt;
	op->op1d = op;
	op->cmd = 9;
#else
	setTemp(toAddrInt, fromAddrInt, op);
#endif
}

extern "C" void handleLLVMMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size){
#if MULTITHREADED
	ComputeR *op = new ComputeR;
	op->toAddrInt = toAddrInt;
	op->fromAddrInt = fromAddrInt;
	op->size = size;
	op->cmd = 10;
#else
	handleMemcpy(toAddrInt, fromAddrInt, size);
#endif
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

extern "C" void init(){
	std::cout<<"init\n";
	init();
}

extern "C" void finish(){
	fini();
}

