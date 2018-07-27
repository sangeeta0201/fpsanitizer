#include <iostream>
#include <stdio.h>
#include <math.h>
#include <string.h>

void check(){
  std::string fileName = "sangeeta";
  std::cout<<fileName<<"\n"; 
}
int main() {
  double x,y;
  x = 1e16;
  y = (x + 1) - x;
  printf("%e\n", y);
//  size_t result_A = (size_t) &y;
 // printErrorD(result_A, y);
//  printf("Result using float:%e\n", y);  
  return 0;
}
