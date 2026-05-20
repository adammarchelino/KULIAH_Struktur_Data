import 'Iteratif/Fibonacci.dart';
import 'Rekursif/fibonacci.dart';

void main() {
  int number = 7;
  print("Fibonacci dari $number (iteratif) = ${fibonacciIteratif(number)}");
  print("Fibonacci dari $number (rekursif) = ${fibonacci(number)}");
}
