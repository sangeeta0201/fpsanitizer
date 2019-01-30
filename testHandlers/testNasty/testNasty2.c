#include<stdio.h>
#include<stdlib.h>
#include<testNasty.h>

int main(){
	foo();
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
