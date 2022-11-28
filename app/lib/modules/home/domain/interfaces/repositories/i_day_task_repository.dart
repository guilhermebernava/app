import 'package:app/core/domain/entities/day_task.dart';
import 'package:app/modules/home/domain/errors/day_task_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IDayTaskRepository {
  Future<Either<DayTaskException, List<DayTask>>> getDaysTasks();
  Future<Either<DayTaskException, DayTask>> getTodayDayTasks();
}
