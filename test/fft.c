#include<stdio.h>
#include<math.h>
#define PI 3.14159265
int k = 20;
 
struct DFT_Coefficient {
    double real, img;
};
 
int main(int argc, char **argv) {
    int N = 2;
    double a = 1;
		double b = 2;
		double c = 3;
    int i, j;
    struct DFT_Coefficient dft_val[k];
    double cosine[N];
    double sine[N];
printf("j=%d", j); 
        printf(" 1 ( %e ) - ( %e i)\n", dft_val[j].real, dft_val[j].img);
    double function[N];
    for (i = 0; i < N; i++) {
        function[i] = (((a * (double) i) + (b * (double) i)) - c);
        //System.out.print( "  "+function[i] + "  ");
    }
    for (i = 0; i < N; i++) {
        cosine[i] = cos((2 * i * k * PI) / N);
        sine[i] = sin((2 * i * k * PI) / N);
    }
 
        printf(" 1 ( %e ) - ( %e i)\n", dft_val[j].real, dft_val[j].img);
    printf("The coefficients are: ");
    for (j = 0; j < k; j++) {
        for (i = 0; i < N; i++) {
            dft_val[j].real = function[i] * cosine[i];
            dft_val[j].img = function[i] * sine[i];
        }
        printf("( %e ) - ( %e i)\n", dft_val[j].real, dft_val[j].img);
    }
    return 0;
}
