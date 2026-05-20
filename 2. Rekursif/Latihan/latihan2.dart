// Latihan 2: Menampilkan Kombinasi Karakter dengan Rekursif

import 'dart:io';

void kombinasiKarakter(String current, int n) {
  if (n == 0) {
    stdout.write('$current ');
  } else {
    for (int i = 97; i <= 99; i++) {
      kombinasiKarakter(current + String.fromCharCode(i), n - 1);
    }
  }
}

void main() {
  stdout.write("Jumlah karakter = ");
  int n = int.parse(stdin.readLineSync()!);
  kombinasiKarakter("", n);
}
