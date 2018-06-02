#include <iostream>
#include <map>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include "handleReal.cpp"

#define PRECISION 200

void calcY(float x){
  float result = 2 * x;
  size_t result_A = (size_t) &result;
  printf("func: :%e\n", result);
  printError(result_A, result);
}

int main(){
  float e = 0.00000006f; 
  float x = 0.5f;
  float y=1.0f+x;
  //printf("Result using float:%e\n", y);
  float more=y+e;
  float diffe=more-y;
  float diff0 = diffe - e;
  float zero = diff0 + diff0; 
  printf("main: :%e\n", zero);
  calcY(zero);
  printf("main: :%e\n", zero);
  
//  float result = 2 * zero;
  //setShadow(&result, &result);
 // std::cout<<"diff0:"<<diff0<<"\n";
 // size_t result_A = (size_t) &result;
  //printf("Result using float:%e\n", result);
}
