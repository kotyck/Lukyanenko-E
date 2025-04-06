import 'package:task8/task8.dart' as task8;

void main(List<String> arguments) {
  double sum = 0;
  task8.math.forEach((key,value){
    sum += value;
  });
  sum /= task8.math.length;
  print('средний балл:${sum.toStringAsFixed(2)}');
}
