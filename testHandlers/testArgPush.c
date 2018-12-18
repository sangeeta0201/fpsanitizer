#include<stdio.h>
#include<stdlib.h>

double foo(double a, double b, int count){

  double temp = 0.0;

  for(int i = 0; i < count; i++){
    
    temp = a + b * 0.1;
  }

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
  a = 0.2;
 
  
  b = 0.1;
  
  double sum = 0.0f;
  for(int i = 0; i < count; i++){

    sum = sum + foo(a, sum, count);
    sum = sum + foo(a, sum, count);
  }
	int sum1 = 1;
  for(int i = 0; i < count; i++){
		sum1 = sum1 + i;
  }

  printf("The value of double is %f\n", sum);
  printf("The value of double is %d\n", sum1);
  return 0;

}
