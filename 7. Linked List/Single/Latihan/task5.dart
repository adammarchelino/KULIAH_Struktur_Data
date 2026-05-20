class Node {
  int data;
  Node? next;

  Node(this.data);
}

class SingleLinkedList {
  Node? head;

  bool isEmpty() {
    return head == null;
  }

  // insert
  void insertBack(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
      return;
    }

    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }

    temp.next = newNode;
  }

  // delete berdasarkan posisi atau indeks
  void deleteByPosition(int position) {
    if (head == null) return;

    // hapus head
    if (position == 0) {
      head = head!.next;
      return;
    }

    Node? temp = head;

    // cari node sebelum yang dihapus
    for (int i = 0; i < position - 1; i++) {
      if (temp == null || temp.next == null) return;
      temp = temp.next;
    }

    // validasi posisi
    if (temp == null || temp.next == null) return;

    temp.next = temp.next!.next;
  }

  // print list
  void printList() {
    if (head == null) {
      print("List kosong");
      return;
    }

    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main() {
  SingleLinkedList list = SingleLinkedList();

  // data awal
  list.insertBack(10);
  list.insertBack(20);
  list.insertBack(30);
  list.insertBack(40);

  print("Data awal:");
  list.printList();

  // hapus node posisi
  list.deleteByPosition(2);

  print("Setelah delete posisi 2:");
  list.printList();
}
