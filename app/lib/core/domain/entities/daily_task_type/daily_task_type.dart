import 'package:isar/isar.dart';

part 'daily_task_type.g.dart';

@collection
class DailyTaskType {
  Id id = Isar.autoIncrement;
  final String type;

  DailyTaskType({
    required this.type,
  });
}
