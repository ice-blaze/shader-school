mat2 matrixPower(highp mat2 m, int n) {

  //Raise the matrix m to nth power

  // For example:
  //
  //  matrixPower(m, 2) = m * m
  //

//   int i = 0;
// while(i < 10) {
//   i = i + 1;
// }

  const int MAX_POWER = 16;

  if(n==0){
      return mat2(1.0);
  }

  highp mat2 result = m;

  // // why can't I create a loop with the parameter ?
  // //verison chum
  for(int i=1; i<MAX_POWER  ; i++){
      if(i==n){
          break;
      }
      result *= m;
  }
  // return result;
  return result;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)
