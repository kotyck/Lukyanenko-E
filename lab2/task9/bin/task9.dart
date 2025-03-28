import 'dart:io';
void main(List<String> arguments) {
  final input = stdin.readLineSync() as String;
  String output = '';
  for(int i = input.length-1 ; i >= 0 ; i--){
    output += input.substring(i,i+1);
  }
  print(output);
}
