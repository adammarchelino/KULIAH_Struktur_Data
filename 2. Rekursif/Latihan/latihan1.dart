// Latihan 1: Menampilkan Segitiga Pascal dengan Rekursif

import 'dart:io';

void main() {
  int jumlahBaris = 6;

  for (int i = 0; i < jumlahBaris; i++) {
    stdout.write('F${i + 1} \t');

    for (int s = 0; s < jumlahBaris - i; s++) {
      stdout.write('  ');
    }

    for (int j = 0; j <= i; j++) {
      stdout.write('${pascalRekursif(i, j)}   ');
    }

    print('');
  }
}

int pascalRekursif(int n, int k) {
  if (k == 0 || k == n) {
    return 1;
  }
  return pascalRekursif(n - 1, k - 1) + pascalRekursif(n - 1, k);
}
