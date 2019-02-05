#include<stdio.h>

double foo(double x, double y){
	double z1 = x + y;
	double z2 = x * y;
	return z1 + z2;
}

int main(){
	double x = 2.3;
	double y = 3.3;
	double z = foo(x, y);
	double sum = z + z;
	printf("sum %e:", sum);
}
