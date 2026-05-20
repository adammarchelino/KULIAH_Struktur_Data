int linierRekursif(List<int> arr, int n, int x) {
  if (n == 0) {
    return -1;
  } else if (arr[n - 1] == x) {
    return n - 1;
  } else {
    return linierRekursif(arr, n - 1, x);
  }
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  arr.shuffle();
  int X = 5;
  int result = linierRekursif(arr, arr.length, X);
  print("DENGAN METODE REKURSIF \n");
  print("Array: $arr");

  if (result == X) {
    print("Nilai $X ditemukan pada indeks ke-$result");
  } else {
    print("Nilai $X tidak ditemukan dalam array.");
  }
}
