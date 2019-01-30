#include<stdio.h>

int main(){
	float res[2][2];
	for (int i=0; i<2; i++) {
  	double freq = 2*(double)i;
		for (int j=0;j< 2;j++){
      res[i][j] = (float)cos((double)(freq*(j+0.5)));
			printf("res[%d][%d]: %e", i, j, res[i][j]);
    }
	}
}
