import 'package:app/core/domain/entities/daily_task.dart';
import 'package:app/core/domain/enums/daily_task_type.dart';

class DayTask {
  final String day;
  final int dayNumber;
  final List<DailyTask> tasks;
  final List<DailyTaskType> types;

  DayTask({
    required this.tasks,
    required this.day,
    required this.dayNumber,
    required this.types,
  });
}
