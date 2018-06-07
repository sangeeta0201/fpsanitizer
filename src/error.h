
double updateError(Real *realVal, double computedVal){
  double shadowRounded = getDouble(realVal);
  unsigned long ulpsError = ulpd(shadowRounded, computedVal);

  double bitsError = log2(ulpsError + 1);


  // Debug printing code

//  std::cout<<"\nThe shadow value is "<<"\n";
 // printReal(realVal);
     
  if (shadowRounded != shadowRounded){
    printf("The rounded shadow value is NaN");
  } else {
    printf("The rounded shadow value is ");
    ppFloat(shadowRounded);
  }
  if (computedVal != computedVal){
    printf(", but NaN was computed.\n");
  } else {
      printf(", but ");
      ppFloat(computedVal);
      printf(" was computed.\n");
    }
    printf("%f bits error (%llu ulps)\n",
                bitsError, ulpsError);
  return bitsError;
}

void ppFloat(double val){                                                                                                         
  int i = 0;
  if (val != val){
    printf("+nan.0");
  } else if (val == INFINITY){
    printf("+inf.0");
  } else if (val == -INFINITY){
    printf("-inf.0");
  } else if (val > 0 && val < 1){
    while (val < 1) {
      val *= 10;
      i++;
    }
    printf("%fe-%d", val, i);
  } else if (val < 0 && val > -1){
    while (val > -1) {
      val *= 10;
      i++;
    }
    printf("%fe-%d", val, i);
  } else if (val >= 9.9999999){
    while (val >= 9.9999999){
      val /= 10;
      i++;
    }
    printf("%fe%d", val, i);
  } else if (val <= -9.9999999){
    while (val <= -9.9999999){
      val /= 10;
      i++;
    }
    printf("%fe%d", val, i);
  } else {
    printf("%f", val);
  }
}
unsigned long ulpd(double x, double y){
  if (x == 0) x = 0; // -0 == 0
  if (y == 0) y = 0; // -0 == 0

  /* if (x != x && y != y) return 0; */
  if (x != x) return ULLONG_MAX - 1; // Maximum error
  if (y != y) return ULLONG_MAX - 1; // Maximum error

  long long xx = *((long long*) &x);
  xx = xx < 0 ? LLONG_MIN - xx : xx;

  long long yy = *((long long*) &y);
  yy = yy < 0 ? LLONG_MIN - yy : yy;

  return xx >= yy ? xx - yy : yy - xx;
}
void printError(size_t result_A, double y){
  if(shadowMap.count(result_A) != 0){
      Real* resReal = shadowMap.at(result_A);
      std::cout<<"Result using mpfr:\n";
      mpfr_out_str (stdout, 10, 0, resReal->mpfr_val, MPFR_RNDD);
      std::cout<<"\n";

      double ulpsError = updateError(resReal, y);
      std::cout<<"ulpsError:"<<ulpsError<<"\n";
  }
} 
