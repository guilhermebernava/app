abstract class TaskEvent {}

class GetTasks implements TaskEvent {
  final int dayNumber;

  GetTasks({required this.dayNumber});
}
