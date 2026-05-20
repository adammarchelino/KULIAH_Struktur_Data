class Stack<T> {
  final List<T> _stack = [];

  void push(T element) => _stack.add(element);

  T pop() {
    if (_stack.isEmpty) throw StateError("No elements in the Stack");
    T last = _stack.last;
    _stack.removeLast();
    return last;
  }

  T top() {
    if (_stack.isEmpty) throw StateError("No elements in the Stack");
    return _stack.last;
  }

  bool isEmpty() => _stack.isEmpty;

  @override
  String toString() => _stack.toString();
}

void main() {
  var stack = Stack<int>();
  print(stack.isEmpty());
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.push(5);
  stack.push(7);
  print(stack);
  print('My 1st number is ${stack.pop()}');
  print('My 2nd number is ${stack.pop()}');
  print(stack.pop());
  print(stack);
  print(stack.top());
  print(stack.isEmpty());
}
