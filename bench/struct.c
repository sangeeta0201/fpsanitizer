#include<stdio.h>

struct val1{
	double y;
	int z;
};
struct val{
	int x;
	double y;
	int z;
	struct val1 v;
};

double mysqrt(struct val1 v){
	double sq = v.y * v.y;
	return sq;
}
int main(){
	struct val myval;
	myval.x = 5;
	myval.y = 3.0;
	myval.z = 2;
	myval.v.y = 2;
	double sq = mysqrt(myval.v);
	printf("%e:", sq);
}
