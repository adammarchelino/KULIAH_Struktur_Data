import 'dart:io';

class Node<T> {
  T nilai;
  Node<T>? kiri, kanan;
  Node(this.nilai);
}

class BinaryTree<T> {
  Node<T>? root;
  int jumlahNode = 0;

  void insertLevelOrder(T nilaiBaru) {
    Node<T> nodeBaru = Node(nilaiBaru);
    if (root == null) {
      root = nodeBaru;
      jumlahNode++;
      return;
    }
    insertBasedLevelOrder(root!, nodeBaru);
    jumlahNode++;
  }

  bool insertBasedLevelOrder(Node<T> current, Node<T> nodeBaru) {
    if (current.kiri == null) {
      current.kiri = nodeBaru;
      return true;
    }
    if (current.kanan == null) {
      current.kanan = nodeBaru;
      return true;
    }
    if (insertBasedLevelOrder(current.kiri!, nodeBaru)) return true;
    return insertBasedLevelOrder(current.kanan!, nodeBaru);
  }

  void visualisasiTree(Node<T>? root) {
    if (root == null) return;

    List<Node<T>?> level = [root];
    int height = getHeight(root);
    int maxWidth = (1 << height) * 2;

    for (int h = 0; h < height; h++) {
      List<Node<T>?> nextLevel = [];

      // Print nodes on this level
      int spacing = maxWidth ~/ (1 << (h + 1));
      String line = "";

      for (var node in level) {
        line += " " * spacing;
        line += (node == null ? " " : "${node.nilai}");
        line += " " * spacing;

        nextLevel.add(node?.kiri);
        nextLevel.add(node?.kanan);
      }

      print(line);

      // Print slashes / \ for children
      if (h < height - 1) {
        String slashLine = "";
        for (var node in level) {
          slashLine += " " * (spacing - 1);
          slashLine += (node?.kiri != null ? "/" : " ");
          slashLine += " " * 2;
          slashLine += (node?.kanan != null ? "\\" : " ");
          slashLine += " " * (spacing - 1);
        }
        print(slashLine);
      }

      level = nextLevel;
    }
  }

  int getHeight(Node? node) {
    if (node == null) return 0;
    return 1 +
        (getHeight(node.kiri) > getHeight(node.kanan)
            ? getHeight(node.kiri)
            : getHeight(node.kanan));
  }

  void printPreorder(Node<T>? node) {
    if (node != null) {
      stdout.write('${node.nilai} ');
      printPreorder(node.kiri);
      printPreorder(node.kanan);
    }
  }

  void printInorder(Node<T>? node) {
    if (node != null) {
      printInorder(node.kiri);
      stdout.write('${node.nilai} ');
      printInorder(node.kanan);
    }
  }

  void printPostorder(Node<T>? node) {
    if (node != null) {
      printPostorder(node.kiri);
      printPostorder(node.kanan);
      stdout.write('${node.nilai} ');
    }
  }
}

void main() {
  BinaryTree<int> pohon = BinaryTree();

  pohon.insertLevelOrder(10);
  pohon.insertLevelOrder(20);
  pohon.insertLevelOrder(30);
  pohon.insertLevelOrder(40);
  pohon.insertLevelOrder(50);
  pohon.insertLevelOrder(60);
  pohon.insertLevelOrder(70);
  pohon.insertLevelOrder(80);

  print('Jumlah Node : ${pohon.jumlahNode}');
  print('Struktur Tree (Insert Rekursif):');
  pohon.visualisasiTree(pohon.root);

  print('');
  stdout.write('Preorder  : ');
  pohon.printPreorder(pohon.root);

  print('');
  stdout.write('Inorder   : ');
  pohon.printInorder(pohon.root);

  print('');
  stdout.write('Postorder : ');
  pohon.printPostorder(pohon.root);

  print('');
}
