CFLAGS=-O1 -fno-slp-vectorize -g -std=c11 -L$(FPROOT)/obj -lfpsanitizer -lmpfr -lm -pthread -ltbb
#CFLAGS=-O1 -fno-slp-vectorize -g -std=c11 -L$(FPROOT)/obj -lfpsanitizer -lmpfr -lm ../SoftPosit/build/Linux-x86_64-GCC/softposit.a  -I../SoftPosit/source/include 
CAMLFLAGs=
CSRC = $(wildcard *.c)
COUT = $(patsubst %.c,%.c.out,$(CSRC))

CC = clang -Xclang -load -Xclang /home/sangeeta/fpsanitizer/build/lib/LLVMFPInstrument.so

all: $(COUT) $(CAMLOUT)

testprog.c.out: testprog.c
	$(CC) -o $@ $< $(CFLAGS) -lmpfr
	chmod u+x $@

%.c.out: %.c
	$(CC) -o $@ $< $(CFLAGS)
	chmod u+x $@

%.sout: %.s
	$(CC) -o $@ $< $(CFLAGS)
	chmod u+x $@

%.s: %.c
	$(CC) $(CFLAGS) -S -o $@ $<


clean:
	rm -rf *.out *.sout *.dSYM
