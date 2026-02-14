import 'dart:io';

void main() {
  String? s = stdin.readLineSync();

  int mid = s!.length ~/ 2;
  String result;
  if (s.length % 2 != 0) {
    result = s[mid];
  } else {
    result = s.substring(mid - 1, mid + 1);
  }
  print(result);
}
