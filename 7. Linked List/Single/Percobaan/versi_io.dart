import 'dart:io';

class Node {
  int nodeValue;
  Node? next;
  Node(this.nodeValue) : next = null;
}

class SingleLinkedList {
  Node? head = null;

  bool isEmpty() => head == null;

  void insertFront(int data) {
    Node newNode = Node(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  void insertBack(int data) {
    Node newNode = Node(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      Node? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  void insertAfter(Node? prevNode, int newData) {
    if (prevNode == null) {
      print("The given previous node cannot be null");
      return;
    }
    Node newNode = Node(newData);
    newNode.next = prevNode.next;
    prevNode.next = newNode;
  }

  void deleteFront() {
    if (!isEmpty()) {
      head = head!.next;
    } else {
      print('List kosong, tidak ada yang dihapus');
    }
  }

  void deleteEnd() {
    if (isEmpty()) {
      print('List kosong, tidak ada yang dihapus');
      return;
    }
    if (head!.next == null) {
      head = null;
      return;
    }
    Node? bantu = head;
    while (bantu!.next!.next != null) {
      bantu = bantu.next;
    }
    bantu.next = null;
  }

  void deleteMiddle(int cari) {
    if (isEmpty()) {
      print('List kosong, tidak ada yang dihapus');
      return;
    }
    if (head!.nodeValue == cari) {
      head = head!.next;
      return;
    }
    Node? bantu = head;
    while (bantu!.next != null && bantu.next!.nodeValue != cari) {
      bantu = bantu.next;
    }
    if (bantu.next == null) {
      print('Node dengan nilai $cari tidak ditemukan');
      return;
    }
    Node? hapus = bantu.next;
    bantu.next = hapus!.next;
    hapus.next = null;
  }

  ({int index, Node node})? findNode(int cari) {
    if (isEmpty()) {
      print('Node dengan nilai $cari tidak ditemukan (list kosong)');
      return null;
    }
    Node? temp = head;
    int index = 0;
    while (temp != null) {
      if (temp.nodeValue == cari) {
        return (index: index, node: temp);
      }
      temp = temp.next;
      index++;
    }
    print('Node dengan nilai $cari tidak ditemukan');
    return null;
  }

  void printList() {
    if (!isEmpty()) {
      Node? now = head;
      String result = '';
      while (now != null) {
        result += '${now.nodeValue}';
        if (now.next != null) result += ' --> ';
        now = now.next;
      }
      result += ' -> NULL';
      print(result);
    } else {
      print('Linked List dalam kondisi kosong');
    }
  }
}

// Helper baca integer dari stdin
int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync();
    final parsed = int.tryParse(input ?? '');
    if (parsed != null) return parsed;
    print('Input tidak valid, masukkan angka bulat.');
  }
}

void main() {
  SingleLinkedList ll = SingleLinkedList();

  print('=== Single Linked List ===\n');

  // ── Insert Front ──────────────────────────────
  int jumlahFront = readInt('Berapa node yang ingin di-insert di depan? ');
  for (int i = 0; i < jumlahFront; i++) {
    int val = readInt('  Nilai node ke-${i + 1}: ');
    ll.insertFront(val);
  }
  print('\nOperasi Insertion Front of Linked List:');
  ll.printList();

  // ── Insert Back ───────────────────────────────
  int jumlahBack = readInt('\nBerapa node yang ingin di-insert di belakang? ');
  for (int i = 0; i < jumlahBack; i++) {
    int val = readInt('  Nilai node ke-${i + 1}: ');
    ll.insertBack(val);
  }
  print('\nOperasi Insertion Back of Linked List:');
  ll.printList();

  // ── Insert After ──────────────────────────────
  int jumlahAfter = readInt('\nBerapa node yang ingin di-insert after? ');
  for (int i = 0; i < jumlahAfter; i++) {
    int targetVal = readInt('  Nilai node target (insert setelah nilai ini): ');
    int newVal = readInt('  Nilai node baru: ');
    var result = ll.findNode(targetVal);
    if (result != null) {
      ll.insertAfter(result.node, newVal);
      print('  Berhasil insert $newVal setelah node $targetVal');
    }
  }
  print('\nOperasi Insertion After:');
  ll.printList();

  // ── Delete Front ──────────────────────────────
  int hapusFront = readInt('\nBerapa node di depan yang ingin dihapus? ');
  for (int i = 0; i < hapusFront; i++) {
    ll.deleteFront();
  }
  print('\nOperasi Delete Front:');
  ll.printList();

  // ── Delete End ────────────────────────────────
  int hapusEnd = readInt('\nBerapa node di belakang yang ingin dihapus? ');
  for (int i = 0; i < hapusEnd; i++) {
    ll.deleteEnd();
  }
  print('\nOperasi Delete End:');
  ll.printList();

  // ── Delete Middle ─────────────────────────────
  int jumlahMiddle = readInt('\nBerapa node di tengah yang ingin dihapus? ');
  for (int i = 0; i < jumlahMiddle; i++) {
    int val = readInt('  Nilai node yang ingin dihapus: ');
    ll.deleteMiddle(val);
  }
  print('\nOperasi Delete Middle:');
  ll.printList();

  // ── Find Node ─────────────────────────────────
  int jumlahFind = readInt('\nBerapa node yang ingin dicari? ');
  for (int i = 0; i < jumlahFind; i++) {
    int val = readInt('  Nilai yang dicari: ');
    var result = ll.findNode(val);
    if (result != null) {
      print(
        '  Ditemukan di index ${result.index}, nilai: ${result.node.nodeValue}',
      );
    }
  }

  print('\n=== State Akhir Linked List ===');
  ll.printList();
}
