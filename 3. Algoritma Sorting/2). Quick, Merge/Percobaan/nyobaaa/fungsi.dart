import 'dart:io';

void quicksort(List<int> arr, int kiri, int kanan) {
  if (kiri < kanan) {
    int pi = partition(arr, kiri, kanan);

    quicksort(arr, kiri, pi - 1);
    quicksort(arr, pi + 1, kanan);
  }
}

int partition(List<int> arr, int kiri, int kanan) {
  int pivot = arr[kanan];
  int i = kiri - 1;

  for (int j = kiri; j < kanan; j++) {
    if (arr[j] < pivot) {
      i++;
      swap(arr, i, j);
    }
  }

  swap(arr, i + 1, kanan);
  return i + 1;
}

void swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

void printArray(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    stdout.write("${arr[i]} ");
  }
  stdout.writeln();
}
