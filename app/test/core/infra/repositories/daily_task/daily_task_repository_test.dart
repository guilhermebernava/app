import 'package:app/core/domain/entities/daily_task/daily_task.dart';
import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:app/core/extensions/dartz_extensions.dart';
import 'package:app/core/infra/repositories/daily_task/daily_task_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repo = DailyTaskRepository();

  test('It should get all data', () async {
    final result = await repo.getAll();

    expect(result.isRight(), true);
    expect(result.right(), isA<List<DailyTask>>());
  });

  test('It should insert data into database', () async {
    final result = await repo.insert(
      DailyTask(
        endDate: DateTime.now().add(
          const Duration(
            days: 1,
          ),
        ),
        initialDate: DateTime.now(),
        title: "title",
        neonColor: "",
        hoursInDay: 10,
      ),
      DailyTaskType(
        type: "Programing",
      ),
    );

    expect(result.isRight(), true);
  });
}
