void main() {
  Set<String> buah = {'apel', 'jeruk', 'mangga'};
  print(buah);
  print("Panjang dari set adalah = ${buah.length}");

  buah.add('pisang');
  buah.remove('jeruk');
  print(buah);

  bool containsMangga = buah.contains('mangga');
  print("Apakah set mengandung mangga? $containsMangga");

  buah.add('apel');
  print("Set setelah mencoba menambahkan apel lagi: $buah");

  buah.clear();
  print("Set setelah dihapus semua elemennya: $buah");

  //cara membuat set didalam set
  Set<Set<String>> setDalamSet = {
    {'satu', 'dua'},
    {'tiga', 'empat'},
  };

  print("Set dalam set versi sebaris: $setDalamSet");
  for (var tiapset in setDalamSet) {
    print("Set dalam set versi perulangan: $tiapset");
  }

  //menggabungkan set yang pertama dan kedua sebelumnya
  Set<Set<String>> gabungan = {
    {'lima', 'enam'},
    {'tujuh', 'delapan'},
  };
  setDalamSet = setDalamSet.union(gabungan);
  print("Set setelah digabungkan: $setDalamSet");
}
