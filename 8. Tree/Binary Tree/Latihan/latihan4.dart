import 'dart:collection';

class TNode<T> {
  T nodeValue;
  TNode<T>? left, right;

  TNode(this.nodeValue) {
    left = null;
    right = null;
  }
}

class BinaryTree<T> {
  TNode<T>? root;

  BinaryTree() {
    root = null;
  }

  void insertionLevelOrderWithQueue(T value) {
    TNode<T>? newNode = TNode(value);

    if (root == null) {
      root = newNode;
      return;
    }
    Queue<TNode<T>> queue = Queue();
    queue.add(root!);

    while (queue.isNotEmpty) {
      TNode<T> temp = queue.removeFirst();

      if (temp.left == null) {
        temp.left = newNode;
        return;
      } else {
        queue.add(temp.left!);
      }

      if (temp.right == null) {
        temp.right = newNode;
        return;
      } else {
        queue.add(temp.right!);
      }
    }
  }

  void visual() {
    visualisasiTree(root, '', false);
  }

  void visualisasiTree(TNode<T>? node, String prefix, bool isKiri) {
    if (node != null) {
      print(prefix + (isKiri ? '├── ' : '└── ') + '${node.nodeValue}');
      visualisasiTree(node.left, prefix + (isKiri ? '│   ' : '    '), true);
      visualisasiTree(node.right, prefix + (isKiri ? '│   ' : '    '), false);
    }
  }
}
