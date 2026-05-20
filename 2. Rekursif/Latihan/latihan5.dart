// LATIHAN 5
// Jelaskan proses rekursif untuk program berikut:

import 'dart:io';

void decToBin(int num) {
  if (num > 0) {
    decToBin(num ~/ 2);
    stdout.write(num % 2);
  }
}

void main() {
  stdout.write("Masukkan angka desimal: ");
  int num = int.parse(stdin.readLineSync()!);
  print("Biner dari $num adalah: ");
  decToBin(num);
}
