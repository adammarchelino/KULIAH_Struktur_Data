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

  void DeleteEnd() {
    Dnode? temp;
    if (!isEmpty()) {
      if (head!.next != null) {
        temp = head;
        while (temp!.next!.next != null) {
          temp = temp.next;
        }
        temp.next!.prev = null;
        temp.next = null;
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
  a.next = b; b.prev = a;
  b.next = c; c.prev = b;
  dll.head = a;

  stdout.write("Sebelum: ");
  Dnode? curr = dll.head;
  while (curr != null) { stdout.write("${curr.nodeValue} "); curr = curr.next; }
  print("");

  dll.DeleteEnd();

  stdout.write("Sesudah DeleteEnd: ");
  curr = dll.head;
  while (curr != null) { stdout.write("${curr.nodeValue} "); curr = curr.next; }
  print("");
}