import 'dart:io';

void main() {
  print("Enter num: ");
  int? num = int.parse(stdin.readLineSync()!);

  List divisors = [];
  for (int i = 1; i <=num; i++) {
    if (num % i == 0) {
      divisors.add(i);
    }
  }
  print(divisors);
}
