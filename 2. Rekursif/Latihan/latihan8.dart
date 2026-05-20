// LATIHAN 8
// Jelaskan proses rekursif untuk binarySearch berikut:

bool binarySearch(List<int> x, int start, int end, int n) {
  if (end < start) return false;
  int mid = (start + end) ~/ 2;

  if (x[mid] == n) {
    return true;
  } else {
    if (x[mid] < n) {
      return binarySearch(x, mid + 1, end, n);
    } else {
      return binarySearch(x, start, mid - 1, n);
    }
  }
}

void main() {
  List<int> data = [2, 5, 8, 10, 14, 32, 35, 41, 67, 88];
  bool hasil = binarySearch(data, 14, 0, data.length - 1);
  print(hasil);
}
