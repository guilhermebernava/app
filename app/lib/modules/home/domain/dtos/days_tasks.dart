import 'package:app/core/domain/entities/daily_task.dart';
import 'package:app/core/domain/entities/day_task.dart';

class DaysTasksDto {
  final DayTask todayDayTasks;
  final List<DayTask> daysTasks;

  DaysTasksDto({
    required this.daysTasks,
    required this.todayDayTasks,
  });
}
