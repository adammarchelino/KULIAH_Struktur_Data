import 'dart:io';

class Dnode<T> {
  T nodeValue;
  Dnode<T>? prev;
  Dnode<T>? next;

  Dnode(this.nodeValue) : next = null, prev = null;
}

class DoubleLinkedList {
  Dnode? head;

  bool isEmpty() => head == null;

  void append(dynamic data) {
    Dnode newNode = Dnode(data);
    if (isEmpty()) {
      head = newNode;
      head!.next = null;
      head!.prev = null;
    }
  }

  void InsertBeforeHead(dynamic data) {
    Dnode newNode = Dnode(data);
    if (isEmpty()) {
      append(data);
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }
}

void main() {
  DoubleLinkedList dll = DoubleLinkedList();
  dll.append(20);
  dll.InsertBeforeHead(10);

  stdout.write("Hasil: ");
  Dnode? curr = dll.head;
  while (curr != null) {
    stdout.write("${curr.nodeValue} ");
    curr = curr.next;
  }
  print("");
}
