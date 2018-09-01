#include <iostream>

const float FACTOR = 0.01745329251994329576923690768489f;

unsigned long long hoursToMicrosecs(int hours)

{

 return hours * 3600 * 1000000LL;
}

float degToRad(float deg)

{

 return deg * FACTOR;
}

float f(int u1, int u2)

{

 float percent = ((u1 - u2) / 1000.0f) / (hoursToMicrosecs(24) / 1000000.0f);
 return degToRad(percent * 360);
}

int main()

{

 auto result = f(3600000, 35063681);
 std::cout<<result<<'\n';
 return (result > -3.0f) ? 0 : -1;
} 
