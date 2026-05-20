import "dart:io";

void bubbleSort(List<int> arr) {
  int n = arr.length;
  print("Panjang array: $n");
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] < arr[j + 1]) {
        // untuk dituker
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void printArray(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    stdout.write("${arr[i]} ");
  }
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];

  print("Array sebelum diurutkan\t:$arr");
  bubbleSort(arr);
  print("Array setelah diurutkan\t:$arr");
  printArray(arr);
}
