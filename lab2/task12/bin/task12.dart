import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  var input = int.parse(stdin.readLineSync() ?? '0');
  int out = 1;
  for(; pow(out, 2) <= input ;){
    print(pow(out, 2));
    out++;
  }
}
