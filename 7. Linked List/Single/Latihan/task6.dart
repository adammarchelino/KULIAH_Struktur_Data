import 'dart:collection';

base class MyNode extends LinkedListEntry<MyNode> {
  int data;

  MyNode(this.data);
}

void main() {
  LinkedList<MyNode> list = LinkedList<MyNode>();

  // Penambahan node
  var n1 = MyNode(10);
  var n2 = MyNode(20);
  var n3 = MyNode(30);

  list.add(n1); // tambah di belkang
  list.add(n2); // tambah di belkang
  n2.insertAfter(n3); // tambah di tengah

  // tambah di depan
  var n0 = MyNode(5);
  list.first.insertBefore(n0);

  print("Setelah penambahan:");
  for (var node in list) {
    print(node.data);
  }

  // Penghapusan node
  list.first.unlink(); // hapus dpan
  list.last.unlink(); // hapus belakang
  n2.unlink(); // hapus tengah

  print("Setelah penghapusan:");
  for (var node in list) {
    print(node.data);
  }
}
