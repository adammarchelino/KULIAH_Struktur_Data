import "fungsi_Merge.dart";

void main() {
  List<int> data = List<int>.generate(50000, (index) => index + 1)..shuffle();
  print('List sebelum pengurutan:');
  printArray(data);
  mergeSort(data, 0, data.length - 1);
  print('List setelah pengurutan:');
  printArray(data);
}
