import 'dart:io';

class Dnode<T> {
  T nodeValue;
  Dnode? next, prev;

  Dnode(this.nodeValue) : next = null, prev = null;
}

// inisiasi class
class DoubeLinkedList<T> {
  Dnode? head, tail;

  // fungsi pengecekan jika kosong
  bool isEmpty() {
    return head == null && tail == null;
  }

  // fungsi insert dari depan
  void InsertFront(T data) {
    Dnode newNode = Dnode(data);
    if (isEmpty()) {
      head = tail = newNode;
      head!.next = null;
      head!.prev = null;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  // fungsi insert dari belakang
  void insertBack(T data) {
    Dnode newNode = Dnode(data);
    if (isEmpty()) {
      head = tail = newNode;
      head!.next = null;
      head!.prev = null;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  // masuk tengahh
  void insertMiddle(T data, int index) {
    if (index <= 0) {
      print("indeks -1");
      return;
    }

    Dnode? current = head;
    int i = 0;

    while (current != null && i < index - 1) {
      current = current.next;
      i++;
    }

    if (current == null || current.next == null) {
      print("${index} itu melebihi");
      return;
    }

    Dnode newNode = Dnode(data);
    newNode.next = current.next;
    newNode.prev = current;
    current.next!.prev = newNode;
    current.next = newNode;
  }

  // hapus depan
  void deleteFront() {
    if (isEmpty()) {
      stdout.writeln('List kosong');
      return;
    }

    if (head == tail) {
      head = tail = null;
      return;
    }

    head = head!.next;
    head!.prev = null;
  }

  // hapus belakang
  void deleteBack() {
    if (isEmpty()) {
      stdout.writeln('List kosong');
      return;
    }

    if (head == tail) {
      head = tail = null;
      return;
    }

    tail = tail!.prev;
    tail!.next = null;
  }

  // hapus tengah
  void deleteMiddle(int index) {
    if (isEmpty()) {
      stdout.writeln('List kosong');
      return;
    }

    if (index <= 0) {
      deleteFront();
      return;
    }

    Dnode? current = head;
    int i = 0;

    while (current != null && i < index) {
      current = current.next;
      i++;
    }

    if (current == null) {
      stdout.writeln('Index tidak ditemukan');
      return;
    }

    if (current.next == null) {
      deleteBack();
      return;
    }

    current.prev!.next = current.next;
    current.next!.prev = current.prev;
  }

  //fungsi untuk print LL
  void printLinkedList() {
    if (isEmpty()) {
      stdout.writeln('List kosong');
      return;
    }

    Dnode? current = head;
    print("Isi Double Linked List");
    stdout.write('null <-> ');
    while (current != null) {
      stdout.write('${current.nodeValue}');
      if (current.next != null) stdout.write(' <-> ');
      current = current.next;
    }
    stdout.writeln(' <-> null');
    print("");
  }

  // Print Forward
  void printForward() {
    if (isEmpty()) {
      stdout.writeln("List Kosong");
      return;
    }
    Dnode? current = head;
    print("Print dari head ke tail");
    stdout.write('null <-> ');
    while (current != null) {
      stdout.write("${current.nodeValue}");
      if (current.next != null) stdout.write(' <-> ');
      current = current.next;
    }
    stdout.writeln(' <-> null');
    print("");
  }

  //print backward
  void printBackward() {
    if (isEmpty()) {
      stdout.writeln("List kosong");
      return;
    }

    Dnode? current = tail;
    print("Print dari tail ke head");
    stdout.write("null <-> ");
    while (current != null) {
      stdout.write("${current.nodeValue}");
      if (current.prev != null) stdout.write(" <-> ");
      current = current.prev;
    }
    stdout.writeln(" <-> null");
    print("");
  }
}

void main() {
  DoubeLinkedList dll = DoubeLinkedList();

  dll.insertBack(10);
  dll.insertBack(20);
  dll.insertBack(30);
  dll.insertBack(40);
  dll.insertBack(50);

  stdout.writeln('Sebelum insert');
  dll.printForward();

  // sisip 99 di index 3
  dll.insertMiddle(99, -2);

  dll.printForward();
}
