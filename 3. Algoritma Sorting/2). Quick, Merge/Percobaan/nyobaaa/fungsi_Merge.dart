void mergeSort(List<int> arr, int l, int r) {
  if (l < r) {
    int m = l + ((r - l) ~/ 2);
    mergeSort(arr, l, m);
    mergeSort(arr, m + 1, r);
    merge(arr, l, m, r);
  }
}

void merge(List<int> arr, int l, int m, int r) {
  int n1 = m - l + 1;
  int n2 = r - m;

  List<int> left = List<int>.filled(n1, 0);
  List<int> right = List<int>.filled(n2, 0);

  for (int i = 0; i < n1; i++) {
    left[i] = arr[l + i];
  }
  for (int j = 0; j < n2; j++) {
    right[j] = arr[m + 1 + j];
  }

  int i = 0, j = 0, k = l;

  while (i < n1 && j < n2) {
    if (left[i] <= right[j]) {
      arr[k] = left[i];
      i++;
    } else {
      arr[k] = right[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = left[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = right[j];
    j++;
    k++;
  }
}

void printArray(List<int> arr) {
  int size = arr.length;
  for (int i = 0; i < size; i++) {
    print('${arr[i]} ');
  }//mili
  DateTime now = DateTime.now();
  print('Waktu eksekusi: $now');
}
