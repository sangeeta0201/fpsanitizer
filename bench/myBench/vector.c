#include <stdio.h>
#include <stdlib.h>


int main(int argc, char *argv[]) {
  int i, j;
  double x[5];
  double y[5];
  double total = 0.0;
  double a = 0.0f;
  double b = 1.0f;
    
    for (j=0; j<5; ++j) {
      x[j] = a + (double)j;
      y[j] = b + (double)j;
    }
  
  double accumulator = 0.0;
  for (i=0; i<5; ++i) {
    accumulator += (double)x[i] * (double)y[i];
  }
  printf("Total is %g\n", accumulator);
    
  return 0;
}
