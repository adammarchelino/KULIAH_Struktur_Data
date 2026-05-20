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

  void PreOrderDisplay(TNode? node) {
    if (node != null) {
      print("${node.nodeValue}");
      PreOrderDisplay(node.left);
      PreOrderDisplay(node.right);
    }
  }

  void printPreOrderFromRoot() {
    PreOrderDisplay(root);
  }
}

void main() {
  BinaryTree<int> tree = BinaryTree();
  tree.root = TNode(10);
  tree.root!.left = TNode(20);
  tree.root!.right = TNode(30);
  tree.root!.right!.left = TNode(40);

  tree.printPreOrderFromRoot();
}
