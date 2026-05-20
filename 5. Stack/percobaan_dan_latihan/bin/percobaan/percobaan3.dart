import 'package:stack/stack.dart';

void main() {
  var stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);

  print('Stack: ${stack.toList()}');
  print('Popped element: ${stack.pop()}');
  print('Stack: ${stack.toList()}');

  stack.push(4);
  print('Stack: ${stack.toList()}');

  print('Top element: ${stack.top()}');
  print('Stack: ${stack.toList()}');
}
