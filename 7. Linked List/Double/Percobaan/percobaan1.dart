class DNode<T> {
  T? nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode() {
    nodeValue = null;
    next = this;
    prev = this;
  }

  DNode.withValue(T item) {
    nodeValue = item;
    next = this;
    prev = this;
  }
}
