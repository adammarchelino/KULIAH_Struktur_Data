class Node {
  int data;
  Node? next;

  Node(this.data);
}

class SingleLinkedList {
  Node? head;

  void insertBack(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
      return;
    }

    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }

    temp.next = newNode;
  }

  // fungsi pencarian node
  Node? findNode(int data) {
    Node? temp = head;

    while (temp != null) {
      if (temp.data == data) {
        return temp;
      }
      temp = temp.next;
    }

    return null;
  }
}

void main() {
  SingleLinkedList list = SingleLinkedList();

  list.insertBack(50);
  list.insertBack(60);
  list.insertBack(70);
  list.insertBack(80);

  Node? result = list.findNode(80);

  if (result != null) {
    print("Data ditemukan: ${result.data}");
  } else {
    print("Data tidak ditemukan");
  }
}
