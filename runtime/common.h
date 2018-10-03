std::map<size_t, size_t>funRetMap;

void fInit(size_t funcAddrInt);
void fExit(size_t funcAddrInt, size_t returnIdx);
void handleMath(size_t funcCode, double op1, size_t op1Int, double computedRes, size_t insIndex, size_t newRegIdx);
void handleMath3Args(size_t funcCode, double op1, size_t op1Int,                                                                                                            
                                                double op2, size_t op2Int,
                                                double op3, size_t op3Int,
                                                double computedRes, size_t insIndex, size_t newRegIdx);
void computeR(size_t opCode, size_t op1Idx, size_t op2Idx, float op1f, float op2f,                                                                                          
                                    double op1d, double op2d, double computedRes,
                                    size_t typeId, size_t insIndex, size_t newRegIdx);
void compareBranch(double op1, size_t op1Int, double op2, size_t op2Int,                                                                                                    
                            int fcmpFlag, bool computedRes, size_t insIndex, size_t lineNo);
size_t getRegRes(size_t insIndex);
size_t getNewRegIndex();
void fini();
void setReal(size_t index, double value);
void setFunArg(size_t shadowAddr, size_t toAddrInt, double op);
void setReturn(size_t toAddrInt);
void setTemp(size_t toAddrInt, size_t fromAddrInt, double op);
void handleMemcpy(size_t toAddrInt, size_t fromAddrInt, size_t size);
void addRegRes(size_t insIndex, size_t resRegIndex);
