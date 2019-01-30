#include<stdio.h>

int main(){
 float e = 0.00000006f;
 float x = 0.5f;
 float y = 1.0f + x;
 float more = y + e;
 float diffe = more - y;
 float diff0 = diffe - e;
 float zero = diff0 + diff0;
 float result = 2 * zero;
 printf("result:%e", result);
}
