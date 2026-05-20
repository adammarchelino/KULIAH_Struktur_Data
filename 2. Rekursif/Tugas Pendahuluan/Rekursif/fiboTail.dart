int fibonacciTail(int n, int a, int b) {
  if (n == 0) return a;
  return fibonacciTail(n - 1, b, a + b);
}

void main() {
  int posisiTail = 10;
  print(
    "Fibonacci ke-$posisiTail (tail recursion) = ${fibonacciTail(posisiTail, 0, 1)}",
  );
}
