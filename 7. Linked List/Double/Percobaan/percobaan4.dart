import 'dart:io';

class Dnode<T> {
  T nodeValue;
  Dnode<T>? prev;
  Dnode<T>? next;

  Dnode(this.nodeValue) : next = null, prev = null;
}

class DoubleLinkedList {
  Dnode? head;

  void printList(Dnode? node) {
    Dnode? tail;
    tail = null;
    print("Traversal in Forward Direction: ");
    while (node != null) {
      stdout.write("${node.nodeValue} ");
      tail = node;
      node = node.next;
    }
    print("");
    print("Traversal in Reverse Direction: ");
    while (tail != null) {
      stdout.write("${tail.nodeValue} ");
      tail = tail.prev;
    }
    print("");
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

  dll.printList(dll.head);
}
