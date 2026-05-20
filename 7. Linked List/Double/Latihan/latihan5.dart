import 'dart:io';

class DNode<T> {
  T? value;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.value);
}

class DoubleLinkedList<T> {
  DNode<T>? head;

  bool isEmpty() => head == null;

  DNode<T>? searchNode(DNode<T> target) {
    DNode<T>? curr = head;
    while (curr != null) {
      if (curr.value == target.value) return curr;
      curr = curr.next;
    }
    return null;
  }

  void tambahNodeAkhir(DNode<T> newNode) {
    if (isEmpty()) {
      head = newNode;
      return;
    }
    DNode<T>? curr = head;
    while (curr!.next != null) {
      curr = curr.next;
    }
    curr.next = newNode;
    newNode.prev = curr;
  }

  @override
  String toString() {
    List<T?> data = [];
    DNode<T>? curr = head;
    while (curr != null) {
      data.add(curr.value);
      curr = curr.next;
    }
    return data.toString();
  }
}

void main() {
  var dll = DoubleLinkedList<int>();

  stdout.write("Masukkan jumlah data: ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    stdout.write("Masukkan data : ");
    int val = int.parse(stdin.readLineSync()!);
    dll.tambahNodeAkhir(DNode(val));
  }

  stdout.write("\nMasukkan nilai yang ingin dicari: ");
  int cari = int.parse(stdin.readLineSync()!);

  var hasil = dll.searchNode(DNode(cari));

  if (hasil != null) {
    int index = 0;
    DNode<int>? curr = dll.head;

    while (curr != null && curr.value != hasil.value) {
      curr = curr.next;
      index++;
    }

    print("Node ditemukan pada indeks ke-$index dengan nilai ${hasil.value}");
    print("\nIsi Double Linked List: ${dll}");
  } else {
    print("Node tidak ditemukan");
  }
}
