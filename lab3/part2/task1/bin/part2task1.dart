List<int> numbers = [];
Map<int, int> squareNumbers = {}; 
void main(List<String> arguments) {
  int a = 4;
  for(int i = 0 ; i < 10 ; i++){
    numbers.add(a);
    a++;  
  }

  print('первый элемент: ${numbers[0]} ');
  print('последнй элемент: ${numbers[numbers.length-1]}');
  print('длина: ${numbers.length}');

  for(int i = 0 ; i < 10 ; i++){
    squareNumbers[i] = numbers[i]*numbers[i];
  }
  print(squareNumbers);
}
