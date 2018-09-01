#include <cstdlib>
#include <iostream>
#include <cmath>

double round(double v, double digit)
{
    double pow = std::pow(10.0, digit);
    double t = v * pow;
    //std::cout << "t:" << t << std::endl;
    double r = std::floor(t + 0.5);
    //std::cout << "r:" << r << std::endl;
    return r / pow;
}

int main(int argc, char *argv[])
{
    std::cout << round(4.45, 1) << std::endl;
    std::cout << round(4.55, 1) << std::endl;
}
