int fibonacciIteratif(int n) {
  int fibo = 0;
  int fibo1 = 1;
  int fibo2 = 1;

  if (n == 1 || n == 2) {
    return 1;
  } else {
    for (int i = 3; i <= n; i++) {
      fibo = fibo1 + fibo2;
      fibo2 = fibo1;
      fibo1 = fibo;
    }
    return fibo;
  }
}

List<int> deretFibonacciIteratif(int n) {
  List<int> deret = [];
  int fibo1 = 1;
  int fibo2 = 1;

  if (n >= 1) {
    deret.add(fibo1);
  }
  if (n >= 2) {
    deret.add(fibo2);
  }

  for (int i = 3; i <= n; i++) {
    int fibo = fibo1 + fibo2;
    deret.add(fibo);
    fibo2 = fibo1;
    fibo1 = fibo;
  }

  return deret;
}

void main() {
  int number = 7;
  print("Fibonacci dari $number (iteratif) = ${fibonacciIteratif(number)}");
  print(
    "Deret Fibonacci hingga posisi ke-$number (iteratif) = ${deretFibonacciIteratif(number)}",
  );
}
