class Node {
  int nodeValue;
  Node? next;
  Node(this.nodeValue) : next = null;
}

class SingleLinkedList {
  Node? head = null;

  bool isEmpty() {
    return head == null;
  }

  // Menambah node di depan
  void insertFront(int data) {
    Node newNode = Node(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  // Menambah node di belakang
  void insertBack(int data) {
    Node newNode = Node(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      Node? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  // Menambah node setelah node tertentu
  void insertAfter(Node? prevNode, int newData) {
    if (prevNode == null) {
      print("The given previous node cannot be null");
      return;
    }
    Node newNode = Node(newData);
    newNode.next = prevNode.next;
    prevNode.next = newNode;
  }

  // Menghapus node paling depan
  void deleteFront() {
    if (!isEmpty()) {
      if (head!.next != null) {
        head = head!.next;
      } else {
        head = null;
      }
    }
  }

  // Menghapus node paling belakang
  void deleteEnd() {
    if (!isEmpty()) {
      if (head!.next != null) {
        Node? bantu = head;
        while (bantu!.next!.next != null) {
          bantu = bantu.next;
        }
        bantu.next = null;
      } else {
        head = null;
      }
    }
  }

  // Menghapus node di tengah berdasarkan nilai
  void deleteMiddle(int cari) {
    if (isEmpty()) return;

    // Jika node yang dicari adalah head
    if (head!.nodeValue == cari) {
      head = head!.next;
      return;
    }

    Node? bantu = head;
    while (bantu!.next != null && bantu.next!.nodeValue != cari) {
      bantu = bantu.next;
    }

    // Guard: nilai tidak ditemukan
    if (bantu.next == null) {
      print('Node dengan nilai $cari tidak ditemukan');
      return;
    }

    Node? hapus = bantu.next;
    bantu.next = hapus!.next;
    hapus.next = null;
  }

  // Menampilkan seluruh isi linked list
  void printList() {
    if (!isEmpty()) {
      Node? now = head;
      String result = '';
      while (now != null) {
        result += '${now.nodeValue}';
        if (now.next != null) {
          result += ' --> ';
        }
        now = now.next;
      }
      result += ' -> NULL';
      print(result);
    } else {
      print('Linked List dalam kondisi kosong');
    }
  }
}

void main() {
  SingleLinkedList ll = SingleLinkedList();
  print("Data:");

  // Operasi Insertion
  ll.insertFront(10);
  ll.insertFront(30);

  print("Operasi Insertion Front of Linked List:");
  ll.printList();

  ll.insertBack(5);
  print("Operasi Insertion Back of Linked List:");
  ll.printList();

  print("Insert After Data: ");
  ll.insertAfter(ll.head!.next!.next!, 20);
  ll.printList();

  // Operasi Deletion
  print("Delete data:");
  ll.deleteEnd();
  ll.printList();

  ll.deleteMiddle(5);
  ll.printList();
}
