import 'dart:io';

void main(List<String> arguments) {
  var input = int.parse(stdin.readLineSync() ?? '0');
    int sum = 0;

  for(;;){
    sum += input%10;
    input~/=10; 
    if (input == 0){break;}
  }
  print(sum);
}
