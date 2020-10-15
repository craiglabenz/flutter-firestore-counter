class CounterManager {
  /// Create a private integer to store the count. Make this private
  /// so that Widgets cannot modify it directly, but instead must
  /// use official methods.
  int _count = 0;

  /// Publicly accessible reference to our state.
  int get count => _count;

  /// Publicly accessible state mutator.
  void increment() => _count++;
}
