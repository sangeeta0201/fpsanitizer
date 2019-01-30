#include<stdio.h>

int main(){
  volatile double a1, b1;
	double a2, b2, c, x, y, z;  
 	a1 = 1.7;
	b1 = 1.9;
	 
  a2 = (a1  + 0.1) * 5; 
  b2 = (b1 - 0.1) * 5;  
  
  x = a2 - b2;             
  
  if( x >= 0.5){         
    x = x * 100;
  }
  else{
    x = x * 100;
  }
  c = x * 2e+53;
  y = sqrt(c);
  if(y >= 0.5){                           
		z = x+y;
  }
  else
		z = x+y;
  printf("z:%e", z); 
}
