import 'dart:collection';

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

  void inOrderDisplay(TNode? node) {
    if (node != null) {
      inOrderDisplay(node.left);
      print('${node.nodeValue}');
      inOrderDisplay(node.right);
    }
  }

  void printInOrderFromRoot() {
    inOrderDisplay(root);
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

  void printLevelOrder() {
    int h = height(root);
    for (int i = 0; i <= h; i++) {
      printCurrentLevel(root, i);
    }
  }

  int height(TNode? node) {
    if (node == null) return 0;
    int lheight = height(node.left);
    int rheight = height(node.right);
    return lheight > rheight ? lheight + 1 : rheight + 1;
  }

  void printCurrentLevel(TNode? node, int level) {
    if (node == null) return;
    if (level == 0) {
      print('${node.nodeValue}');
    } else {
      printCurrentLevel(node.left, level - 1);
      printCurrentLevel(node.right, level - 1);
    }
  }

  void deleteDeepest(TNode root, TNode delNode) {
    Queue<TNode> q = Queue();
    q.add(root);
    TNode? temp;

    while (q.isNotEmpty) {
      temp = q.removeFirst();

      if (temp == delNode) {
        temp = null;
        return;
      }

      if (temp.right != null) {
        if (temp.right == delNode) {
          temp.right = null;
          return;
        } else {
          q.add(temp.right!);
        }
      }

      if (temp.left != null) {
        if (temp.left == delNode) {
          temp.left = null;
          return;
        } else {
          q.add(temp.left!);
        }
      }
    }
  }

  void delete(TNode? root, dynamic key) {
    if (root == null) return;

    if (root.left == null && root.right == null) {
      if (root.nodeValue == key) root = null;
      return;
    }

    Queue<TNode> q = Queue();
    q.add(root);
    TNode? temp;
    TNode? keyNode;

    while (q.isNotEmpty) {
      temp = q.removeFirst();
      if (temp.nodeValue == key) keyNode = temp;
      if (temp.left != null) q.add(temp.left!);
      if (temp.right != null) q.add(temp.right!);
    }

    if (keyNode != null) {
      dynamic x = temp!.nodeValue;
      deleteDeepest(root, temp);
      keyNode.nodeValue = x;
    }
  }
}

void main() {
  BinaryTree t = BinaryTree();
  t.root = TNode(10);
  t.root!.left = TNode(20);
  t.root!.right = TNode(30);
  t.root!.right!.left = TNode(40);

  print("In Order (sebelum delete) ");
  t.printInOrderFromRoot();

  print("\nHeight of Binary Tree ");
  print(t.maxDepth(t.root));

  t.delete(t.root, 20);

  print("\nIn Order (setelah delete 20) ");
  t.printInOrderFromRoot();

  print("\nNilai pada Level 1 ");
  t.printCurrentLevel(t.root, 1);
}
