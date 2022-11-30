import 'package:app/core/domain/enums/daily_task_type.dart';
import 'package:isar/isar.dart';

part 'daily_task_db.g.dart';

@collection
class DailyTaskDb {
  Id id = Isar.autoIncrement;
  final DateTime initialDate;
  final DateTime endDate;
  final String neonColor;
  final String title;
  final double hoursInDay;
  @enumerated
  final DailyTaskType dailyTaskType;

  DailyTaskDb({
    required this.endDate,
    required this.initialDate,
    required this.title,
    required this.neonColor,
    required this.hoursInDay,
    required this.dailyTaskType,
  });
}
