#include <iostream>
#include <iomanip>
#include <complex>
using namespace std;
__attribute__((noinline))
complex<double> foo(double beta, complex<double> c)
{
  return c / beta;
}
int main() {
  cout << std::setprecision(18 ) <<  foo(-1.0036692717208802, 1.0000057762903205) << "\n";
  cout << std::setprecision(18 ) <<  foo(-1.0036692717208802e170, 1.34353534e170) << "\n";
}
