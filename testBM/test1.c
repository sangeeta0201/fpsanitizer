#include<stdio.h>
#include<stdlib.h>
double foo(double a, double b, int count){

  volatile double temp = 0.1;

//  for(int i = 0; i < count; i++){
    
    temp = a + b * temp;
 // }

  return temp;
}

int main(int argc, char** argv){
  int count;
  double a, b;
  if (argc < 1){
    printf("insufficient arguments");
    return 0;
  }

  count = atoi(argv[1]);
  a = 0.002;
 
  b = 0.0065361;
  
  volatile double sum = 0.0f;
	printf("count:%d", count);
  for(int i = 0; i < count; i++){
    sum = sum + foo(a, sum, count);
  }

  printf("The value of double is %f\n", sum);
  return 0;

}
