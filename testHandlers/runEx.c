#include<stdio.h>

int main(){
	//double a = 0.732; //0.70
	double a = 0.256; //0.70
	double b = 0.59005099; //0.59005089
 	double c = 0.34;
	double x1 = (-b + sqrt(b*b - 4*a*c))/(2*a); //-1.151994e
	double x2 = (-b - sqrt(b*b - 4*a*c))/(2*a); //-1.152892e
	
	double x = x1 * x1 * x1 * x1;  //1.761171e 
	double y = x2 * x2 * x2 * x2;  //1.761171e 
	if(x < 1.76){
		printf("x:%e\n", x);
	} 
	else
		printf("y:%e\n", y);
	printf("x1:%e\n", x1);
	printf("x2:%e\n", x2);
	printf("x:%e\n", x);
		printf("y:%e\n", y);
}
