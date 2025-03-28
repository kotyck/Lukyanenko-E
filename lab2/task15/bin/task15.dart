import 'dart:io';

void main(List<String> arguments) {
  var input = int.parse(stdin.readLineSync() ?? '0');
  for(; input > 0 ;){
    input--;
    print(input);
  }
}
