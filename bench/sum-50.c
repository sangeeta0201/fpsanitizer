#include <stdio.h>

int main() {
  double x;
  for (x = 0.0f; x < 10.0f; x += 0.2f);
  printf("%.20g\n", x);
  
}
