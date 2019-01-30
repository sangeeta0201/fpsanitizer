#include<stdio.h>

int main(){
  double a = 1.7; 
  double b = 1.9; 
  double x = (a  + 0.1) * 5 - (b - 0.1) * 5 ;
	double y, res;
	if( x >= 0.5){
		x = x * 100;
	}
	else{
		x = x * 100;
	}
	y = sqrt(x * 2e+53);
	if(y >= 0.5){
		res = y - 10;
	}
	else
		res = y + 10;
		printf("res:%e", res);
}     
