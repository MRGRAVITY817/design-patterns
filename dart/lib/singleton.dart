class SingletonStack {
  static final SingletonStack instance = SingletonStack._internal();

  factory SingletonStack() => instance;

  SingletonStack._internal();

  List<int> items = [];

  void push(int item) {
    items.add(item);
  }

  int pop() {
    return items.removeLast();
  }
}

// Try test code in "test/singleton_test.dart"

