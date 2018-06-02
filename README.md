# fpsanitizer

In this project we have build a llvm pass to instrument floating point operations and run in parallel using arbitrary presicion.

To build this project follow below steps after git clone
```
1. cd fpsanitizer 
2. source fp_build.sh
```
To run benchmarks follow below steps 
```
1. cd fpsanitizer/bench
2. make
3. to build individual test cases use -

clang++ -Xclang -load -Xclang /home/sangeeta/project/float_p/fpsanitizer/build/lib/LLVMFPInstrument.so -I/home/sangeeta/project/float_p/fpsanitizer/src -O0 -o ex2 ex2.cpp -L/home/sangeeta/project/float_p/fpsanitizer/src/obj -lfpsanitizer -lmpfr

change path accordingly. There are shell scripts which set path while building the lib.
```

Pass is here - fpsanitizer/llvm/lib/Transforms/FPInstrument/FPInstrument.cpp

To instrument functions, please list them in functions.txt inside bench dir

Benchmarsk tested till now -
```
1.sum-50.cpp
2.ex1.cpp
3.small.cpp
```

To test error propagation across functions use 

```
1. ex2.cpp
```
