
#include <stdio.h>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>

static mpfr_t m_x, m_y, m_z, m_m, one, r1, r2, r3;

double x = 1e16;
double y;

int fun(){

  y = sqrt(x + 1.0) - sqrt(x);

	mpfr_add(r1, m_x, one, MPFR_RNDN);
	mpfr_add(m_m, m_x, one, MPFR_RNDN);
//  mpfr_sqrt(r2, r1, MPFR_RNDN);
//  mpfr_sqrt(r3, m_x, MPFR_RNDN);
  mpfr_sub(m_z, r2, r3, MPFR_RNDN);
  mpfr_sub(m_y, r2, r3, MPFR_RNDN);

}
int main(){
  mpfr_set_default_prec(3472);
  mpfr_init_set_d(m_x, x, MPFR_RNDN);
  mpfr_init_set_d(one, 1.0, MPFR_RNDN);
  mpfr_init(m_y);
  mpfr_init(m_z);
  mpfr_init(m_m);
  mpfr_init(r1);
  mpfr_init(r2);
  mpfr_init(r3);
	for(int i =0; i<100000000; i++){
		fun();
	}
  mpfr_clear(m_x);
  mpfr_clear(m_y);
  mpfr_clear(m_z);
  mpfr_clear(m_m);
  mpfr_clear(one);
  mpfr_clear(r1);
  mpfr_clear(r2);
  mpfr_clear(r3); 
}
