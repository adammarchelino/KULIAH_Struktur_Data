import "fungsi.dart";

void listterisi() {
  List<int> arr = [10, 7, 8, 9, 1, 5];
  int n = arr.length;
  quicksort(arr, 0, n - 1);
  print('Hasil Pengurutan: ');
  printArray(arr);
}

void dengangenerate() {
  List<int> arr = List.generate(10, (index) => index + 1)..shuffle();
  print('List sebelum pengurutan: ');
  printArray(arr);
  int n = arr.length;
  quicksort(arr, 0, n - 1);
  print('Hasil Pengurutan: ');
  printArray(arr);
}

void main() {
  print('Pengurutan dengan List Terisi:');
  listterisi();
  print('\nPengurutan dengan List Generate:');
  dengangenerate();
}
