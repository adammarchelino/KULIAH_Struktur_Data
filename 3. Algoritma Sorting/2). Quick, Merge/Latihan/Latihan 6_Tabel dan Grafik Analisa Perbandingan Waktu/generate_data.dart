import 'dart:io';
import 'dart:math';

void generateCSV(int jumlahData) {
  Random rand = Random();

  List<int> data = [];

  for (int i = 0; i < jumlahData; i++) {
    data.add(rand.nextInt(1000000));
  }

  File("data/$jumlahData.csv").writeAsStringSync(data.join(','));

  print("File $jumlahData.csv berhasil dibuat");
}

void main() {
  List<int> ukuran = [
    50000,
    100000,
    150000,
    200000,
    250000,
    300000,
    350000,
    400000,
    450000,
    500000,
  ];

  for (var u in ukuran) {
    generateCSV(u);
  }
}
