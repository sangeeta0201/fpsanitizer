ifneq (,$(shell which clang++ 2>/dev/null))
CXX=clang++ -Xclang -load -Xclang /home/sangeeta/fpsanitizer/build/lib/LLVMFPInstrument.so
#CXX=clang++ 
CXXFLAGS =  -I$(FPROOT) -O0
else
CXX=g++
CXXFLAGS = -I$(FPROOT) -O0
endif # clang++

LIBS = -L$(FPROOT)/obj -lfpsanitizer -lmpfr

SRCS = $(wildcard *.cpp)

PROGS = $(patsubst %.cpp,%,$(SRCS))

all: $(PROGS)

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LIBS)

clean:
	rm -rf $(PROGS) *~ *.out util.pyc traces
