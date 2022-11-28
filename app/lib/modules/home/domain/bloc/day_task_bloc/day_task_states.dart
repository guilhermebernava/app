import 'package:app/modules/home/domain/dtos/days_tasks.dart';

abstract class DayTaskState {}

class DaysTasks implements DayTaskState {
  final DaysTasksDto data;

  DaysTasks({required this.data});
}

class DayTaskError implements DayTaskState {
  final String message;

  DayTaskError({required this.message});
}

class DayTaskLoading implements DayTaskState {}
