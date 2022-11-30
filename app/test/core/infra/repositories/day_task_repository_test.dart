import 'package:app/core/domain/database_entities/daily_task_db/daily_task_db.dart';
import 'package:app/core/domain/database_entities/day_task_db/day_task_db.dart';
import 'package:app/core/domain/entities/day_task.dart';
import 'package:app/core/domain/enums/daily_task_type.dart';
import 'package:app/core/extensions/dartz_extensions.dart';
import 'package:app/core/infra/repositories/day_task/day_task_mapper.dart';
import 'package:app/core/infra/repositories/day_task/day_task_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repo = DayTaskRepository(
    mapper: DayTaskMapper(),
  );

  test('day task repository ...', () async {
    final result = await repo.getAll();

    expect(result.isRight(), true);
    expect(result.right(), isA<List<DayTask>>());
  });

  test('day task repository ...', () async {
    final result = await repo.insert(
        DayTaskDb(
          day: "Terça",
          dayNumber: 2,
        ),
        [
          DailyTaskDb(
            endDate: DateTime.now().add(const Duration(days: 10)),
            initialDate: DateTime.now(),
            title: "bicha",
            neonColor: "asd",
            hoursInDay: 10,
            dailyTaskType: DailyTaskType.studying,
          ),
        ]);

    expect(result.isRight(), true);
  });
}
