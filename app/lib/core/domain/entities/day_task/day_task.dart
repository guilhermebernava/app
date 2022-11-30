import 'package:app/core/domain/entities/daily_task/daily_task.dart';
import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:isar/isar.dart';

part 'day_task.g.dart';

@collection
class DayTask {
  Id id = Isar.autoIncrement;
  final String day;
  final int dayNumber;
  final IsarLinks<DailyTask> tasks = IsarLinks<DailyTask>();
  final IsarLinks<DailyTaskType> types = IsarLinks<DailyTaskType>();

  DayTask({
    required this.day,
    required this.dayNumber,
  });
}
