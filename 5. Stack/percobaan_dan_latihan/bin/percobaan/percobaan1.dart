class Stack {
  int last_elemen = 0;
  int maxStack = 0;
  List<int> elemen = [];

  void StackOperation(int maxElements) {
    last_elemen = -1;
    maxStack = maxElements - 1;
    elemen = List<int>.filled(maxElements, 0);
  }

  bool isEmpty() => last_elemen == -1;
  bool isFull() => last_elemen == maxStack;

  void push(int data) {
    if (isFull()) print("stack overflow");
    else {
      last_elemen++;
      elemen[last_elemen] = data;
    }
  }

  int pop() {
    if (isEmpty()) {
      print("stack Underflow");
      return 0;
    }
    int data = elemen[last_elemen];
    elemen[last_elemen] = 0;
    last_elemen--;
    return data;
  }

  int top() {
    if (isEmpty()) {
      print("Stack Underflow");
      return 0;
    }
    return elemen[last_elemen];
  }

  void printStack() {
    if (isEmpty()) print("Stack masih kosong");
    else {
      print("Menampilkan urutan dari posisi tertinggi");
      for (int i = last_elemen; i > -1; i--) {
        print("Elemen ke-$i = ${elemen[i]}");
      }
    }
  }
}

void main() {
  Stack s = Stack();
  s.StackOperation(100);
  s.push(10);
  s.push(20);
  s.push(30);
  s.pop();
  print("Last Element of Stack: ${s.top()}");
  s.printStack();
}
