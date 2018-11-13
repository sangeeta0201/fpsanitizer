#include <stdio.h>

int main() {
  volatile float x;
  for (x = 0.0; x < 10.0; x += 0.2);
  printf("%.20g\n", x);
}
