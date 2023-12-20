import 'package:design_patterns/singleton.dart';
import 'package:test/test.dart';

void main() {
  test('create three singleton stacks', () {
    final firstStack = SingletonStack();
    final secondStack = SingletonStack();
    final thirdStack = SingletonStack();
    expect(firstStack.items, []);
    expect(secondStack.items, []);
    expect(thirdStack.items, []);

    firstStack.push(1);
    expect(firstStack.items, [1]);
    expect(secondStack.items, [1]);
    expect(thirdStack.items, [1]);

    secondStack.push(2);
    expect(firstStack.items, [1, 2]);
    expect(secondStack.items, [1, 2]);
    expect(thirdStack.items, [1, 2]);

    thirdStack.pop();
    expect(firstStack.items, [1]);
    expect(secondStack.items, [1]);
    expect(thirdStack.items, [1]);
  });
}
