ifneq (,$(shell which clang++ 2>/dev/null))
CXX=clang++ -Xclang -load -Xclang /home/sangeeta/project/float_p/fpsanitizer/build/lib/LLVMFPInstrument.so
#CXX=clang++ 
CXXFLAGS =  -I$(FPROOT)
else
CXX=g++
CXXFLAGS = -I$(FPROOT) -O1
endif # clang++

LIBS = -L$(FPROOT)/obj -lfpsanitizer -lmpfr

SRCS = $(wildcard *.cpp)

PROGS = $(patsubst %.cpp,%,$(SRCS))

all: $(PROGS)

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LIBS)

clean:
	rm -rf $(PROGS) *~ *.out util.pyc traces
