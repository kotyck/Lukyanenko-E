import 'dart:io';

void main(List<String> arguments) {
  var input = int.parse(stdin.readLineSync() ?? '0');
  print(input == 1 ? 'true' : 'false');
}
