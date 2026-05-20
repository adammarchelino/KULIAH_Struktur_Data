import 'latihan4.dart';

extension NonRecursiveTraversal<T> on BinaryTree<T> {
  List<T> inorderNonRecursive() {
    List<T> hasil = [];
    List<TNode<T>> stack = [];
    TNode<T>? current = root;

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }
      current = stack.removeLast();
      hasil.add(current.nodeValue);
      current = current.right;
    }
    return hasil;
  }

  List<T> preorderNonRecursive() {
    if (root == null) return [];

    List<T> hasil = [];
    List<TNode<T>> stack = [root!];

    while (stack.isNotEmpty) {
      TNode<T> node = stack.removeLast();
      hasil.add(node.nodeValue);
      if (node.right != null) stack.add(node.right!);
      if (node.left != null) stack.add(node.left!);
    }
    return hasil;
  }

  List<T> postorderNonRecursive() {
    if (root == null) return [];

    List<TNode<T>> stack1 = [root!];
    List<TNode<T>> stack2 = [];

    while (stack1.isNotEmpty) {
      TNode<T> node = stack1.removeLast();
      stack2.add(node);
      if (node.left != null) stack1.add(node.left!);
      if (node.right != null) stack1.add(node.right!);
    }

    return stack2.reversed.map((n) => n.nodeValue).toList();
  }
}
