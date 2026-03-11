void main() {
  List<int> nums = [1, 2, 2];
  int sum = 0;
  for (int i = 0; i < nums.length; i++) {
    sum += nums[i] * nums[i];
  }
  print(sum);
}
