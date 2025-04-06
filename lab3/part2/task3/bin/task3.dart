import 'package:task3/task3.dart' as task3;

void main(List<String> arguments) {
  task3.secondHalf = [...task3.firstHalf, ...task3.secondHalf];
  print(task3.secondHalf);
}
