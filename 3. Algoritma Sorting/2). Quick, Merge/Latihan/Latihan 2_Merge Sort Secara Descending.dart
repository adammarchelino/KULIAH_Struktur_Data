void mergeSort<T extends Comparable<T>>(
  List<T> arr,
  int l,
  int r, {
  bool asc = true,
}) {
  if (l < r) {
    int med = (l + r) ~/ 2;
    mergeSort(arr, l, med, asc: asc);
    mergeSort(arr, med + 1, r, asc: asc);
    merge(arr, l, med, r, asc);
  }
}

void merge<T extends Comparable<T>>(
  List<T> arr,
  int left,
  int med,
  int right,
  bool asc,
) {
  List<T?> temp = List.filled(arr.length, null);

  int kiri1 = left;
  int kanan1 = med;
  int kiri2 = med + 1;
  int kanan2 = right;
  int i = left;

  while (kiri1 <= kanan1 && kiri2 <= kanan2) {
    bool kondisi = asc
        ? arr[kiri1].compareTo(arr[kiri2]) <= 0
        : arr[kiri1].compareTo(arr[kiri2]) >= 0;

    if (kondisi) {
      temp[i] = arr[kiri1];
      kiri1++;
    } else {
      temp[i] = arr[kiri2];
      kiri2++;
    }
    i++;
  }

  while (kiri1 <= kanan1) temp[i++] = arr[kiri1++];
  while (kiri2 <= kanan2) temp[i++] = arr[kiri2++];

  for (int j = left; j <= right; j++) arr[j] = temp[j]!;
}

void main() {
  List<int> data = [3, 9, 4, 1, 5, 2];

  print("Data sebelum diurutkan:");
  print(data);

  DateTime start = DateTime.now();

  // false = descnding, true = ascending
  mergeSort(data, 0, data.length - 1, asc: false);

  Duration elapsed = DateTime.now().difference(start);

  print("\nData setelah merge sort descending:");
  print(data);

  print("Waktu: ${elapsed.inMilliseconds} ms");
}
