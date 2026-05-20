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

  void DeleteFront() {
    if (!isEmpty()) {
      if (head!.next != null) {
        Dnode? delete = head;
        head = head!.next;
        head!.prev = null;
        delete!.next = null;
      } else {
        head = null;
      }
    }
  }
}

void main() {
  DoubleLinkedList dll = DoubleLinkedList();

  Dnode a = Dnode(10);
  Dnode b = Dnode(20);
  Dnode c = Dnode(30);
  a.next = b;
  b.prev = a;
  b.next = c;
  c.prev = b;
  dll.head = a;

  stdout.write("Sebelum: ");
  Dnode? curr = dll.head;
  while (curr != null) {
    stdout.write("${curr.nodeValue} ");
    curr = curr.next;
  }
  print("");

  dll.DeleteFront();

  stdout.write("Sesudah DeleteFront: ");
  curr = dll.head;
  while (curr != null) {
    stdout.write("${curr.nodeValue} ");
    curr = curr.next;
  }
  print("");
}
