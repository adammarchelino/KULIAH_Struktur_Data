import 'dart:io';

// Stack dengan List - seperti Percobaan 1 & 2
class Stack<T> {
  final List<T> _stack = [];

  void push(T element) {
    _stack.add(element);
  }

  T pop() {
    if (isEmpty()) throw StateError('Stack is empty');
    return _stack.removeLast();
  }

  T top() {
    if (isEmpty()) throw StateError('Stack is empty');
    return _stack.last;
  }

  bool isEmpty() => _stack.isEmpty;

  @override
  String toString() => _stack.toString();
}

class StringReverserStack {
  String kalimat;

  StringReverserStack(this.kalimat);

  String reverse() {
    var stack = Stack<String>();

    // Push semua karakter ke stack
    for (var ch in kalimat.split('')) {
      stack.push(ch);
    }

    // Pop semua karakter (urutan terbalik karena LIFO)
    StringBuffer result = StringBuffer();
    while (!stack.isEmpty()) {
      result.write(stack.pop());
    }

    return result.toString();
  }

  bool isPalindrome() {
    return kalimat == reverse();
  }
}

void main() {
  stdout.write('Masukkan kalimat : ');
  String input = stdin.readLineSync()!;

  var reverser = StringReverserStack(input);

  print('Hasil = ${reverser.reverse()}');
  print(reverser.isPalindrome() ? 'Palindrom' : 'Bukan palindrom');
}
