import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:app/core/domain/interfaces/repositories/i_daily_task_type_respository.dart';
import 'package:isar/isar.dart';
import 'package:dartz/dartz.dart';
import 'package:app/core/exceptions/db_exception.dart';

class DailyTaskTypeRepository implements IDailyTaskTypeRepository {
  @override
  Future<Either<DbException, List<DailyTaskType>>> getAll() async {
    final db = await openDatabase();

    try {
      final collection = db.dailyTaskTypes;
      final data = await collection.where().findAll();

      return Right(data);
    } catch (e) {
      return Left(
        DbException(
          error: e.toString(),
          repository: "DayTaskRepository",
        ),
      );
    } finally {
      await closeDatabase(db);
    }
  }

  @override
  Future<Either<DbException, DailyTaskType>> getById(int id) async {
    final db = await openDatabase();

    try {
      final collection = db.dailyTaskTypes;
      final data = await collection.where().filter().idEqualTo(id).findFirst();

      if (data == null) {
        return Left(
          DbException(
            error: "could not find any data with this ID into database",
            repository: "DayTaskRepository",
          ),
        );
      }

      return Right(data);
    } catch (e) {
      return Left(
        DbException(
          error: e.toString(),
          repository: "DayTaskRepository",
        ),
      );
    } finally {
      await closeDatabase(db);
    }
  }

  @override
  Future<Either<DbException, DailyTaskType>> getByName(String name) async {
    final db = await openDatabase();
    try {
      final collection = db.dailyTaskTypes;
      final data =
          await collection.where().filter().typeEqualTo(name).findFirst();

      if (data == null) {
        return Left(
          DbException(
            error: "could not find any data with this ID into database",
            repository: "DayTaskRepository",
          ),
        );
      }

      return Right(data);
    } catch (e) {
      return Left(
        DbException(
          error: e.toString(),
          repository: "DayTaskRepository",
        ),
      );
    } finally {
      await closeDatabase(db);
    }
  }

  @override
  Future<Either<DbException, void>> insert(DailyTaskType entity) async {
    try {
      final db = await openDatabase();
      final collection = db.dailyTaskTypes;

      int isSaved = await db.writeTxn(() async {
        return await collection.put(entity);
      });

      final isClosed = await closeDatabase(db);

      if (isSaved == -1 || isClosed == false) {
        return Left(
          DbException(
            error: "could not insert data into database",
            repository: "DailyTaskTypeRepository",
          ),
        );
      }

      return const Right(null);
    } catch (e) {
      return Left(
        DbException(
          error: e.toString(),
          repository: "DailyTaskTypeRepository",
        ),
      );
    }
  }

  @override
  Future<bool> closeDatabase(Isar database) async => await database.close();

  @override
  Future<Isar> openDatabase() async {
    final database = await Isar.open([DailyTaskTypeSchema]);
    return database;
  }
}
