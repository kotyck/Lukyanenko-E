import 'dart:io';

void main(List<String> arguments) {
  print('введите номер месяца:');
  var input = stdin.readLineSync() as String;
  switch(input){
    case '1': print('January'); break;
    case '2': print('February');break;
    case '3': print('March');break;
    case '4': print('April');break;
    case '5': print('May');break;
    case '6': print('June');break;
    case '7': print('July');break;
    case '8': print('August');break;
    case '9': print('September');break;
    case '10': print('October');break;
    case '11': print('November');break;
    case '12': print('december');break;
    default:print('нет месяца с таким номером!');break;
  }
}
