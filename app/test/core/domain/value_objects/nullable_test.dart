import 'package:app/core/domain/value_objects/nullable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should NOT return nothing from validator', () {
    final validated = Nullable(null).validator();

    expect(validated, null);
  });
}
