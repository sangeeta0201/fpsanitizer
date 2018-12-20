#include<stdio.h>
#include <stdlib.h>


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

int main(){
	double input = 0.345;
	double res = random_anti_hermitian(&input);
}
