#include <stdio.h>

int main() {
  volatile double x;
  double cmp;
  x = 0.0;
  cmp = (x == 0.0);
  printf("%e\n", cmp);
}
