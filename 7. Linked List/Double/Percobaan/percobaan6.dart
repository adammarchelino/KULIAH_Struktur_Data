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

  void InsertTailNode(dynamic data) {
    Dnode newNode = Dnode(data);
    if (isEmpty()) {
      append(data);
    } else {
      Dnode? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
      newNode.prev = temp;
    }
  }
}

void main() {
  DoubleLinkedList dll = DoubleLinkedList();
  dll.InsertTailNode(10);
  dll.InsertTailNode(20);
  dll.InsertTailNode(30);

  stdout.write("Hasil: ");
  Dnode? curr = dll.head;
  while (curr != null) {
    stdout.write("${curr.nodeValue} ");
    curr = curr.next;
  }
  print("");
}
