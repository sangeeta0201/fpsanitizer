#include<stdio.h>

struct complex{
	double real;
	double imag;
};
struct complex c3; 

void copy(struct complex *c1, struct complex *c2){
	c2->real = c1->real;
	c2->imag = c1->imag;
	c2->imag = c2->imag + c1->imag;
}

void clear(struct complex *c1){
	c1->real = 0;
	c1->imag = 0;
	printf("set c1 real %e %p\n", c1->real, (void *)&c1->real);
	printf("set c1 imag %e %p\n", c1->imag, (void *)&c1->imag);
}

int main(){
	struct complex *c1, *c2;
	c1 = (struct complex *)malloc(sizeof(struct complex));
	c2 = (struct complex *)malloc(sizeof(struct complex));
	c1->real = 0.2;
	c1->imag = 0.345;
	copy(c1, c2);	
	printf("c1 real:%e", c1->real);
	printf("c1 imag:%e", c1->imag);
	printf("c2 real:%e", c2->real);
	printf("c2 imag:%e", c2->imag);
	clear(c1);
	printf("c1 real:%e", c1->real);
	printf("c1 imag:%e", c1->imag);
}
