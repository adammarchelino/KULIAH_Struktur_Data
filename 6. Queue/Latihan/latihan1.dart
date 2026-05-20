class CircularQueue {
  late List<int> _data;
  int _front = -1;
  int _rear = -1;
  int _maxSize;

  CircularQueue(this._maxSize) {
    _data = List.filled(_maxSize, 0);
  }

  bool isEmpty() {
    return _front == -1;
  }

  bool isFull() {
    return (_rear + 1) % _maxSize == _front;
  }

  void enqueue(int value) {
    if (isFull()) {
      print("Queue penuh! gabisa menambahkan $value");
      return;
    }
    if (isEmpty()) {
      _front = 0;
    }
    _rear = (_rear + 1) % _maxSize;
    _data[_rear] = value;
    print("Enqueue: $value berhasil ditambahno");
  }

  int dequeue() {
    if (isEmpty()) {
      print("Queue kosong! Tidak ada data dalam antrian");
      return -1;
    }
    int value = _data[_front];
    if (_front == _rear) {
      _front = -1;
      _rear = -1;
    } else {
      _front = (_front + 1) % _maxSize;
    }
    print("Dequeue: $value berhasil dikeluarkan");
    return value;
  }

  void display() {
    if (isEmpty()) {
      print("Queue Kosonk");
      return;
    }
    print("Isi Queue (front -> rear):");
    int i = _front;
    while (true) {
      print("[$i] = ${_data[i]}");
      if (i == _rear) break;
      i = (i + 1) % _maxSize;
    }
  }
}

void main() {
  CircularQueue queue = CircularQueue(5);

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.enqueue(50);

  queue.display();

  print("");
  queue.dequeue();
  queue.dequeue();

  queue.display();

  print("");
  queue.enqueue(60);
  queue.enqueue(70);

  queue.display();
}
