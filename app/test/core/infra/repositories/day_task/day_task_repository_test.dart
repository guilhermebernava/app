import 'package:app/core/domain/entities/day_task/day_task.dart';
import 'package:app/core/domain/models/daily_task_db.dart';
import 'package:app/core/extensions/dartz_extensions.dart';
import 'package:app/core/infra/repositories/daily_task/daily_task_repository.dart';
import 'package:app/core/infra/repositories/daily_task_type/daily_task_type_repository.dart';
import 'package:app/core/infra/repositories/day_task/day_task_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repo = DayTaskRepository(
    dailyTaskRepository: DailyTaskRepository(),
    dailyTaskTypeRepository: DailyTaskTypeRepository(),
  );

  group("GET", () {
    test('It should get all data', () async {
      final result = await repo.getAll();

      expect(result.isRight(), true);
      expect(result.right(), isA<List<DayTask>>());
    });

    test('It should get today DayTask', () async {
      final result = await repo.insert(
        DayTask(
          day: "Quarta",
          dayNumber: DateTime.now().day,
        ),
        [
          DailyTaskDb(
            endDate: DateTime.now().add(const Duration(days: 5)),
            initialDate: DateTime.now(),
            title: "teste",
            neonColor: "asd",
            hoursInDay: 10,
            type: "Programing",
          ),
        ],
      );

      expect(result.isRight(), true);
      final today = await repo.getTodayDayTask();

      expect(today.isRight(), true);
      expect(today.right(), isA<DayTask>());
    });
  });

  test('It should insert data', () async {
    final result = await repo.insert(
      DayTask(
        day: "Quarta",
        dayNumber: 2,
      ),
      [
        DailyTaskDb(
          endDate: DateTime.now().add(const Duration(days: 10)),
          initialDate: DateTime.now(),
          title: "bicha",
          neonColor: "asd",
          hoursInDay: 10,
          type: "Programing",
        ),
        DailyTaskDb(
          endDate: DateTime.now().add(const Duration(days: 5)),
          initialDate: DateTime.now(),
          title: "teste",
          neonColor: "asd",
          hoursInDay: 10,
          type: "Programing",
        ),
      ],
    );

    expect(result.isRight(), true);
  });
}
