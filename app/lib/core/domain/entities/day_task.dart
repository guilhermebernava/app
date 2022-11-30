import 'package:app/core/domain/entities/daily_task.dart';
import 'package:app/core/domain/enums/daily_task_type.dart';
import 'package:isar/isar.dart';

class DayTask {
  final Id id;
  final String day;
  final int dayNumber;
  final List<DailyTask> tasks;
  final List<DailyTaskType> types;

  DayTask({
    required this.id,
    required this.tasks,
    required this.day,
    required this.dayNumber,
    required this.types,
  });
}
