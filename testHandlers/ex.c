#include<stdio.h>

int main(){
	double x = 0.001;
	double y = cos(x);
	double z = 1 - cos(x);
	printf("y:%e", y);
	printf("z:%e", z);
}
