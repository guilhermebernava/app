import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:app/core/extensions/dartz_extensions.dart';
import 'package:app/core/infra/repositories/daily_task_type/daily_task_type_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repo = DailyTaskTypeRepository();

  test('It should get all data', () async {
    final result = await repo.getAll();

    expect(result.isRight(), true);
    expect(result.right(), isA<List<DailyTaskType>>());
  });

  test('It should get by Id', () async {
    final result = await repo.getById(1);

    expect(result.isRight(), true);
    expect(result.right(), isA<DailyTaskType>());
    expect(result.right().type, "Programing");
  });

  test('It should get by Name', () async {
    final result = await repo.getByName("Programing");

    expect(result.isRight(), true);
    expect(result.right(), isA<DailyTaskType>());
    expect(result.right().type, "Programing");
  });

  test('It should insert data into database', () async {
    final result = await repo.insert(DailyTaskType(type: "Programing"));

    expect(result.isRight(), true);
  });
}
