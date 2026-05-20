// LATIHAN 14
// Ubah fungsi berikut menjadi tail recursive:

int square(int n) {
  if (n == 0) return 0;
  return square(n - 1) + 2 * n - 1;
}

int squareTail(int n, int acc) {
  if (n == 0) return acc;
  return squareTail(n - 1, acc + (2 * n - 1));
}

void main() {
  print(squareTail(5, 0));
}
