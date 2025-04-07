import 'package:task9/task9.dart' as task9;

void main(List<String> arguments) {
  var words5 = task9.words.where( (word) => word.length > 5 );
  print(words5);
  print(task9.words.any((element) => element.startsWith('A')));
}
