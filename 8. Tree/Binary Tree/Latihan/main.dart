import 'latihan4.dart';
import 'latihan5.dart';

void main() {
  BinaryTree<String> tree = BinaryTree();

  List<String> nodes = ['+', '*', '/', 'a', 'b', '-', 'e', 'c', 'd'];
  for (String node in nodes) {
    tree.insertionLevelOrderWithQueue(node);
  }

  print(' Latihan 4: InsertionLevelOrderWithQueue ');
  print('Node dimasukkan secara level-order: ${nodes}\n');
  tree.visual();
  print('');

  print(' Latihan 5: Non-Recursive Traversal ');
  print('Inorder   : ${tree.inorderNonRecursive()}');
  print('Preorder  : ${tree.preorderNonRecursive()}');
  print('Postorder : ${tree.postorderNonRecursive()}');
}
