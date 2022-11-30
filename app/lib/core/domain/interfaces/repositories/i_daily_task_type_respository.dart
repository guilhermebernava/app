import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:app/core/domain/interfaces/repositories/i_repository.dart';
import 'package:app/core/exceptions/db_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IDailyTaskTypeRepository implements IRepository {
  Future<Either<DbException, List<DailyTaskType>>> getAll();
  Future<Either<DbException, DailyTaskType>> getById(int id);
  Future<Either<DbException, DailyTaskType>> getByName(String name);
  Future<Either<DbException, void>> insert(DailyTaskType type);
}
