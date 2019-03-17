CFLAGS=-O1 -fno-slp-vectorize -g -std=c11  -L$(FPROOT)/obj -lfpsanitizer -lmpfr -lm -pthread -ltbb -lstdc++
#CFLAGS=-O1 -fno-slp-vectorize -g -std=c11 -L$(FPROOT)/obj -lfpsanitizer -lmpfr -lm ../SoftPosit/build/Linux-x86_64-GCC/softposit.a  -I../SoftPosit/source/include 
CAMLFLAGs=
CSRC = $(wildcard *.c)
COUT = $(patsubst %.c,%.o,$(CSRC))

CC = clang -g -pg -Xclang -load -Xclang $(FPROOT)/../build/lib/LLVMFPInstrument.so

all: $(COUT) $(CAMLOUT)

%.o: %.c
	$(CC) -o $@ $< $(CFLAGS)
	chmod u+x $@

%.sout: %.s
	$(CC) -o $@ $< $(CFLAGS)
	chmod u+x $@

%.s: %.c
	$(CC) $(CFLAGS) -S -o $@ $<


clean:
	rm -rf *.o *.sout *.dSYM
