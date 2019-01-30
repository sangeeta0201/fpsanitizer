#include<stdio.h>

struct complex{
	double real;
	double imag;
};
struct complex c3; 

struct complex* add(struct complex *c1, struct complex *c2){
	printf("add starts***\n");
	struct complex *c3;
	c3 = (struct complex *)malloc(sizeof(struct complex));
	c3->real = c1->real + c2->real;
	c3->imag = c1->imag + c2->imag;
	return c3;
}

struct complex* copy(struct complex *c1, struct complex *c2){
//	printf("copy starts***\n");
//	printf("set c1 real %e %p\n", c1->real, (void *)&c1->real);
//	printf("set c1 imag %e %p\n", c1->imag, (void *)&c1->imag);
	struct complex *c3;
	c2->real = c1->real;
	c2->imag = c1->imag;
}

void clear(struct complex *c1){
	printf("clear starts***\n");
	c1->real = 0;
	c1->imag = 0;
	printf("set c1 real %e %p\n", c1->real, (void *)&c1->real);
	printf("set c1 imag %e %p\n", c1->imag, (void *)&c1->imag);
}

int main(){
	struct complex *c1, *c2, *c3;
	c1 = (struct complex *)malloc(sizeof(struct complex));
	c2 = (struct complex *)malloc(sizeof(struct complex));
	c3 = (struct complex *)malloc(sizeof(struct complex));
	c1->real = 0.2;
	c1->imag = 0.345;
	copy(c1, c2);	
	c3 = add(c1, c2);	
	clear(c1);	
	copy(c1, c2);	
	c1 = add(c2, c3);	
	printf("set c1 real %e %p\n", c1->real, (void *)&c1->real);
	printf("set c1 imag %e %p\n", c1->imag, (void *)&c1->imag);
}
