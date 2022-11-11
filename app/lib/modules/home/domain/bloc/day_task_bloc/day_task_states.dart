import 'package:app/modules/home/domain/entities/day_task.dart';

abstract class DayTaskState {}

class DaysTasks implements DayTaskState {
  final List<DayTask> dayTasks;

  DaysTasks({required this.dayTasks});
}

class DayTaskError implements DayTaskState {
  final String message;

  DayTaskError({required this.message});
}

class DayTaskLoading implements DayTaskState {}
