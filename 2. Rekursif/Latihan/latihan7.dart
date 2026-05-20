// LATIHAN 7
// Jelaskan proses rekursif untuk program berikut:

import 'dart:io';

bool search(List<int> x, int size, int n) {
  if (size > 0) {
    if (x[size - 1] == n) {
      return true;
    } else {
      return search(x, size - 1, n);
    }
  }
  return false;
}

void main() {
  List<int> x = [1, 2, 3, 4, 5];
  stdout.write("Masukkan angka yang ingin dicari: ");
  int n = int.parse(stdin.readLineSync()!);

  bool ketemu = search(x, x.length, n);

  if (ketemu) {
    print("Angka $n ditemukan dalam array.");
  } else {
    print("Angka $n tidak ditemukan dalam array.");
  }
}
