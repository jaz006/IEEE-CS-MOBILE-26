void main() {
  String s1 = "hello,";
  String s2 = " i'm jaz";
  String s3 = s1 + s2;
  print("concatenated: "+s3);
  print("length: ${s3.length}");
  print("substrin: "+s3.substring(11));
  print("uppercase: "+s3.toUpperCase());
  print("lowercase: "+s3.toLowerCase());
}
