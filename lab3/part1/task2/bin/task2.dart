import 'package:task2/task2.dart' as task2;
void main(List<String> arguments) {
  task2.globalIncrement();
  int a = 3;
  a = task2.localIncrement(a);
  print(a);
}

