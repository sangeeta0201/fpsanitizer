#include <boost/math/special_functions/bessel.hpp>
#include <iostream>

int main(int argc, char** argv)
{
  double besselTerm = boost::math::cyl_bessel_j(1.5, 7.90559);
  std::cout << besselTerm << std::endl;
}
