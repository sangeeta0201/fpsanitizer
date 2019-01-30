#include<stdio.h>
#include<math.h>

int main(){
	double a = 1e-40, b, c;
	float x = 0, y;
 
  /* Store into y is inexact and underflows: */
  y = a;
 
  /* Zero-divide */
  b = y / x; 
 	printf("b:%e\n", b);
  /* Inexact */
  c = sin(30) * a;
 	printf("c:%e\n", c);
}
