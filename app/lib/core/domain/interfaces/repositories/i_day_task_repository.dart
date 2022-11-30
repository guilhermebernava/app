import 'package:app/core/domain/database_entities/daily_task_db/daily_task_db.dart';
import 'package:app/core/domain/database_entities/day_task_db/day_task_db.dart';
import 'package:app/core/domain/entities/day_task.dart';
import 'package:app/core/domain/interfaces/mapper/i_mapper.dart';
import 'package:app/core/domain/interfaces/repositories/i_repository.dart';
import 'package:app/core/exceptions/db_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IDayTaskRepository implements IRepository {
  final IMapper<DayTask, DayTaskDb> mapper;

  IDayTaskRepository({
    required this.mapper,
  });

  Future<Either<DbException, List<DayTask>>> getAll();
  Future<Either<DbException, void>> insert(
      DayTaskDb entity, List<DailyTaskDb> tasks);
}
