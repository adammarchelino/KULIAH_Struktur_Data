import 'dart:io';
import 'fungsi_sorting.dart';

List<int> readCSV(String path) {
  String content = File(path).readAsStringSync();

  List<String> data = content.split(',');

  return data.map((e) => int.parse(e)).toList();
}

void testSorting(List<int> data, String nama, Function sortFunction) {
  List<int> copy = List.from(data);

  DateTime start = DateTime.now();

  sortFunction(copy);

  Duration waktu = DateTime.now().difference(start);

  print("$nama : ${waktu.inMilliseconds} ms");
}

void main() {
  List<int> ukuran = [
    50000,
    100000,
    150000,
    200000,
    250000,
    300000,
    350000,
    400000,
    450000,
    500000,
  ];

  for (var u in ukuran) {
    print("\n===== DATA $u =====");

    List<int> data = readCSV("data/$u.csv");

    testSorting(data, "Insertion", insertionSort);
    testSorting(data, "Selection", selectionSort);
    testSorting(data, "Bubble", bubbleSort);
    testSorting(data, "Shell", shellSort);

    List<int> quickData = List.from(data);
    DateTime start = DateTime.now();
    quickSort(quickData, 0, quickData.length - 1);
    print("Quick : ${DateTime.now().difference(start).inMilliseconds} ms");

    List<int> mergeData = List.from(data);
    start = DateTime.now();
    mergeSort(mergeData, 0, mergeData.length - 1);
    print("Merge : ${DateTime.now().difference(start).inMilliseconds} ms");
  }
}
