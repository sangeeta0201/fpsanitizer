#include<stdio.h>

void test ( double x , double y)
{
const double y2 = x + 1.0;
if (y != y2 ) printf (" error \n" );
}
int main ()
{
const double x = .012;
const double y = x + 1.0;
test (x , y );
return 0;
}
