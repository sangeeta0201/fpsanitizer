#include <iostream>
#include <cstdint>
#include <cmath>
#include <math.h>

void TransposeToFrequency(int32_t transpose, int32_t finetune)
{
    float exp = (transpose * 128.0f + finetune) * (1.0f / (12.0f * 128.0f));
    float float_result = std::pow(2.0f, exp);
    double double_result = std::pow(2.0, static_cast<double>(exp));
    double absolute_error = std::abs(double_result - float_result);
    double relative_error = absolute_error / double_result;
    if(relative_error > 0.01) {
        std::cout << "float  std::pow(" << 2.0f << ", " << exp << ") = " << float_result << std::endl;
        std::cout << "double std::pow(" << 2.0 << ", " << exp << ") = " << double_result << std::endl;
        std::cout << "absolute error: " << absolute_error << std::endl;
        std::cout << "relative error: " << relative_error << std::endl;
        std::cout << std::endl;
    }
}

int main(int, char**)
{

    uint32_t transposeToFrequency[] = // expected values as calculated by MSVC on x86
    {
              5,       5,       5,       5,
             31,      32,      33,      34,
            196,     202,     207,     214,
           1243,    1280,    1317,    1356,
           7894,    8125,    8363,    8608,
          50121,   51590,   53102,   54658,
         318251,  327576,  337175,  347055,
        2020767, 2079980, 2140928, 2203663,
    };
    size_t freqIndex = 0;
    for(int32_t transpose = -128; transpose < 128; transpose += 32)
    {
        for(int32_t finetune = -128; finetune < 128; finetune += 64, freqIndex++)
        {
               TransposeToFrequency(transpose, finetune);
        }
    }

    return 0;
}
