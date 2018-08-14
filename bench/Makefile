CFLAGS=-O2 -g -std=c11 -L$(FPROOT)/obj -lfpsanitizer -lmpfr -lm
CAMLFLAGs=
CSRC = $(wildcard *.c)
COUT = $(patsubst %.c,%.c.out,$(CSRC))

CC = clang -Xclang -load -Xclang /home/sangeeta/fpsanitizer/build/lib/LLVMFPInstrumentO1.so

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
