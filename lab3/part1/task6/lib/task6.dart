dynamic processValue(int value) {
  if(value%2 == 0){
    return '$value';
  }
  else {
    return value*value;
  }
}
