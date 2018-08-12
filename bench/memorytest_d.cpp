#include <stdio.h>
/* #include "../FpDebug/valgrind/fpdebug/fpdebug.h" */
#include <math.h>


int main(void){
  double x, y, one;
  x = 1e16;
  // The formula we're computing. Here it's computed in normal
  // precision, but under FpDebug it should be shadowed with 120 bit
  // values.
  one = 1.0;
  // Recompute that same formula in arbitrary precision.
  double res = x + one;
  res = x + one + 1;
}
