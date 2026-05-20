void main() {
  List<int> A = [4, 7, 2, 9, 5];
  int X = 100;

  int i = 0;

  while (i < A.length) {
    if (A[i] == X) {
      print("Data ditemukan pada indeks $i");
      return;
    }
    i++;
  }

  print("Data tidak ditemukan");
}
