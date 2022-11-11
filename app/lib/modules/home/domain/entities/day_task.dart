import 'package:app/modules/home/domain/entities/task.dart';

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
