int linearsearchiteratif(List<int> arr, int x) {
  int n = arr.length;
  for (int i = 0; i < n; i++) {
    if (arr[i] == x) {
      return i;
    }
  }
  return -1;
}

void main() {
  List<int> arr = [1, 2, 5, 4, 5, 6, 7, 8, 9, 10];
  arr.shuffle();
  int X = 5;
  int result = linearsearchiteratif(arr, X);
  print("DENGAN METODE ITERATIF \n");
  print("Array: $arr");

  if (result != -1) {
    print("Nilai $X ditemukan pada indeks ke-$result");
  } else {
    print("Nilai $X tidak ditemukan dalam array.");
  }
}
