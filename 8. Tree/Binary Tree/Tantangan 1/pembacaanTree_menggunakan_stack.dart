import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;
  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  void printVisualTree(Node<T>? node, String indent, bool isLeft) {
    if (node == null) return;

    stdout.writeln(indent + (isLeft ? "├── " : "└── ") + "${node.nodeValue}");

    String newIndent = indent + (isLeft ? "│   " : "    ");
    printVisualTree(node.left, newIndent, true);
    printVisualTree(node.right, newIndent, false);
  }

  void printInOrderNonRecursive() {
    List<Node<T>> stack = [];
    Node<T>? current = root;

    stdout.write("Inorder Non-Recursive = ");

    // push semua node kiri ke stack
    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }

      // push node dari stack (kunjungi)
      current = stack.removeLast();
      stdout.write("${current.nodeValue} ");

      // masuk ke subtree kanan
      current = current.right;
    }

    stdout.writeln();
  }
}

void main() {
  BinaryTree<int> tree = BinaryTree();
  tree.root = Node(1);
  tree.root!.left = Node(2);
  tree.root!.right = Node(3);
  tree.root!.left!.left = Node(4);

  tree.printVisualTree(tree.root, "", false);

  print("");
  tree.printInOrderNonRecursive();
}
