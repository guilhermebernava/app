import 'package:app/core/domain/interfaces/value_object.dart';

class Nullable<T> implements ValueObject<T> {
  T? _value;

  Nullable(this._value);

  T? get value => _value;
  void set(T value) => _value = value;

  @override
  String? validator() {
    return null;
  }

  @override
  void call(T value) {
    _value = value;
  }
}
