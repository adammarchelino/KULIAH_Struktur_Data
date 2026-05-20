void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> data = [90, 12, 6, 21, 1, 54, 7];
  print("Data sebelum Bubble Sort: $data");
  bubbleSort(data);
  print("Data sesudah Bubble Sort: $data");
}
