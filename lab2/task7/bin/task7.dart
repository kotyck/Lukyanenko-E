import 'dart:io';
void main(List<String> arguments) {
  var a = int.parse(stdin.readLineSync() ?? '0');
  var b = int.parse(stdin.readLineSync() ?? '0');
  var c = int.parse(stdin.readLineSync() ?? '0');
  if(a*a+b*b == c*c){ print(true); }
  else{ print(false); }
}
