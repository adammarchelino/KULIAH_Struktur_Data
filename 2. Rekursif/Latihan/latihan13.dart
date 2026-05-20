// LATIHAN 13
// Ubah ke tail recursive:

int f(int n) {
  if (n == 0) return 0;
  if (n == 1) return 1;
  if (n == 2) return 1;
  return 2 * f(n - 2) + f(n - 3);
}

int fTail(int n, int a, int b, int c) {
  if (n == 0) return a;
  if (n == 1) return b;
  if (n == 2) return c;
  return fTail(n - 1, b, c, 2 * c + b);
}

void main() {
  print(fTail(6, 1, 2, 3));
}
