#include<stdio.h>

int main() {
  double d = 1.0;
  double max = 1.79769e+308;
  d /= max;
  d *= max;
	printf("d:%e:\n", d);
  return 0;
}
