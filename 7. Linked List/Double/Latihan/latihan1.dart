class DNode<T> {
  T? value;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.value);
}

class DoubleLinkedList<T> {
  DNode<T>? head;

  bool isEmpty() => head == null;

  void tambahNodeDepan(DNode<T> newNode) {
    if (isEmpty()) {
      head = newNode;
      return;
    }
    newNode.next = head;
    head!.prev = newNode;
    head = newNode;
  }

  void tambahNode_Sebelum(DNode<T> newNode, DNode<T> target) {
    if (isEmpty()) return;

    DNode<T>? curr = head;
    while (curr != null && curr.value != target.value) {
      curr = curr.next;
    }

    if (curr == null) return;

    if (curr == head) {
      tambahNodeDepan(newNode);
      return;
    }

    newNode.prev = curr.prev;
    newNode.next = curr;
    curr.prev!.next = newNode;
    curr.prev = newNode;
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

  dll.tambahNodeDepan(DNode(20));
  dll.tambahNodeDepan(DNode(30));
  dll.tambahNode_Sebelum(DNode(10), DNode(30));

  print(dll.toString());
}
