#include<stdio.h>

int main(){
  volatile float a1, b1;
  volatile float a2, b2, c, x, y, z;  
  a1 = 0.5f;
   
  a2 = a1  + 0.00134f ; 
  b2 = a2 -  0.00134f ;  
  
  x = a1 - b2;             
  
  printf("x:%e\n", x);                                                                                
  if(x > 0)                       
    z = x * 2000.0f;
  else
    z = x;
  printf("z:%e\n", z);
}
