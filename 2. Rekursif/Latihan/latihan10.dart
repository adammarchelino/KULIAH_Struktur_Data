// LATIHAN 10
// Jelaskan proses rekursif pada square(5), cube(5), cube(123)

int square(int n) {
  if (n == 0) return 0;
  return square(n - 1) + 2 * n - 1;
}

int cube(int n) {
  if (n == 0) return 0;
  return cube(n - 1) + 3 * (square(n)) - 3 * n + 1;
}

void main() {
  print(square(5));
  print(cube(5));
  print(cube(123));
}
