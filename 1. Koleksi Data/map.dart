void main() {
  Map<Map<String, int>, String> mapDalamMap = {
    {'satu': 1, 'dua': 2}: 'angka satu dan dua',
    {'tiga': 3, 'empat': 4}: 'angka tiga dan empat',
  };

  print("Map dalam map versi sebaris: $mapDalamMap");

  print("Map dalam map versi perulangan:");
  for (var tiapMap in mapDalamMap.entries) {
    print("Kunci: ${tiapMap.key}, Nilai: ${tiapMap.value}");
  }
}
