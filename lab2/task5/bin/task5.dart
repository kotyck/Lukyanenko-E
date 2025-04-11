import 'dart:io';
void main(List<String> arguments) {
  print('введите число');
  var a = int.parse(stdin.readLineSync() ?? '0');
  print('разряд сотен: ${((a%1000)/100).floor()}');
}
