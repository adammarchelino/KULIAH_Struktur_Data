class Node {
  int nodeValue;
  Node? next;

  Node(this.nodeValue) {
    next = null;
  }
}

class SingleLinkedList {
  Node? head;

  bool isEmpty() {
    return head == null;
  }

  // Insert di depan
  void insertFront(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  // Insert di belakang
  void insertBack(int data) {
    Node newNode = Node(data);

    if (isEmpty()) {
      head = newNode;
      return;
    }

    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }

    temp.next = newNode;
  }

  // Insert setelah node tertentu
  void insertAfter(Node? prevNode, int data) {
    if (prevNode == null) {
      print("Node sebelumnya tidak boleh null");
      return;
    }

    Node newNode = Node(data);
    newNode.next = prevNode.next;
    prevNode.next = newNode;
  }

  // Delete depan
  void deleteFront() {
    if (isEmpty()) return;

    head = head!.next;
  }

  // Delete belakang
  void deleteEnd() {
    if (isEmpty()) return;

    if (head!.next == null) {
      head = null;
      return;
    }

    Node? temp = head;
    while (temp!.next!.next != null) {
      temp = temp.next;
    }

    temp.next = null;
  }

  // Delete berdasarkan nilai
  void deleteMiddle(int cari) {
    if (isEmpty()) return;

    // kalau yang dihapus head
    if (head!.nodeValue == cari) {
      head = head!.next;
      return;
    }

    Node? temp = head;

    while (temp?.next != null && temp!.next!.nodeValue != cari) {
      temp = temp.next;
    }

    if (temp?.next != null) {
      Node? hapus = temp!.next;
      temp.next = hapus!.next;
      hapus.next = null;
    } else {
      print("Data tidak ditemukan");
    }
  }

  // Delete berdasarkan index
  void deleteAtIndex(int index) {
    if (isEmpty()) return;

    if (index == 0) {
      head = head!.next;
      return;
    }

    Node? temp = head;
    int i = 0;

    while (temp?.next != null && i < index - 1) {
      temp = temp!.next;
      i++;
    }

    if (temp?.next != null) {
      Node? hapus = temp!.next;
      temp.next = hapus!.next;
      hapus.next = null;
    } else {
      print("Index tidak valid");
    }
  }

  // Print
  void printList() {
    if (isEmpty()) {
      print("Linked List kosong");
      return;
    }

    Node? current = head;
    while (current != null) {
      print(current.nodeValue);
      current = current.next;
    }
  }
}

void main() {
  SingleLinkedList ll = SingleLinkedList();

  print("Data:");

  ll.insertFront(10);
  ll.insertFront(30);

  print("Operasi Insertion Front:");
  ll.printList();

  ll.insertBack(5);
  print("Operasi Insertion Back:");
  ll.printList();

  print("Insert After:");
  ll.insertAfter(ll.head!.next, 20);
  ll.printList();

  print("Delete Data:");
  ll.deleteEnd();
  ll.deleteMiddle(10);
  ll.printList();

  print("Delete berdasarkan index:");
  ll.deleteAtIndex(1);
  ll.printList();
}
