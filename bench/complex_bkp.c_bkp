#include <stdio.h>
typedef struct complex
{
    double real;
    double imag;
} complex;
complex add(complex n1,complex n2);

int main()
{
    complex n1, n2, temp, temp1;
		n1.real = 2.3;
		n1.imag = 1.1;

		n2.real = 3.1;
		n2.imag = 4.5;

    temp = add(n1, n2);
    temp1 = add(n1, temp);
    printf("Sum = %.1f + %.1fi\n", temp.real, temp.imag);
    printf("Sum = %.1f + %.1fi\n", temp1.real, temp1.imag);

    return 0;
}

complex add(complex n1, complex n2)
{
      complex temp;

      temp.real = n1.real + n2.real;
      temp.imag = n1.imag + n2.imag;

      return(temp);
}
