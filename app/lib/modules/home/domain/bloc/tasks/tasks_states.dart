import 'package:app/core/domain/entities/daily_task/daily_task.dart';

abstract class TaskState {}

class TaskSuccess implements TaskState {
  final List<DailyTask> tasks;

  TaskSuccess({required this.tasks});
}

class TaskError implements TaskState {
  final String message;

  TaskError({required this.message});
}

class TasksLoading implements TaskState {}
