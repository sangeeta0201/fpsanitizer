#include<stdio.h>
#include <stdlib.h>

struct im{
	double real;
	double imag;
};
struct anti_hermitmat{
	double m00im;
	double m11im;
	double m22im;
	struct im m01;
	struct im m02;
	struct im m12;	
};

double gaussian_rand_no( double *prn_pt ){
	printf("gaussian_rand_no starts****\n");
	static int iset=0;
	static double gset;
	double fac,r,v1,v2;
      v2=2.0*rand();
      v1=1.0*rand();
      printf("prn_pt:%e\n", prn_pt);
      printf("v1:%e\n", v1);
      printf("v2:%e\n", v2);
      printf("r:%e\n", r);
    return v1+v2;
}            
void random_anti_hermitian( struct anti_hermitmat *mat_antihermit, double *prn_pt) {
  double r3,r8;
  double sqrt_third;

  sqrt_third = sqrt( (double)(1.0/3.0) );
  r3=gaussian_rand_no(prn_pt);
  r8=gaussian_rand_no(prn_pt);
  mat_antihermit->m00im=r3+sqrt_third*r8;
  mat_antihermit->m11im= -r3+sqrt_third*r8;
  mat_antihermit->m22im= -2.0*sqrt_third*r8;
  mat_antihermit->m01.real=gaussian_rand_no(prn_pt);
  mat_antihermit->m02.real=gaussian_rand_no(prn_pt);
  mat_antihermit->m12.real=gaussian_rand_no(prn_pt);
  mat_antihermit->m01.imag=gaussian_rand_no(prn_pt);
  mat_antihermit->m02.imag=gaussian_rand_no(prn_pt);
  mat_antihermit->m12.imag=gaussian_rand_no(prn_pt);

}/*random_anti_hermitian_*/  
void random_hermitian( struct anti_hermitmat *mat_antihermit, double *prn_pt) {
  double r3,r8;
  double sqrt_third;

  sqrt_third = sqrt( (double)(1.0/3.0) );
  r3=gaussian_rand_no(prn_pt);
  r8=gaussian_rand_no(prn_pt);
  mat_antihermit->m00im=r3+sqrt_third*r8;
  mat_antihermit->m11im= -r3+sqrt_third*r8;
  mat_antihermit->m22im= -2.0*sqrt_third*r8;
  mat_antihermit->m01.real=gaussian_rand_no(prn_pt);
  mat_antihermit->m02.real=gaussian_rand_no(prn_pt);
  mat_antihermit->m12.real=gaussian_rand_no(prn_pt);
  mat_antihermit->m01.imag=gaussian_rand_no(prn_pt);
  mat_antihermit->m02.imag=gaussian_rand_no(prn_pt);
  mat_antihermit->m12.imag=gaussian_rand_no(prn_pt);

}/*random_anti_hermitian_*/  


/*
double random_anti_hermitian( double *prn_pt) {
  printf("***random_anti_hermitian starts***\n");
  double r3,r8, r9;
  double sqrt_third;

  sqrt_third = sqrt( (double)(1.0/3.0) );
  r3=gaussian_rand_no(prn_pt);
  printf("sqrt_third:%e\n",sqrt_third);
  printf("****test r3:%e\n",r3);
  r8=gaussian_rand_no(prn_pt);
  r9=gaussian_rand_no(prn_pt);
  printf("****test r8:%e\n",r8);                                                
  return r3*r9+sqrt_third*r8;
}
*/
int main(){
	double input = 0.345;
	struct anti_hermitmat st1;
	struct anti_hermitmat st2;
	
	random_anti_hermitian(&st1, &input);
	printf("input:%e", input);
	printf("  st1.m00im:%e",   st1.m00im);
	printf("  st1.m11im:%e",   st1.m11im);
	printf("  st1.m22im:%e",   st1.m22im);
	printf("  st1.m01.real:%e",   st1.m01.real);
	printf("  st1.m01.real:%e",   st1.m01.imag);
	random_hermitian(&st2, &input);
	printf("input:%e", input);
	printf("  st2.m00im:%e",   st2.m00im);
	printf("  st2.m11im:%e",   st2.m11im);
	printf("  st2.m22im:%e",   st2.m22im);
	printf("  st2.m01.real:%e",   st2.m01.real);
	printf("  st2.m01.real:%e",   st2.m01.imag);
}
