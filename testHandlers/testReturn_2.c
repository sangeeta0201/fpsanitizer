#include<stdio.h>
#include <stdlib.h>
double myrand(double seed){
	double x;
	for(int i = 0; i< 10; i++)
		x += i*seed*rand();
	return x;
}

double gaussian_rand_no( double *prn_pt ){
	printf("gaussian_rand_no starts****\n");
	static int iset=0;
	static double gset;
	double fac,r,v1,v2, res;
	for(int i = 0; i< 5; i++){
      v2=2.0*myrand(*(prn_pt + i))*i;
      v1=1.0*myrand(*(prn_pt + i))*i;
      printf("prn_pt:%e\n", prn_pt);
      printf("v1:%e\n", v1);
      printf("v2:%e\n", v2);
      printf("r:%e\n", r);
			res = v1+v2;
	}
    return res;
}            

double random_anti_hermitian( double *prn_pt) {
  printf("***random_anti_hermitian starts***\n");
  double r3,r8, r9;
  double sqrt_third;

  sqrt_third = sqrt( (double)(1.0/3.0) );
	for(int i = 0; i< 10; i++){
  r3=gaussian_rand_no(prn_pt);
  printf("sqrt_third:%e\n",sqrt_third);
  printf("****test r3:%e\n",r3);
  r8=gaussian_rand_no(prn_pt) * r3;
  r9=gaussian_rand_no(prn_pt) * r8;
	}
  printf("****test r8:%e\n",r8);                                                
  return r3*r9+sqrt_third*r8;
}

int main(){
	double *arr = (double *)malloc(5*sizeof(double));
	for(int i =0;i < 5; i++)
		arr[i] = i*0.3345;
	double res = random_anti_hermitian(arr);
}
