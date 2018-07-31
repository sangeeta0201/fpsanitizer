#include<assert.h>
#include<stdlib.h>
#include<stdio.h>
#include<float.h>
#include<math.h>

int main(){
  double a,b,c;
  a = 1e16;
  b = (a + 1) - a;
  printf("%g\n", a);
  printf("%g\n", b);
  if (b>=0)
    c=sqrt(b)+10.0; 
  else
    c=sqrt(-b)+10.0;
  return c;
}
