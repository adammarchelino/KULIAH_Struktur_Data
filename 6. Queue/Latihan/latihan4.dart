import 'dart:collection';

void main() {
  Queue<int> queue = Queue<int>();

  queue.addLast(10);
  queue.addLast(20);
  queue.addLast(30);
  queue.addLast(40);
  queue.addLast(50);

  print("Isi queue: $queue");
  print("Front: ${queue.first} | Rear: ${queue.last}");
  print("Jumlah elemen: ${queue.length}");

  print("\nDequeue:");
  print("Keluar: ${queue.removeFirst()}");
  print("Keluar: ${queue.removeFirst()}");

  print("\nSisa queue: $queue");
  print("Front: ${queue.first} | Rear: ${queue.last}");

  print("\nProses semua sisa antrian:");
  while (queue.isNotEmpty) {
    print("Melayani: ${queue.removeFirst()}");
  }

  print("\nQueue kosong: ${queue.isEmpty}");
}
