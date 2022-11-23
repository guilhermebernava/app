import 'package:app/core/domain/interfaces/value_object.dart';

class NotNull<T> implements ValueObject<T> {
  T? _value;

  NotNull(this._value);

  T? get value => _value;
  void set(T value) => _value = value;

  @override
  String? validator() {
    if (_value == null || _value.toString() == "") {
      return 'Valor não pode ser nulo!';
    }
    return null;
  }

  @override
  void call(T value) {
    _value = value;
  }
}
