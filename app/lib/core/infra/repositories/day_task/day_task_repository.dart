import 'package:app/core/domain/database_entities/daily_task_db/daily_task_db.dart';
import 'package:app/core/domain/database_entities/day_task_db/day_task_db.dart';
import 'package:app/core/domain/entities/day_task.dart';
import 'package:app/core/domain/interfaces/mapper/i_mapper.dart';
import 'package:app/core/domain/interfaces/repositories/i_day_task_repository.dart';
import 'package:app/core/exceptions/db_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';

class DayTaskRepository implements IDayTaskRepository {
  @override
  final IMapper<DayTask, DayTaskDb> mapper;

  DayTaskRepository({
    required this.mapper,
  });

  @override
  Future<Either<DbException, List<DayTask>>> getAll() async {
    try {
      final db = await openDatabase();
      final collection = db.dayTaskDbs;
      final data = await collection.where().findAll();

      if (data.isEmpty) {
        return const Right([]);
      }

      final dayTasks = <DayTask>[];
      for (var item in data) {
        final dayTask = mapper.fromEntity(item);
        dayTasks.add(dayTask);
      }

      final isClosed = await closeDatabase(db);

      if (!isClosed) {
        return Left(
          DbException(
            error: "could not close database",
            repository: "DayTaskRepository",
          ),
        );
      }

      return Right(dayTasks);
    } catch (e) {
      return Left(
        DbException(
          error: e.toString(),
          repository: "DayTaskRepository",
        ),
      );
    }
  }

  @override
  Future<Either<DbException, void>> insert(
      DayTaskDb entity, List<DailyTaskDb> tasks) async {
    try {
      final db = await openDatabase();
      final collection = db.dayTaskDbs;

      entity.tasks.addAll(tasks);

      int isSaved = await db.writeTxn(() async {
        return await collection.put(entity);
      });

      await db.writeTxn(() => entity.tasks.save());

      final isClosed = await closeDatabase(db);

      if (isSaved == -1 || isClosed == false) {
        return Left(
          DbException(
            error: "could not insert data into database",
            repository: "DayTaskRepository",
          ),
        );
      }

      return const Right(null);
    } catch (e) {
      return Left(
        DbException(
          error: e.toString(),
          repository: "DayTaskRepository",
        ),
      );
    }
  }

  @override
  Future<bool> closeDatabase(Isar database) async => await database.close();

  @override
  Future<Isar> openDatabase() async {
    final database = await Isar.open([DayTaskDbSchema, DailyTaskDbSchema]);
    return database;
  }
}
