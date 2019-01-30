#include<stdio.h>

int main(){
  volatile float a1, b1;
 	float z ;
	float a2, b2, c, x, y;  
  a1 = 0.5f;
   
  a2 = a1  + 0.00134f ; 
  b2 = a2 -  0.00134f ;  
  
  x = a1 - b2;             
                                                                               
  if(x > 0)                       
    z = x * 200000000.0f;
  else
    z = x;
  printf("z:%e\n", z);
}
