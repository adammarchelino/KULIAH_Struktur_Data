void sequentialSearchAll(List<int> arr, int key) {
  bool found = false;

  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == key) {
      print("Data ditemukan pada indeks ke: $i");
      found = true;
    }
  }

  if (!found) {
    print("Data tidak ditemukan");
  }
}

void main() {
  List<int> data = [2, 5, 7, 5, 9, 5, 12];
  data.shuffle();
  print("Data: $data");
  int key = 5;

  sequentialSearchAll(data, key);
}
