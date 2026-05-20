int binarySearch(List<int> data, int target, int low, int high) {
  if (low > high) return -1;

  int mid = (low + high) ~/ 2;

  if (data[mid] == target) {
    return mid;
  } else if (data[mid] > target) {
    return binarySearch(data, target, low, mid - 1);
  } else {
    return binarySearch(data, target, mid + 1, high);
  }
}

void main() {
  List<int> data = [2, 5, 8, 10, 14, 32, 35, 41, 67, 88, 90, 101, 109];
  int target = 10;
  int hasil = binarySearch(data, target, 0, data.length - 1);

  if (hasil != -1) {
    print("Data $target berada pada index ke–$hasil");
  } else {
    print("Data tidak ditemukan");
  }
}
