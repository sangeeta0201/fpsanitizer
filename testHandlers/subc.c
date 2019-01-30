int main() {
  float x = 0.1;
  float constant = 10000.0;
  for (int i = 0; i < 1000; i++)
		x++;
  printf("x=%.20g\n", x); 
	float y = 0.1*constant;
	float z = x - y;
  printf("x=%.20g\n", x); 
  printf("y=%.20g\n", y); 
  printf("z=%.20g\n", z); 
}
