#include<stdio.h>
#include<stdlib.h>
#include<testNasty.h>


void mult_su3_nn( su3_matrix *a, su3_matrix *b, su3_matrix *c ){
  printf("mult_su3_nn starts\n");
  int i,j;
  double t,ar,ai,br,bi,cr,ci;
    for(i=0;i<3;i++)for(j=0;j<3;j++){

  ar=a->e[i][0].real; ai=a->e[i][0].imag;
  printf("test read a->e[%d][0].real:%e\n", i, a->e[i][0].real);
  printf("test read a->e[%d][0].imag:%e\n", i, a->e[i][0].imag);
  br=b->e[0][j].real; bi=b->e[0][j].imag;
  printf("test read b->e[0][%d].real:%e\n", j, a->e[0][j].real);
  printf("test read b->e[0][%d].imag:%e\n", j, a->e[0][j].imag);
  cr=ar*br; t=ai*bi; cr -= t;
  ci=ar*bi; t=ai*br; ci += t;
printf("test read a->e[%d][1].real:%e\n", i, a->e[i][1].real);
  printf("test read a->e[%d][1].imag:%e\n", i, a->e[i][1].imag);
  printf("test read b->e[1][%d].real:%e\n", j, a->e[i][1].real);
  printf("test read b->e[1][%d].imag:%e\n", j, a->e[i][1].imag);
  ar=a->e[i][1].real; ai=a->e[i][1].imag;
  br=b->e[1][j].real; bi=b->e[1][j].imag;
  t=ar*br; cr += t; t=ai*bi; cr -= t;
  t=ar*bi; ci += t; t=ai*br; ci += t;

  ar=a->e[i][2].real; ai=a->e[i][2].imag;
  br=b->e[2][j].real; bi=b->e[2][j].imag;
  t=ar*br; cr += t; t=ai*bi; cr -= t;
  t=ar*bi; ci += t; t=ai*br; ci += t;

  c->e[i][j].real=cr;
  c->e[i][j].imag=ci;
    }
}              
int foo(){
	su3_matrix mtmp1;
	su3_matrix mtmp2;
	su3_matrix *su3mat = (su3_matrix *)calloc(1, sizeof(su3_matrix));
	su3_matrix *su3mat2 = (su3_matrix *)calloc(1, sizeof(su3_matrix));
    for(int i=0;i<3;i++)for(int j=0;j<3;j++){
  su3mat->e[i][j].real= i * 0.34; 
	su3mat2->e[i][j].imag= i * 0.123;
	}
	mult_su3_nn(&su3mat, &su3mat2, &mtmp1);
	mult_su3_nn(&su3mat, &mtmp1, &mtmp2);
	
    for(int i=0;i<3;i++)for(int j=0;j<3;j++){
  printf("real:%e", mtmp1.e[i][j].real); 
	printf("imag:%e", mtmp1.e[i][j].imag);
  printf("real:%e", mtmp2.e[i][j].real); 
	printf("imag:%e", mtmp2.e[i][j].imag);
	}
}

