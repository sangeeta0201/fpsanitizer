#include<stdio.h>
#include<stdlib.h>

double foo(double a, double b, int count){


  double temp = 0.0;
  for(int i = 0; i < count; i++){
    temp = a + b * 0.1;
  }
  return temp;
}

double bar(double a, double b, int count){

  double temp = 0.0;
  for (int i = 0; i < count; i++){
    temp = a + b + 0.1;
  }
  return temp;
}


int main(int argc, char** argv){

  int count;
  double a, b;
  if (argc < 3){
    printf("insufficient arguments");
    return 0;
  }

  count = atoi(argv[1]);
  a = atoi(argv[2]);
  b = atoi(argv[3]);
  double sum = 0.0f;
  for(int i = 0; i < count; i++){
    sum = sum + foo(a, b, count);
    sum = sum + foo(a, b, count);
  }

  printf("The value of double is %f\n", sum);
  return 0;
  
}
