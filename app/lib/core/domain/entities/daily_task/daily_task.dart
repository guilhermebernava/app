import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:isar/isar.dart';

part 'daily_task.g.dart';

@collection
class DailyTask {
  Id id = Isar.autoIncrement;
  final DateTime initialDate;
  final DateTime endDate;
  final String neonColor;
  final String title;
  final double hoursInDay;
  final IsarLink<DailyTaskType> type = IsarLink<DailyTaskType>();

  DailyTask({
    required this.endDate,
    required this.initialDate,
    required this.title,
    required this.neonColor,
    required this.hoursInDay,
  });
}
