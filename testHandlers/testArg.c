#include<stdio.h>
#include<stdlib.h>

double bar(double a, double b, double c, double d){

  return a+b*c+c*d;
}

double foo(double a, double b){

  double temp = 0.0;

  temp = a + b * 0.1;
  printf("The value of double is %f\n", temp);
	temp = bar(a, b, a*0.1, temp);
  return temp;
}

int main(int argc, char** argv){

  double a, b;

  a = 0.2;
 
  b = 0.1;
  
  volatile double sum = 0.0f;
  sum = sum + foo(a, sum);
  sum += foo(a, sum);

  printf("The value of double is %f\n", sum);
  return 0;

}
