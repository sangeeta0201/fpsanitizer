#include <stdio.h>
#include <math.h>

int main() {
  double x, y;
  x = atan(1.0) * (40002);
  printf("***x:%e\n", x);
  printf("***sin(x):%e\n", sin(x));
  printf("***cos(x):%e\n", cos(x));
  printf("***tan(x):%e\n", tan(x));
  y = tan(x) - (sin(x)/cos(x));
  printf("****y:%e\n", y);
  return 0;
}
