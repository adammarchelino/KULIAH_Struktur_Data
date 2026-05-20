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

  void printLevelOrder() {
    int h = height(root);
    for (int i = 0; i <= h; i++) {
      printCurrentLevel(root, i);
    }
  }

  int height(TNode? root) {
    if (root == null) {
      return 0;
    } else {
      int lheight = height(root.left);
      int rheight = height(root.right);
      return lheight > rheight ? lheight + 1 : rheight + 1;
    }
  }

  void printCurrentLevel(TNode? root, int level) {
    if (root == null) return; // base case: node kosong, stop

    if (level == 0) {
      print("${root.nodeValue}"); // cetak node di level ini
    } else {
      printCurrentLevel(root.left, level - 1); // turun ke kiri
      printCurrentLevel(root.right, level - 1); // turun ke kanan
    }
  }
}

void main() {
  BinaryTree<int> tree = BinaryTree();
  tree.root = TNode(10);
  tree.root!.left = TNode(20);
  tree.root!.right = TNode(30);
  tree.root!.right!.left = TNode(40);

  tree.printLevelOrder();
}
