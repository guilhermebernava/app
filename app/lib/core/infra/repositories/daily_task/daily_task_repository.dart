import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:app/core/domain/entities/daily_task/daily_task.dart';
import 'package:app/core/domain/interfaces/repositories/i_daily_task_repository.dart';
import 'package:isar/isar.dart';
import 'package:dartz/dartz.dart';
import 'package:app/core/exceptions/db_exception.dart';

class DailyTaskRepository implements IDailyTaskRepository {
  @override
  Future<Either<DbException, List<DailyTask>>> getAll() async {
    final db = await openDatabase();

    try {
      final collection = db.dailyTasks;
      final data = await collection.where().findAll();

      return Right(data);
    } catch (e) {
      return Left(
        DbException(
          error: e.toString(),
          repository: "DailyTaskRepository",
        ),
      );
    } finally {
      await closeDatabase(db);
    }
  }

  @override
  Future<Either<DbException, void>> insert(
      DailyTask entity, DailyTaskType type) async {
    try {
      final db = await openDatabase();
      final collection = db.dailyTasks;

      final existType = await db.dailyTaskTypes
          .where()
          .filter()
          .typeEqualTo(type.type)
          .findFirst();

      if (existType == null) {
        return Left(
          DbException(
            error: "this type not exist",
            repository: "DailyTaskRepository",
          ),
        );
      }

      entity.type.value = existType;

      int isSaved = await db.writeTxn(() async {
        return await collection.put(entity);
      });

      await db.writeTxn(() => entity.type.save());

      final isClosed = await closeDatabase(db);

      if (isSaved == -1 || isClosed == false) {
        return Left(
          DbException(
            error: "could not insert data into database",
            repository: "DailyTaskRepository",
          ),
        );
      }

      return const Right(null);
    } catch (e) {
      return Left(
        DbException(
          error: e.toString(),
          repository: "DailyTaskRepository",
        ),
      );
    }
  }

  @override
  Future<bool> closeDatabase(Isar database) async => await database.close();

  @override
  Future<Isar> openDatabase() async {
    final database = await Isar.open([
      DailyTaskTypeSchema,
      DailyTaskSchema,
    ]);
    return database;
  }
}
