#include <stdio.h>

int main(int argc, char** argv){
	double x = 1.0e16;
  double y = 8;
  double a = ((x * 5) + (1 + y)) - ((x * 5) + y);
  printf("a = %e\n", a);
  return 0;
}
