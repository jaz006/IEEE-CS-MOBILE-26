import 'dart:io';

void main() {
  print("Enter a string: ");
  String? str = stdin.readLineSync();
  String rversestr = (str ?? "").split('').reversed.join('');
  if (str == rversestr) {
    print("it's palindrome");
  } else {
    print("Not palidrome!");
  }
}
