int dblLinear(int n) {
  List<int> u = [1];
  int i = 0;
  int j = 0;
  while (u.length <= n) {
    int next1 = u[i] * 2 + 1;
    int next2 = u[j] * 3 + 1;

    int next;
    if (next1 < next2) {
      next = next1;
      i++;
    } else if (next2 < next1) {
      next = next2;
      j++;
    } else {
      next = next1;
      i++;
      j++;
    }

    u.add(next);
  }

  return u[n];
}

void main() {
  print(dblLinear(10));
}
