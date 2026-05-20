class DNode<T> {
  T? value;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.value);
}

class DoubleLinkedList<T> {
  DNode<T>? head;

  bool isEmpty() => head == null;

  void tambahNodeAkhir(DNode<T> newNode) {
    if (isEmpty()) {
      head = newNode;
      return;
    }
    DNode<T>? curr = head;
    while (curr!.next != null) {
      curr = curr.next;
    }
    curr.next = newNode;
    newNode.prev = curr;
  }

  void tambahNode_Setelah(DNode<T> newNode, DNode<T> target) {
    if (isEmpty()) return;

    DNode<T>? curr = head;
    while (curr != null && curr.value != target.value) {
      curr = curr.next;
    }

    if (curr == null) return;

    newNode.next = curr.next;
    newNode.prev = curr;

    if (curr.next != null) {
      curr.next!.prev = newNode;
    }

    curr.next = newNode;
  }

  @override
  String toString() {
    List<T?> list = [];
    DNode<T>? curr = head;
    while (curr != null) {
      list.add(curr.value);
      curr = curr.next;
    }
    return list.toString();
  }
}

void main() {
  var dll = DoubleLinkedList<int>();

  dll.tambahNodeAkhir(DNode(10));
  dll.tambahNodeAkhir(DNode(90));
  dll.tambahNodeAkhir(DNode(80));
  dll.tambahNode_Setelah(DNode(20), DNode(10));

  print(dll.toString());
}
