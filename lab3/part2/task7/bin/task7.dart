import 'package:task7/task7.dart' as task7;

void main(List<String> arguments) {
  task7.products["помидоры"] = 15;
  task7.products["яблоки"] = 1;
  print(task7.products);
  task7.products.clear();
}
