#include <stdio.h>
#include <stdlib.h>
#include <mpfr.h>
//#include "perf.h"

#define SIZE 5
mpfr_t aa;

double bar(double *a, double *b, double *c){
	double x = 0;
  for (int i = 0; i < SIZE; i++){
		x += a[i] + b[i] + c[i];
	}
	return x;
}

int main() {
//	start_counter();
	double a = 0;
	double *x = (double *)malloc(SIZE*sizeof(double));
	double *y = (double *)malloc(SIZE*sizeof(double));
	double *z1 = (double *)malloc(SIZE*sizeof(double));
	double *z2 = (double *)malloc(SIZE*sizeof(double));
	double *z3 = (double *)malloc(SIZE*sizeof(double));
	double max;
	for (int i = 0; i < SIZE; i++){
			x[i] = i + 0.7;
		y[i] = i + 0.3;
	}
	printf("loop1 done\n");
  for (int i = SIZE - 1; i >= 0; i--){
		z1[i] = x[i] + y[i];
		z2[i] = x[i] / y[i];
		z3[i] = z1[i] * z2[i];
	}
	double xx = bar(z1, z2, z3);
	
	double yy = bar(z2, z1, z3);
	double sum = xx + yy;
	printf("%e\n", sum);
	printf("%e\n", xx);
	printf("%e\n", yy);
	printf("******\n");
//	stop();
//	double b = foo_mpfr();
//	printf("%e\n", b);
}
