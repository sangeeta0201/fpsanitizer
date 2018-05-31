ifneq (,$(shell which clang++ 2>/dev/null))
CXX=clang++ -Xclang -load -Xclang /home/sangeeta/project/float_p/herculean/build/lib/LLVMFPInstrument.so
#CXX=clang++ 
CXXFLAGS =  -I$(TBBROOT)/include  
else
CXX=g++
CXXFLAGS = -I$(TBBROOT)/include -O1
endif # clang++

#LIBS = -L$(TBBROOT)/obj -ltbb -L$(TD_ROOT)/obj -ltdebug
LIBS =  -lherculean -lmpfr

SRCS = $(wildcard *.cpp)

PROGS = $(patsubst %.cpp,%,$(SRCS))

all: $(PROGS)

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LIBS)

clean:
	rm -rf $(PROGS) *~ *.out util.pyc traces
