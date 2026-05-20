import 'dart:io';

class Stack {
  List<String> _items = [];

  void push(String item) => _items.add(item);

  String pop() {
    if (isEmpty()) throw Exception('Stack is empty');
    return _items.removeLast();
  }

  String top() {
    if (isEmpty()) throw Exception('Stack is empty');
    return _items.last;
  }

  bool isEmpty() => _items.isEmpty;
}

class PostfixToInfix {
  String toInfix(String postfixExp) {
    var stack = Stack();
    for (var ch in postfixExp.split(' ')) {
      if (_isOperator(ch)) {
        var right = stack.pop();
        var left = stack.pop();
        stack.push('($left$ch$right)');
      } else {
        stack.push(ch);
      }
    }
    return stack.pop();
  }

  bool _isOperator(String ch) =>
      ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^';
}

void main() {
  var pti = PostfixToInfix();
  stdout.write("Postfix Expression : ");
  String postfixExp = stdin.readLineSync()!;
  print("Infix Expression : ${pti.toInfix(postfixExp)}");
}
