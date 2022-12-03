import 'package:app/core/domain/entities/day_task/day_task.dart';
import 'package:app/core/domain/interfaces/repositories/i_daily_task_repository.dart';
import 'package:app/core/domain/interfaces/repositories/i_daily_task_type_respository.dart';
import 'package:app/core/domain/interfaces/repositories/i_repository.dart';
import 'package:app/core/domain/models/daily_task_db.dart';
import 'package:app/core/exceptions/db_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IDayTaskRepository implements IRepository {
  final IDailyTaskRepository dailyTaskRepository;
  final IDailyTaskTypeRepository dailyTaskTypeRepository;

  IDayTaskRepository({
    required this.dailyTaskRepository,
    required this.dailyTaskTypeRepository,
  });

  Future<Either<DbException, List<DayTask>>> getAll();
  Future<Either<DbException, void>> insert(
      DayTask entity, List<DailyTaskDb> tasks);
  Future<Either<DbException, DayTask>> getTodayDayTask();
}
