#include<stdio.h>
#include<stdlib.h>

typedef struct {     /* standard complex number declaration for single- */
   double real;      /* precision complex numbers           */
   double imag;
} complex;
typedef struct { complex e[3][3]; } su3_matrix;

int foo();
void mult_su3_nn( su3_matrix *a, su3_matrix *b, su3_matrix *c );
