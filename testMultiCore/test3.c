#include <stdio.h>
#include <stdlib.h>
#include <mpfr.h>

#define SIZE 10000000
mpfr_t aa;

double bar(double *a, double *b, double *c){
	double x = 0;
  for (int i = 0; i < SIZE; i++){
		x += a[i] + b[i] + c[i];
	}
	return x;
}

double* foo(){

}
#if 0
double foo_mpfr(){
	double a;
	mpfr_t temp1, temp2;
	mpfr_t *xx = (mpfr_t *)malloc(SIZE*sizeof(mpfr_t));
	mpfr_t *yy = (mpfr_t *)malloc(SIZE*sizeof(mpfr_t));
	mpfr_t *zz1 = (mpfr_t *)malloc(SIZE*sizeof(mpfr_t));
	mpfr_t *zz2 = (mpfr_t *)malloc(SIZE*sizeof(mpfr_t));
	mpfr_t *zz3 = (mpfr_t *)malloc(SIZE*sizeof(mpfr_t));
	mpfr_t *tmp1 = (mpfr_t *)malloc(SIZE*sizeof(mpfr_t));
	mpfr_t *tmp2 = (mpfr_t *)malloc(SIZE*sizeof(mpfr_t));
	
  for (int i = 0; i < SIZE; i++){
		mpfr_init_set_d(temp1, 0.7, MPFR_RNDN);
		mpfr_init_set_d(temp2, i, MPFR_RNDN);
		mpfr_init(xx[i]);
		mpfr_mul(xx[i], temp1, temp2, MPFR_RNDN);

		mpfr_init_set_d(temp1, 0.3, MPFR_RNDN);
		mpfr_init_set_d(temp2, i, MPFR_RNDN);
		mpfr_init(yy[i]);
		mpfr_mul(yy[i], temp1, temp2, MPFR_RNDN);
	}
  for (int i = 0; i < SIZE; i++){
		mpfr_init(zz1[i]);
		mpfr_init(zz2[i]);
		mpfr_init(zz3[i]);
		mpfr_add(zz1[i], xx[i], yy[i], MPFR_RNDN);
		mpfr_mul(zz2[i], xx[i], yy[i], MPFR_RNDN);
		mpfr_add(zz3[i], zz1[i], zz2[i], MPFR_RNDN);
		mpfr_clear(xx[i]);
		mpfr_clear(yy[i]);
	}
	free(xx);
	free(yy);
	mpfr_init_set_d(aa, 0, MPFR_RNDN);
  for (int i = 0; i < SIZE; i++){
		mpfr_init(tmp1[i]);
		mpfr_add(tmp1[i], zz1[i], zz2[i], MPFR_RNDN);
		mpfr_init(tmp2[i]);
		mpfr_add(tmp2[i], zz3[i], tmp1[i], MPFR_RNDN);
		mpfr_add(aa, aa, tmp2[i], MPFR_RNDN);
		mpfr_clear(zz1[i]);
		mpfr_clear(zz2[i]);
		mpfr_clear(zz3[i]);
	}
	a = mpfr_get_d(aa, MPFR_RNDN);
	return a;
}
#endif
int main() {
	double a = 0;
	double *x = (double *)malloc(SIZE*sizeof(double));
	double *y = (double *)malloc(SIZE*sizeof(double));
	double *z1 = (double *)malloc(SIZE*sizeof(double));
	double *z2 = (double *)malloc(SIZE*sizeof(double));
	double *z3 = (double *)malloc(SIZE*sizeof(double));

  for (int i = 0; i < SIZE; i++){
		x[i] = i + 0.7;
		y[i] = i + 0.3;
	}
  for (int i = 0; i < SIZE; i++){
		z1[i] = x[i] + y[i];
		z2[i] = x[i] / y[i];
		z3[i] = x[i] * y[i];
	}
	double xx = bar(z1, z2, z3);
	printf("%e\n", xx);
	printf("******\n");
//	double b = foo_mpfr();
//	printf("%e\n", b);
}
