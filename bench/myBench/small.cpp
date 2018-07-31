#include <stdio.h>
#include <math.h>
#include <iostream>
#include "handleReal.h"

void calcY(double* y, double x){
  *y = sqrt(x + 1) - sqrt(x);
}

int main() {
  double x,y;
  x = 1e10;
  calcY(&y, x);
  calcY(&y, x);
  printf("%e\n", y);
  size_t result_A = (size_t) &y;
  printError(result_A, y);
  return 0;
}
