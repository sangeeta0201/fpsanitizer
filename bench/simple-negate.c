#include <stdio.h>
#include <math.h>

int main() {
  volatile double x = 1e-20;
  volatile double y = (- x);
  volatile double z = 5.0;
  double w = (y + z) - z;
  printf("%e\n", w);
}
