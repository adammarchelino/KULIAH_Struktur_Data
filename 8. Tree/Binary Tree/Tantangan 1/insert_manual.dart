import 'dart:io';

class Node<T> {
  T nilai;
  Node<T>? kiri, kanan;
  Node(this.nilai);
}

class BinaryTree {
  Node<int>? root;
  int jumlahNode = 0;

  void insertManual(int nilaiBaru, int targetNilai, String posisi) {
    Node<int> nodeBaru = Node(nilaiBaru);
    if (root == null) {
      root = nodeBaru;
      jumlahNode++;
      return;
    }
    Node<int>? target = linearSearch(root, targetNilai);
    if (target == null) {
      print('Node $targetNilai tidak ditemukan.');
      return;
    }
    if (posisi == 'kiri') {
      if (target.kiri == null) {
        target.kiri = nodeBaru;
        jumlahNode++;
      } else {
        print('Posisi kiri node $targetNilai sudah terisi.');
      }
    } else if (posisi == 'kanan') {
      if (target.kanan == null) {
        target.kanan = nodeBaru;
        jumlahNode++;
      } else {
        print('Posisi kanan node $targetNilai sudah terisi.');
      }
    } else {
      print('Posisi tidak valid. Gunakan "kiri" atau "kanan".');
    }
  }

  Node<int>? linearSearch(Node<int>? node, int target) {
    if (node == null) return null;
    if (node.nilai == target) return node;
    Node<int>? hasilKiri = linearSearch(node.kiri, target);
    if (hasilKiri != null) return hasilKiri;
    return linearSearch(node.kanan, target);
  }

  void visualisasiTree(Node<int>? node, String prefix, bool isKiri) {
    if (node != null) {
      print(prefix + (isKiri ? '├── ' : '└── ') + '${node.nilai}');
      visualisasiTree(node.kiri, prefix + (isKiri ? '│   ' : '    '), true);
      visualisasiTree(node.kanan, prefix + (isKiri ? '│   ' : '    '), false);
    }
  }

  void printPreorder(Node<int>? node) {
    if (node != null) {
      stdout.write('${node.nilai} ');
      printPreorder(node.kiri);
      printPreorder(node.kanan);
    }
  }

  void printInorder(Node<int>? node) {
    if (node != null) {
      printInorder(node.kiri);
      stdout.write('${node.nilai} ');
      printInorder(node.kanan);
    }
  }

  void printPostorder(Node<int>? node) {
    if (node != null) {
      printPostorder(node.kiri);
      printPostorder(node.kanan);
      stdout.write('${node.nilai} ');
    }
  }
}

void main() {
  BinaryTree pohon = BinaryTree();

  stdout.write('Masukkan nilai root: ');
  int nilaiRoot = int.parse(stdin.readLineSync()!);
  pohon.root = Node(nilaiRoot);
  pohon.jumlahNode++;

  print('Ketik "selesai" pada nilai baru untuk menampilkan tree.\n');

  while (true) {
    stdout.write('Nilai baru (atau "selesai"): ');
    String inputNilai = stdin.readLineSync()!;
    if (inputNilai == 'selesai') break;

    stdout.write('Target node induk: ');
    int targetNilai = int.parse(stdin.readLineSync()!);
    stdout.write('Posisi (kiri/kanan): ');
    String posisi = stdin.readLineSync()!;
    pohon.insertManual(int.parse(inputNilai), targetNilai, posisi);
  }

  print('\nJumlah Node : ${pohon.jumlahNode}');
  print('Struktur Tree:');
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
