import 'dart:io';

int fibonacci(int n) {
  if (n == 1 || n == 2) {
    return n;
  }

  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  int posisi = 7;

  print('===deret fibonacci dengan stdout.write===');
  stdout.write("Deret Fibonacci hingga posisi ke-$posisi: ");
  for (int i = 1; i <= posisi; i++) {
    stdout.write("${fibonacci(i)} ");
  }

  print('\n\n===deret fibonacci dengan print===');
  for (int i = 1; i <= posisi; i++) {
    print("Fibonacci ke-$i = ${fibonacci(i)}");
  }
}
