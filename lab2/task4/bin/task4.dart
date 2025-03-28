
import 'dart:io';
void main(List<String> arguments) {
  var a = int.parse(stdin.readLineSync() ?? '0');
  print(a%10);
}
