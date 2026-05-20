void main() {
  List<int> angka = [10, 20, 30, 40, 50];
  print(angka);
  print("Panjang dari list adalah = ${angka.length}");

  angka.add(60);
  angka.remove(20);
  print(angka);

  int lastIndex = angka.lastIndexOf(40);
  print("Indeks terakhir dari 40 adalah: $lastIndex");

  angka.sort();
  print("List setelah diurutkan: $angka");

  angka.reversed;
  print("List setelah dibalik: ${angka.reversed.toList()}");
}
