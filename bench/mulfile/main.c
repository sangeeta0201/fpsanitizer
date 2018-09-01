#include<stdio.h>
double myMin(double x, double y){                                                 
  if(x < y)
    return x;
  else
    return y;
}
int main(){
	double x = 0.2;
	double y = 0.5;
	myMin(x,y);
}
