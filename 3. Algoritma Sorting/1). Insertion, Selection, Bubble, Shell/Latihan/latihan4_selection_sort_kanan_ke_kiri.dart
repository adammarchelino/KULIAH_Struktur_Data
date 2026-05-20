void selectionSortAscendingRightToLeft(List<int> arr) {
  int n = arr.length;

  for (int i = n - 1; i > 0; i--) {
    int maxIndex = i;

    for (int j = 0; j < i; j++) {
      if (arr[j] > arr[maxIndex]) {
        maxIndex = j;
      }
    }

    int temp = arr[i];
    arr[i] = arr[maxIndex];
    arr[maxIndex] = temp;
  }
}

void selectionSortDescendingRightToLeft(List<int> arr) {
  int n = arr.length;

  for (int i = n - 1; i > 0; i--) {
    int minIndex = i;

    for (int j = 0; j < i; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }

    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
}

void tampilkan(List<int> data) {
  print(data);
}

void main() {
  List<int> data = [8, 3, 7, 4, 9, 2, 6, 5];

  print("Data sebelum sorting:");
  tampilkan(data);

  selectionSortAscendingRightToLeft(data);
  print("\nAscending (Kanan ke kiri):");
  tampilkan(data);

  data = [8, 3, 7, 4, 9, 2, 6, 5];

  selectionSortDescendingRightToLeft(data);
  print("\nDescending (Kanan ke kiri):");
  tampilkan(data);
}
