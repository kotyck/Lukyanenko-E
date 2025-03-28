import 'package:task18/task18.dart' as task18;

void main(List<String> arguments) {
  int chet = 0, nechet = 0;
  for(int i = 0;i<task18.numbers.length;i++){
    if(task18.numbers[i]%2==0){ chet++; }
    else{ nechet++; }
  }
  print('четных чисел: ${chet}');
  print('нечетных чисел: ${nechet}');
}
