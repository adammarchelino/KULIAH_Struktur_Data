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

  int maxDepth(TNode? node) {
    if (node == null) {
      return 0;
    } else {
      int lDepth = maxDepth(node.left);
      int rDepth = maxDepth(node.right);
      return lDepth > rDepth ? lDepth + 1 : rDepth + 1;
    }
  }
}

void main() {
  BinaryTree<int> tree = BinaryTree();
  tree.root = TNode(10);
  tree.root!.left = TNode(20);
  tree.root!.right = TNode(30);
  tree.root!.right!.left = TNode(40);

  print("Depth of the binary tree is: ${tree.maxDepth(tree.root)}");
}
