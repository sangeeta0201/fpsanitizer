#include<stdio.h>

double foo(double x, double y){
  double sum = 0;
  double sub = 0;
  printf("x: %e:\n", x);
  printf("y: %e:\n", y);
  y = y + 0.2;
  if(x <= 0) 
    return 0;
  else{
    x = x - 0.2;
    foo(x, y);
  }
  printf("later x: %e:\n", x);
  printf("later y: %e:\n", y);
  sub = y - x;
  printf("sub: %e:\n", sub);
  return sub;
}

int main(){
  double x = 2.2;
  double y = 3.2;
  double z = foo(x, y);
  printf("z: %e:\n", z);
}   
