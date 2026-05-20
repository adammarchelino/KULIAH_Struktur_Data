import 'dart:io';

class TNode<T> {
  T nodeValue;
  TNode? left, right;
  TNode(this.nodeValue) : left = null, right = null;
}

class BinaryTree<T> {
  TNode? root;

  BinaryTree() {
    root = null;
  }

  // PreOrder: Root, Left, Right
  void PreOrderDisplay(TNode? node) {
    if (node != null) {
      stdout.write("${node.nodeValue} ");
      PreOrderDisplay(node.left);
      PreOrderDisplay(node.right);
    }
  }

  // InOrder: Left, Root, Right
  void InOrderDisplay(TNode? node) {
    if (node != null) {
      InOrderDisplay(node.left);
      stdout.write("${node.nodeValue} ");
      InOrderDisplay(node.right);
    }
  }

  // PostOrder: Left, Right, Root
  void PostOrderDisplay(TNode? node) {
    if (node != null) {
      PostOrderDisplay(node.left);
      PostOrderDisplay(node.right);
      stdout.write("${node.nodeValue} ");
    }
  }
}

void main() {
  BinaryTree<int> tree = BinaryTree();
  tree.root = TNode(10);
  tree.root!.left = TNode(20);
  tree.root!.right = TNode(30);
  tree.root!.right!.left = TNode(40);

  stdout.write("PostOrder Traversal: ");
  tree.PostOrderDisplay(tree.root);
  print("");

  stdout.write("\nPreOrder Traversal: ");
  tree.PreOrderDisplay(tree.root);
  print("");

  stdout.write("\nInOrder Traversal: ");
  tree.InOrderDisplay(tree.root);
  print("");
}
