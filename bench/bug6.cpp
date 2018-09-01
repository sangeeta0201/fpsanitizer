#include <iostream>
int main()
{
    static const long long s_constant = 60 * 60 * 1000 * 1000ll;
    std::cout << s_constant << std::endl;
    std::cout << static_cast<double>(s_constant) << std::endl;
    return 0;
}
