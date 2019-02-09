#include <stdio.h>
#include <mpfr.h>

int main(){
	double x, y, z;
	x = 2.3;
	y = 3.4;
	z = x + y;
	z += x*y;
	z /= 2;
	printf("z:%e", z);
}

