void quickSortDescending<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int q;
  if (p < r) {
    q = partitionDescending(arr, p, r);
    quickSortDescending(arr, p, q);
    quickSortDescending(arr, q + 1, r);
  }
}

int partitionDescending<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int i, j;
  T pivot, temp;

  pivot = arr[p];
  i = p;
  j = r;

  while (i <= j) {
    while (pivot.compareTo(arr[j]) > 0) j--;
    while (pivot.compareTo(arr[i]) < 0) i++;

    if (i < j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      i++;
      j--;
    } else {
      return j;
    }
  }
  return j;
}

void main() {
  List<int> data = [35, 12, 87, 22, 9, 51, 31, 72, 18, 6];

  print("Data sebelum diurutkan:");
  print(data);

  DateTime start = DateTime.now();

  quickSortDescending(data, 0, data.length - 1);

  Duration elapsed = DateTime.now().difference(start);

  print("\nData setelah quick sort descending:");
  print(data);

  print("Waktu: ${elapsed.inMilliseconds} ms");
}
