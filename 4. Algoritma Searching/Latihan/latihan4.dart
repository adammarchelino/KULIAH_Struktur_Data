void insertBefore(List<int> arr, int key, int newData) {
  int index = arr.indexOf(key);

  if (index != -1) {
    arr.insert(index, newData);
  } else {
    print("Data kunci tidak ditemukan");
  }
}

void insertAfter(List<int> arr, int key, int newData) {
  int index = arr.indexOf(key);

  if (index != -1) {
    arr.insert(index + 1, newData);
  } else {
    print("Data kunci tidak ditemukan");
  }
}

void deleteKey(List<int> arr, int key) {
  arr.remove(key);
}

void main() {
  List<int> data = [10, 20, 30, 40, 50];

  print("Data awal: $data");

  insertBefore(data, 30, 25);
  print("Setelah insert sebelum 30: $data");

  insertAfter(data, 30, 35);
  print("Setelah insert sesudah 30: $data");

  deleteKey(data, 40);
  print("Setelah hapus 40: $data");
}
