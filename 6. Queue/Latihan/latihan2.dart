class MapQueue {
  final Map<String, dynamic> _data = {};
  final int _maxSize;

  MapQueue(this._maxSize);

  bool isEmpty() => _data.isEmpty;

  bool isFull() => _data.length >= _maxSize;

  void enqueue(String id, dynamic value) {
    if (isFull()) {
      print("Queue penuh! Tidak bisa menambahkan ID '$id'.");
      return;
    }
    if (_data.containsKey(id)) {
      print("ID '$id' sudah ada! ID tidak boleh duplikat.");
      return;
    }
    _data[id] = value;
    print("Enqueue: ID='$id', Value='$value' berhasil ditambahkan.");
  }

  void dequeue() {
    if (isEmpty()) {
      print("Queue kosong! Tidak ada data yang bisa dikeluarkan.");
      return;
    }
    String firstKey = _data.keys.first;
    dynamic firstValue = _data[firstKey];
    _data.remove(firstKey);
    print("Dequeue: ID='$firstKey', Value='$firstValue' berhasil dikeluarkan.");
  }

  void display() {
    if (isEmpty()) {
      print("Queue kosong!");
      return;
    }
    print("Isi Queue (front -> rear):");
    _data.forEach((id, value) {
      print("  ID='$id' | Value='$value'");
    });
  }
}

void main() {
  MapQueue queue = MapQueue(4);

  queue.enqueue("A001", "Budi");
  queue.enqueue("A002", "Siti");
  queue.enqueue("A003", "Rudi");
  queue.enqueue("A001", "Ani");
  queue.enqueue("A004", "Dewi");
  queue.enqueue("A005", "Tono");

  print("");
  queue.display();

  print("");
  queue.dequeue();
  queue.dequeue();

  queue.display();
}
