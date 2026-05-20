void shellSort(List<int> arr) {
  int gap = arr.length ~/ 2;

  while (gap > 0) {
    for (int i = gap; i < arr.length; i++) {
      int temp = arr[i];
      int j = i;

      while (j >= gap && arr[j - gap] > temp) {
        arr[j] = arr[j - gap];
        j -= gap;
      }

      arr[j] = temp;
    }

    gap ~/= 2;
  }
}

void main() {
  List<int> data = [34, 12, 5, 90, 1, 54, 23];
  print("Data sebelum Shell Sort: $data");
  shellSort(data);
  print("Data sesudah Shell Sort: $data");
}
