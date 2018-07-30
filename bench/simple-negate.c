#include <stdio.h>
#include <math.h>

int main() {
  double x = 1e-20;
  double y = (- x);
  double z = 5.0;
  double w = (y + z) - z;
  printf("%e\n", w);
}
