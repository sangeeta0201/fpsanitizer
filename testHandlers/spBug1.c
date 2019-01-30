#include<stdio.h>
#include<math.h>

#define M_PI	(3.14159265358979323846)

int main(){
	 double period, freq;
	double cosine[13][40];
    period = (double)2* 40;
    

    for (int i=0; i<13; i++) {
  freq = 2*(double)M_PI*(double)i/period;
  for (int j=0;j<40;j++){
      cosine[i][j] = (float)cos((double)(freq*(j+0.5)));  
			printf("cos:%e",cosine[i][j]);
}
    }    

}
