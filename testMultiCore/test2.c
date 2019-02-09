#include <stdio.h>
#include <stdlib.h>
#include <mpfr.h>

#define SIZE 9000000

double x[SIZE];
double y[SIZE];
double z1[SIZE];
double z2[SIZE];
double z3[SIZE];

double foo(){
	double a = 0;

  for (int i = 0; i < SIZE; i++){
		x[i] = i * 0.7;
		y[i] = i * 0.3;
	}
  for (int i = 0; i < SIZE; i++){
		z1[i] = x[i] + y[i];
		z2[i] = x[i] * y[i];
		z3[i] = z1[i] + z2[i];
	}
  for (int i = 0; i < SIZE; i++){
		a +=  z1[i] + z2[i] + z3[i];
	}
	return a;
}
int main() {
	double a = foo();
	printf("%e\n", a);
	printf("******\n");
//	double b = foo_mpfr();
//	printf("%e\n", b);
}
