
#include <stdio.h>
/* #include "../FpDebug/valgrind/fpdebug/fpdebug.h" */
#include <math.h>
#include <gmp.h>
#include <mpfr.h>


int main(void){
  double x, y;
  mpfr_t m_x, m_y, one, r1, r2, r3;

  x = 1e16;
  mpfr_init2(m_x, 100);
  mpfr_set_d(m_x, x, MPFR_RNDD); 
  mpfr_init2(one, 100);
  mpfr_set_d(one, 1.0, MPFR_RNDD); 

  mpfr_init2(r1, 100);
  mpfr_add(r1, m_x, one, MPFR_RNDN);

//  printf("The actual value of r1 is %e\n", mpfr_get_d(r1, MPFR_RNDN));  

  // Clean up the mpfr state.
  mpfr_clear(m_x);
  mpfr_clear(one);
  mpfr_clear(r1);
}
