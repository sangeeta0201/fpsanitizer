#include <stdio.h>

int main() {
  volatile double x;
  for (x = 0.0; x < 100.0; x += 0.2);
  printf("%.20g\n", x);
}
