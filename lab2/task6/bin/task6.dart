import 'dart:io';
void main(List<String> arguments) {
  var a = int.parse(stdin.readLineSync() ?? '0');
  if((a+1)%2 == 0){
    print(a+1);
  }
  else{
    print(a+2);
  }
}
