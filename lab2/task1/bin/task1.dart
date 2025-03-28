import 'package:task1/task1.dart' as task1;
import 'dart:io';

int a = 3; //длина прямоугольника
int b = 7; //ширина прямоугольника
void main(List<String> arguments) {
  print('введите длину прямоугольника:');
  var a = int.parse(stdin.readLineSync() ?? '0');
  print('введите ширину прямоугольника:');
  var b = int.parse(stdin.readLineSync() ?? '0');
  print('периметр прямоугольника: ${task1.perimetr(a,b)}');
  print('площадь прямоугольника: ${task1.ploshad(a,b)}');
}
