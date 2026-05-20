void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;

    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }

    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
}

void main() {
  List<int> data = [10, 12, 5, 90, 1, 89, 23];
  print("Data sebelum Selection Sort: $data");
  selectionSort(data);
  print("Data sesudah Selection Sort: $data");
}
