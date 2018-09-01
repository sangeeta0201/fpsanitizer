#include<stdio.h>

int main(){
double a = 3.0;
double b = 7.0;
double c = a / b;
 
if (c == a / b) {
  printf("Comparison succeeds\n");
} else {
  printf("Unexpected result\n");
}
}
