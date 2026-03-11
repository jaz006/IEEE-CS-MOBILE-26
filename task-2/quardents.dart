import 'dart:io';

void main() {
  int? x = int.parse(stdin.readLineSync()!);
  int? y = int.parse(stdin.readLineSync()!);

  int quadrant;
  if (x > 0 && y > 0) {
    quadrant = 1;
  } else if (x < 0 && y > 0) {
    quadrant = 2;
  } else if (x < 0 && y < 0) {
    quadrant = 3;
  } else {
    quadrant = 4;
  }

  print(quadrant);
}
