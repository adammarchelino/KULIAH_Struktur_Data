void main() {
  List<dynamic> listAngka = [1, 2, 3, "empat", 5.0, true];

  print(listAngka);
  print("Panjang dari list adalah = ${listAngka.length}");

  listAngka.add(6);
  listAngka.remove("empat");

  listAngka[3] = 4;
  print(listAngka);
}
