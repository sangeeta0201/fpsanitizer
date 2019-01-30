//this program demostrates rounding errors cancel, from book Accuracy and Stability
#include<stdio.h>
#include<math.h>

double f;

void algo1(double x){
	if (x == 0)	
		f = 1;
	else
		f = (exp(x)-1)/x;
}

void algo2(double x){
	double y = exp(x);
	if(y == 1)
		f = 1;
	else
		f = (y-1)/log(y);
}

int main(){
	algo1(10e-15);
	algo2(10e-15);
	algo1(9*10-8);
	algo2(9*10-8);
}
