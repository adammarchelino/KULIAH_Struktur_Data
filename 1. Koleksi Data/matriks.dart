void main() {
  List<List<int>> matriks = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  List<List<int>> matriks2 = [
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
  ];

  List<List<int>> hasil = [];

  for (int i = 0; i < matriks.length; i++) {
    List<int> barisHasil = [];
    print(barisHasil);

    for (int j = 0; j < matriks[i].length; j++) {
      barisHasil.add(matriks[i][j] + matriks2[i][j]);
      print(barisHasil);
    }
    hasil.add(barisHasil);
  }

  print("Sebelum penjumlahan matriks:");
  for (var baris in matriks) {
    print(baris);
  }
  print("Matriks kedua:");
  for (var baris in matriks2) {
    print(baris);
  }

  print("Hasil penjumlahan matriks:");
  for (var baris in hasil) {
    print(baris);
  }
}
