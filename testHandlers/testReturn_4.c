#include<stdio.h>
#include <stdlib.h>
double myrand(double *prn_pt){
	return *prn_pt*rand();
}

double gaussian_rand_no( double *prn_pt ){
printf("gaussian_rand_no starts\n");
static int iset=0;
static double gset;
double fac,r,v1,v2;

  if  (iset == 0) {
    do {
      v1=2.0*myrand(prn_pt)-1.0;
      v2=2.0*myrand(prn_pt)-1.0;
      printf("v1:%e\n",v1);
      printf("v2:%e\n",v2);
      r=v1*v1+v2*v2;
    } while (r >= 1.0);
    fac=sqrt( -log((double)r)/(double)r);                                       
    printf("v1:%e\n", v1);
    printf("fac:%e\n", fac);
    gset=v1*fac;
    printf("gset:%e\n", gset);
    iset=1;
    printf("gaussian_rand_no ends\n");
    return v2*fac;
  }
  else {
    iset=0;
  printf("gaussian_rand_no ends\n");
    return gset;
	}
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
	double input = 5.96046447753906e-8;
	double res = random_anti_hermitian(&input);
}
