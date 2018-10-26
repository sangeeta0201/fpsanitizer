#include <stdio.h>
#include <math.h>

void calcY(double* y, double x){
  *y = sqrt(x + 1) - sqrt(x);
}

int main() {
  double x,y;
  x = 1e10;
  calcY(&y, x);
  printf("y:%e\n", y);
  calcY(&y, x);
  printf("y:%e\n", y);
	double sum = x + y;
  printf("sum:%e\n", sum);
  return 0;
}
