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
```

Pass is here - fpsanitizer/llvm/lib/Transforms/FPInstrument/FPInstrument.cpp

To instrument functions, please list them in functions.txt inside bench dir
