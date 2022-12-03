import 'package:app/core/domain/entities/daily_task/daily_task.dart';
import 'package:app/core/domain/entities/daily_task_type/daily_task_type.dart';
import 'package:app/core/domain/entities/day_task/day_task.dart';
import 'package:app/core/domain/interfaces/repositories/i_daily_task_type_respository.dart';
import 'package:app/core/domain/interfaces/repositories/i_daily_task_repository.dart';
import 'package:app/core/domain/interfaces/repositories/i_day_task_repository.dart';
import 'package:app/core/domain/models/daily_task_db.dart';
import 'package:app/core/exceptions/db_exception.dart';
import 'package:app/core/extensions/dartz_extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';

class DayTaskRepository implements IDayTaskRepository {
  @override
  IDailyTaskRepository dailyTaskRepository;
  @override
  IDailyTaskTypeRepository dailyTaskTypeRepository;

  DayTaskRepository({
    required this.dailyTaskRepository,
    required this.dailyTaskTypeRepository,
  });

  @override
  Future<Either<DbException, DayTask>> getTodayDayTask() async {
    final db = await openDatabase();
    try {
      final collection = db.dayTasks;
      final today = DateTime.now().day;
      final data =
          await collection.filter().dayNumberEqualTo(today).findFirst();

      if (data == null) {
        return Left(
          DbException(
            error: "could not find any DayTask",
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
  Future<Either<DbException, List<DayTask>>> getAll() async {
    final db = await openDatabase();

    try {
      final collection = db.dayTasks;
      final data = await collection.where().findAll();

      for (var element in data) {
        await element.isarTasks.load();
        await element.isarTypes.load();
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
  Future<Either<DbException, void>> insert(
    DayTask entity,
    List<DailyTaskDb> tasksModels,
  ) async {
    try {
      final types = <DailyTaskType>[];
      final tasks = <DailyTask>[];

      for (var taskModel in tasksModels) {
        final existType =
            await dailyTaskTypeRepository.getByName(taskModel.type);

        if (existType.isLeft()) {
          return Left(
            DbException(
              error: "could not find daily_task_type",
              repository: "DayTaskRepository",
            ),
          );
        }

        final exist =
            types.any((element) => element.type == existType.right().type);

        if (!exist) {
          types.add(existType.right());
        }

        final task = DailyTask(
          endDate: taskModel.endDate,
          initialDate: taskModel.initialDate,
          title: taskModel.title,
          neonColor: taskModel.neonColor,
          hoursInDay: taskModel.hoursInDay,
        );

        final isSaved = await dailyTaskRepository.insert(
          task,
          existType.right(),
        );

        if (isSaved.isLeft()) {
          return Left(
            DbException(
              error: "could not save daily_task",
              repository: "DayTaskRepository",
            ),
          );
        }

        tasks.add(task);
      }

      entity.isarTasks.addAll(tasks);
      entity.isarTypes.addAll(types);

      final db = await openDatabase();
      final collection = db.dayTasks;

      int isSaved = await db.writeTxn(() async {
        final id = await collection.put(entity);
        await entity.isarTasks.save();
        await entity.isarTypes.save();
        return id;
      });

      if (isSaved == -1) {
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
    final database = await Isar.open([
      DayTaskSchema,
      DailyTaskSchema,
      DailyTaskTypeSchema,
    ]);
    return database;
  }
}
