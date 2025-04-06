import 'package:task6/task6.dart' as task6;

void main(List<String> arguments) {
  task6.students.forEach(( key, value){
    if(value >= 75  ){ print('$key - $value'); }
  });
}
