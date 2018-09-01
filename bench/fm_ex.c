#include <math.h>
#include <stdio.h>
#include <stdlib.h>


int main(int argc, char **argv) {
    double a = 1.12e17;
    double b = 12.34;
	printf("fabs(a): %g", fabs(a));
	printf("fabs(b): %g", fabs(b));
    if (fabs(a) < fabs(b)) { 
			printf("inside if\n");
			double t = b; 
			b = a; 
			a = t; 
		}
    double e = ((a + b) - a) - b;
    printf("addition error for `%g + %g`: %g\n", a, b, e);
    return 0;
}
