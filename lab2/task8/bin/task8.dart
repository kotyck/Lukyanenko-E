import 'dart:io';
void main(List<String> arguments) {
  var input = stdin.readLineSync() as String;
  var len = input.length;
  for(int i = 0 ; i<=len ; i++){
    if (i%2==0){print(input[i]);}
  }
}
