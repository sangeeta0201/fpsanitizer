#include<stdio.h>
#include<math.h>

double data[10];
double foo(double data[], double x){
	double sum = 0;
	for (int i =0; i< 10; i++){
		sum += sin(data[i]);
		data[i] = sqrt(sum);
	}
	data[0] = x;
	return sum;
}
int main(){
	for (int i = 0; i< 10; i++){
		data[i] = i + 0.2;
	}
	double sum = foo(data, 5);
	printf("sum:%lf", sum);
}
