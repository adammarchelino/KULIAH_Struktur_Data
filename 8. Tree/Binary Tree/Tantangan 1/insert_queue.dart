import 'dart:io';

class Node<T> {
  T nilai;
  Node<T>? kiri, kanan;
  Node(this.nilai);
}

class BinaryTree<T> {
  Node<T>? root;
  int jumlahNode = 0;

  void insertLevelOrderQueue(T nilaiBaru) {
    Node<T> nodeBaru = Node(nilaiBaru);
    if (root == null) {
      root = nodeBaru;
      jumlahNode++;
      return;
    }
    List<Node<T>> antrian = [];
    antrian.add(root!);

    while (antrian.isNotEmpty) {
      Node<T> current = antrian.removeAt(0);
      if (current.kiri == null) {
        current.kiri = nodeBaru;
        jumlahNode++;
        return;
      } else {
        antrian.add(current.kiri!);
      }
      if (current.kanan == null) {
        current.kanan = nodeBaru;
        jumlahNode++;
        return;
      } else {
        antrian.add(current.kanan!);
      }
    }
  }

  void visualisasiTree(Node<T>? node, String prefix, bool isKiri) {
    if (node != null) {
      print(prefix + (isKiri ? '├── ' : '└── ') + '${node.nilai}');
      visualisasiTree(node.kiri, prefix + (isKiri ? '│   ' : '    '), true);
      visualisasiTree(node.kanan, prefix + (isKiri ? '│   ' : '    '), false);
    }
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

  pohon.insertLevelOrderQueue(10);
  pohon.insertLevelOrderQueue(20);
  pohon.insertLevelOrderQueue(30);
  pohon.insertLevelOrderQueue(40);
  pohon.insertLevelOrderQueue(50);

  print('Jumlah Node : ${pohon.jumlahNode}');
  print('Struktur Tree (Insert Queue):');
  print('${pohon.root?.nilai}');
  pohon.visualisasiTree(pohon.root?.kiri, '', true);
  pohon.visualisasiTree(pohon.root?.kanan, '', false);

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
