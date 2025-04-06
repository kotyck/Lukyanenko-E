import 'package:task10/task10.dart' as task10;

void main(List<String> arguments) {
  var numbers2 = task10.numbers.toSet();
  task10.numbers = numbers2.toList();
  print(task10.numbers);
}
