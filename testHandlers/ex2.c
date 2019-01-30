#include<stdio.h>

float foo(float x, float y){
	return x * y;
}

int main(){
	float x = 2.3;
	float y = 0.345;
	float z = foo(x, y);
	printf("z:%e", z);
}
