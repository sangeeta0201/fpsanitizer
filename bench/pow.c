#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
int main() {
 uint32_t bits = 0x402aaaab; // 2.666667f
 float exp_ = 0.0f;
 memcpy(&exp_, &bits, 4);
 volatile float exp = exp_;
 printf("%f (0x%08x)\n", exp, bits);
 float f  = powf(2.0f,         exp);
 double d = pow (2.0 , (double)exp);
 printf("expected: %f\n", d);
 printf("returned: %f\n", f);
 return 0;
}
