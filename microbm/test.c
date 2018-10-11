#include<stdio.h>
#include<stdlib.h>

float foo(float a, float b, int count){


  float temp = 0.0;
  for(int i = 0; i < count; i++){
    temp = a + b * 0.1;
  }
  return temp;
}

float bar(float a, float b, int count){

  float temp = 0.0;
  for (int i = 0; i < count; i++){
    temp = a + b + 0.1;
  }
  return temp;
}


int main(int argc, char** argv){

  int count;
  float a, b;
  if (argc < 3){
    printf("insufficient arguments");
    return 0;
  }

  count = atoi(argv[1]);
  a = atoi(argv[2]);
  b = atoi(argv[3]);
  float sum = 0.0f;
  for(int i = 0; i < count; i++){
    sum = sum + foo(a, b, count);
    sum = sum + foo(a, b, count);
  }

  printf("The value of float is %f\n", sum);
  return 0;
  
}
