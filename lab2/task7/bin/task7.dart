import 'dart:io';
void main(List<String> arguments) {
  print('введите сторону a:');
  var a = int.parse(stdin.readLineSync() ?? '0');
  print('введите сторону b:');
  var b = int.parse(stdin.readLineSync() ?? '0');
  print('введите сторону c:');
  var c = int.parse(stdin.readLineSync() ?? '0');
  if(a*a+b*b == c*c){ print(true); }
  else{ print(false); }
}
