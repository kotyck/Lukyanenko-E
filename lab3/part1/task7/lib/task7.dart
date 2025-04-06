int factorial(int value) {
  if(value == 1){
    return value;
  }
  return value * factorial(value-1);
}
