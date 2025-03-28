
import 'dart:io';
void main(List<String> arguments) {
  var a = int.parse(stdin.readLineSync() ?? '0');
  double b = a/4;
  print(b.ceil());
}
