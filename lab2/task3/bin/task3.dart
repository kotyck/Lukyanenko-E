import 'dart:io';
void main(List<String> arguments) {
  print('введите количество ребят:');
  var a = int.parse(stdin.readLineSync() ?? '0');
  double b = a/4;
  print('ребятам нужно машин:');
  print(b.ceil());
}
