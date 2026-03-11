import 'dart:io';

bool tidyNumber(n) {
  String s = n.toString();
  for (int i = 0; i <s.length -1; i++) {
    if (s[i].compareTo(s[i + 1]) > 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int n = int.parse(stdin.readLineSync()!);
  print(tidyNumber(n));
}
