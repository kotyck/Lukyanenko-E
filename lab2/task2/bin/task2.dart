import 'package:task2/task2.dart' as task2;
import 'dart:io';

void main(List<String> arguments) {
  print('введите температуру по Фаренгейту:');
  var F = int.parse(stdin.readLineSync() ?? '0'); 
  double C = task2.celsiumToFarengeiht(F);
  print('температура по Цельсию: ${C.toStringAsFixed(2)}');
}
