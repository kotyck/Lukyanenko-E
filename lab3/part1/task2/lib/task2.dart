int globalCounter = 0;

int globalIncrement() {
  //print(localCounter); //невозможно изза того что переменная 
                       //localCounter не определена в данной функции
  print(globalCounter);
  return globalCounter++;
}

int localIncrement(int localCounter){
  return localCounter += globalCounter;
}