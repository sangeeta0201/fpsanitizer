
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


#define Asize	 8		   /* Array edge size */
#define Passes	 1		   /* Number of FFT/Inverse passes */

int main()
{
	int i, j, k, l, m, npasses = Passes, faedge;
	double *fdata1, *fdata2, *fdata3;
	static int nsize[] = {0, 0, 0};
	long fanum, fasize;
	double mapbase, mapscale, rmin, rmax, imin, imax;
  fanum = 10;
	fasize = 10 * sizeof(double); /* FFT array size */

	fdata1 = (double *) malloc(fasize);
	if (fdata1 == NULL) {
           fprintf(stderr, "Can't allocate data array.\n");
	   exit(1);
	}

	fdata2 = (double *) malloc(fasize);
	if (fdata2 == NULL) {
           fprintf(stderr, "Can't allocate data array.\n");
	   exit(1);
	}
	fdata3 = (double *) malloc(fasize);
	if (fdata2 == NULL) {
           fprintf(stderr, "Can't allocate data array.\n");
	   exit(1);
	}
	memset(fdata1, 0, fasize);

	double r, ij, ar, ai;
	rmin = 1e10; rmax = -1e10;
	imin = 1e10; imax = -1e10;
	ar = 0;
	ai = 0;

	for (i = 0; i <= fanum; i += 1) {
		fdata1[i] =  0.5 ;
		printf("fdata1[i]%e:\n", fdata1[i]);
	}

	memcpy(fdata2, fdata1, fasize); //test mempcy
	memset(fdata1, 0, fasize);
	for (i = 0; i <= fanum; i += 1) {
		fdata1[i] =  0.8 ;
		printf("fdata1[i]%e:\n", fdata1[i]);
	}

	for (i = 0; i <= fanum; i += 1) {
		fdata3[i] = fdata1[i] + fdata2[i] ;
		printf("fdata3[i]:%e:\n", fdata3[i]);
	}

	free(fdata1);  //test free

	fdata1 = (double *) malloc(fasize);
	if (fdata1 == NULL) {
           fprintf(stderr, "Can't allocate data array.\n");
	   exit(1);
	}
	for (i = 0; i <= fanum; i += 1) {
		fdata1[i] = fdata3[i] + 0.2;
		printf("fdata1[i]:%e:", fdata1[i]);
	}
	return 0;
}
