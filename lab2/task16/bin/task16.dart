import 'dart:io';

void main(List<String> arguments) {
  var input = stdin.readLineSync() as String;
  String line = '';
  for(int i = input.length-1 ; i >= 0 ; i--){
    line += input.substring(i,i+1);
  }
  if (input == line){
    print('YES');
  }
  else{
    print('NO');
  }
}
