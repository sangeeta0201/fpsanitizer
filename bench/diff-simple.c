#include <stdio.h>
#include <math.h>
#include <string.h>

int main() {
  double x,y;
  x = 1e16;
  y = (x + 1) - x;
  printf("y:%e\n", y);
  return 0;
}
