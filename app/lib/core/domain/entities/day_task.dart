import 'package:app/core/domain/entities/daily_task.dart';

class DayTask {
  final String day;
  final int dayNumber;
  final List<DailyTask> tasks;

  DayTask({
    required this.tasks,
    required this.day,
    required this.dayNumber,
  });
}
