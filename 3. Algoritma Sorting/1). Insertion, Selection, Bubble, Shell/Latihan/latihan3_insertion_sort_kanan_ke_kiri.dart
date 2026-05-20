void insertionSortAscendingRightToLeft(List<int> arr) {
  for (int i = arr.length - 2; i >= 0; i--) {
    int key = arr[i];
    int j = i + 1;

    while (j < arr.length && arr[j] < key) {
      arr[j - 1] = arr[j];
      j++;
    }
    arr[j - 1] = key;
  }
}

void insertionSortDescendingRightToLeft(List<int> arr) {
  for (int i = arr.length - 2; i >= 0; i--) {
    int key = arr[i];
    int j = i + 1;

    while (j < arr.length && arr[j] > key) {
      arr[j - 1] = arr[j];
      j++;
    }
    arr[j - 1] = key;
  }
}

void tampilkan(List<int> data) {
  print(data);
}

void main() {
  List<int> data = [8, 3, 7, 4, 9, 2, 6, 5];

  print("Data sebelum sorting:");
  tampilkan(data);

  insertionSortAscendingRightToLeft(data);
  print("\nAscending (Kanan ke kiri):");
  tampilkan(data);

  data = [8, 3, 7, 4, 9, 2, 6, 5];

  insertionSortDescendingRightToLeft(data);
  print("\nDescending (Kanan ke kiri):");
  tampilkan(data);
}
