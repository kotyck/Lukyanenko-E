import 'dart:io';

void drawSquare(int side, String fill) {
  for(int i = 0; i < side ; i++){
    for(int j = 0 ; j < side ; j++){
      stdout.write('$fill ');
    }
    print('');
  }

}
