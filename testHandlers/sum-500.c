#include <stdio.h>

int main() {
   float x = 0.0;
  for (int i = 0; i < 100000; i++)
		x += 0.1f;
  printf("%.20g\n", x);
}
