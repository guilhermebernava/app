import 'package:app/core/domain/value_objects/not_null.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final notNullInt = NotNull<int>(1);
  final notNullString = NotNull<String>("teste");

  group("STRING", () {
    test("It should change value by call", () {
      notNullString.call("Valor");
      expect(notNullString.value, "Valor");
    });

    test("It should change value by call", () {
      final notNullStringValidate = NotNull<String>(null);
      final validated = notNullStringValidate.validator();

      expect(validated, "Valor não pode ser nulo!");
    });
  });

  group("INT", () {
    test("It should change value by call", () {
      notNullInt.call(10);
      expect(notNullInt.value, 10);
    });

    test("It should change value by call", () {
      final notNullIntValidate = NotNull<int>(null);
      final validated = notNullIntValidate.validator();

      expect(validated, "Valor não pode ser nulo!");
    });
  });
}
