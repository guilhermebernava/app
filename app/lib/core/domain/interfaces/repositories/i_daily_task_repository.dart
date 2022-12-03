import 'package:app/core/domain/entities/daily_task/daily_task.dart';
import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:app/core/domain/interfaces/repositories/i_repository.dart';
import 'package:app/core/exceptions/db_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IDailyTaskRepository implements IRepository {
  Future<Either<DbException, List<DailyTask>>> getAll();
  Future<Either<DbException, void>> insert(
      DailyTask entity, DailyTaskType type);
}
