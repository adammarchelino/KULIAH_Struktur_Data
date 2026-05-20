import 'Rekursif/faktorial.dart';
import 'Iteratif/faktorial.dart';

void main() {
  int number = 5;
  print("Faktorial dari $number (iteratif) = ${FaktorialIteratif(number)}");
  print("Faktorial dari $number (rekursif) = ${Faktorialrekursif(number)}");
}
