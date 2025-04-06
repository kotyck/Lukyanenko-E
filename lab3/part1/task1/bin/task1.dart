import 'dart:io';
import 'package:task1/task1.dart' as task1;

void main(List<String> arguments) {
  var a = int.parse(stdin.readLineSync() ?? '0');
  print(task1.square(a));
}
