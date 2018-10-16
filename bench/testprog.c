
#include <stdio.h>
/* #include "../FpDebug/valgrind/fpdebug/fpdebug.h" */
#include <math.h>
#include <gmp.h>
#include <mpfr.h>


int main(void){
	mpfr_t m_x, m_y, one, r1, r2, r3;
  double x, y;
  printf("Sanity checking the fpdebug functionality...\n");

  x = 1e16;
  y = sqrt(x + 1.0) - sqrt(x);

  // Recompute that same formula in arbitrary precision.
  mpfr_set_default_prec(3472);
  mpfr_init_set_d(m_x, x, MPFR_RNDN);
  mpfr_init_set_d(one, 1.0, MPFR_RNDN);
  mpfr_init(m_y);
  mpfr_init(r1);
  mpfr_init(r2);
  mpfr_init(r3);

  mpfr_add(r1, m_x, one, MPFR_RNDN);
  mpfr_sqrt(r2, r1, MPFR_RNDN);
  mpfr_sqrt(r3, m_x, MPFR_RNDN);
  mpfr_sub(m_y, r2, r3, MPFR_RNDN);

  // Print out the normal precision (64-bit in this case) result.
  printf("The computed value of y is %e\n",y);
  
  // Here, when running under fpdebug, we get the shadow value as
  // computed by fpdebug.
  /* VALGRIND_INSERT_SHADOW(&y); */
  /* printf("The inserted shadow value of y is %e\n", y); */
  
  // Print out he value as computed by MPFR here.
  printf("The actual value of y is %e\n", mpfr_get_d(m_y, MPFR_RNDN));

  // Clean up the mpfr state.
  mpfr_clear(m_x);
  mpfr_clear(m_y);
  mpfr_clear(one);
  mpfr_clear(r1);
  mpfr_clear(r2);
  mpfr_clear(r3); 
}
