abstract class ValueObject<T> {
  String? validator();
  void call(T value);
}
