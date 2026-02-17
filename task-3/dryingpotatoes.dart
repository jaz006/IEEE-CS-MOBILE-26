int potatoes(int p0, int w0, int p1) {
  double dryWeight = w0 * (100 - p0) / 100;
  double finalWeight = dryWeight * 100 / (100 - p1);
  return finalWeight.toInt();
}

void main() {
  print(potatoes(99, 100, 98)); 
}