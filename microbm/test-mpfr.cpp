#include<stdio.h>
#include<stdlib.h>
#include<mpfr.h>
#include<stack>


std::stack<mpfr_t*> shadow_stack; 

double foo(double a, double b, int count){

  mpfr_t *m_b = shadow_stack.top();
  shadow_stack.pop();
  mpfr_t *m_a = shadow_stack.top();
  shadow_stack.pop();

  mpfr_t m_temp, tmp;
  mpfr_init_set_d(m_temp, 0.0, MPFR_RNDN);
  mpfr_init2(tmp, 1024);
  double temp = 0.0;

  mpfr_t m_const;
  mpfr_init_set_d(m_const, 0.1, MPFR_RNDN);
  
  for(int i = 0; i < count; i++){

    
    mpfr_mul(tmp, *m_a, m_const, MPFR_RNDN);
    mpfr_add(m_temp, *m_a, tmp, MPFR_RNDN);
    
    temp = a + b * 0.1;
  }

  shadow_stack.push(&m_temp);
  return temp;
}

double bar(double a, double b, int count){

  double temp = 0.0;
  for (int i = 0; i < count; i++){
    temp = a + b + 0.1;
  }
  return temp;
}


int main(int argc, char** argv){

  int count;
  double a, b;
  if (argc < 3){
    printf("insufficient arguments");
    return 0;
  }

  mpfr_set_default_prec(1024);
  mpfr_t *m_sum;
  mpfr_t m_a, m_b, m_tmp;
 

  count = atoi(argv[1]);
  a = atoi(argv[2]);
  mpfr_init_set_d(m_a, a, MPFR_RNDN);
 
  
  b = atoi(argv[3]);
  mpfr_init_set_d(m_b, b, MPFR_RNDN);
  

  double sum = 0.0f;
  mpfr_init_set_d(m_tmp, 0.0, MPFR_RNDN);
  for(int i = 0; i < count; i++){

    shadow_stack.push(&m_a);
    shadow_stack.push(&m_b);
    
    sum = sum + foo(a, b, count);
    m_sum = shadow_stack.top();
    mpfr_add(*m_sum, *m_sum, m_tmp, MPFR_RNDN);
    shadow_stack.pop();

    shadow_stack.push(&m_a);
    shadow_stack.push(&m_b);
    
    sum = sum + foo(a, b, count);
    
    m_sum = shadow_stack.top();
    shadow_stack.pop();
    
  }

  printf("The value of double is %f\n", sum);
  return 0;

}
