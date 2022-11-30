import 'package:app/core/domain/database_entities/daily_task_db/daily_task_db.dart';
import 'package:isar/isar.dart';

part 'day_task_db.g.dart';

@collection
class DayTaskDb {
  Id id = Isar.autoIncrement;
  final String day;
  final int dayNumber;
  final IsarLinks<DailyTaskDb> tasks = IsarLinks<DailyTaskDb>();

  DayTaskDb({
    required this.day,
    required this.dayNumber,
  });
}
