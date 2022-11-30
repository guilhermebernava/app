import 'dart:isolate';
import 'package:app/core/domain/entities/day_task.dart';
import 'package:app/core/domain/entities/daily_task.dart';
import 'package:app/core/domain/enums/daily_task_type.dart';
import 'package:app/modules/home/domain/errors/day_task_exception.dart';
import 'package:app/modules/home/domain/interfaces/repositories/i_day_task_repository.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

class DayTaskRepository implements IDayTaskRepository {
  @override
  Future<Either<DayTaskException, List<DayTask>>> getDaysTasks() async {
    try {
      final port = ReceivePort();
      await Isolate.spawn<SendPort>(
        _getDates,
        port.sendPort,
        errorsAreFatal: true,
      );

      final response = await port.first as List<DayTask>;
      port.close();

      return Right(response);
    } catch (e) {
      return Left(
        DayTaskException(
          message: "Error in getting days",
          exception: e.toString(),
        ),
      );
    }
  }

  List<DayTask> _getDates(SendPort isolatePort) {
    final dateToday = DateTime.now();
    final dates = <DayTask>[];

    for (int i = -6; i <= 6; i++) {
      final date =
          DateTime(dateToday.year, dateToday.month - 1, dateToday.day + i);

      dates.add(
        DayTask(
          id: -1,
          types: [
            DailyTaskType.work,
            DailyTaskType.programing,
          ],
          day: DateFormat("EEE").format(date),
          dayNumber: date.day,
          tasks: [
            DailyTask(
              endDate: date.add(Duration(hours: i + 2)),
              initialDate: date.add(Duration(hours: i)),
              title: "Programing",
              neonColor: AppColors.orange,
              dailyTaskType: DailyTaskType.programing,
              hoursInDay: date
                  .add(Duration(hours: i + 2))
                  .difference(date.add(Duration(hours: i)))
                  .inHours,
            ),
            DailyTask(
              endDate: date.add(Duration(hours: i + 7)),
              initialDate: date.add(Duration(hours: i + 2)),
              title: "Studying",
              neonColor: AppColors.rose,
              dailyTaskType: DailyTaskType.studying,
              hoursInDay: date
                  .add(Duration(hours: i + 7))
                  .difference(date.add(Duration(hours: i + 2)))
                  .inHours,
            ),
            DailyTask(
              endDate: date.add(Duration(hours: i + 6)),
              initialDate: date.add(Duration(hours: i + 3)),
              title: "Work",
              neonColor: AppColors.blue,
              dailyTaskType: DailyTaskType.work,
              hoursInDay: date
                  .add(Duration(hours: i + 6))
                  .difference(date.add(Duration(hours: i + 3)))
                  .inHours,
            )
          ],
        ),
      );
    }

    Isolate.exit(isolatePort, dates);
  }

  @override
  Future<Either<DayTaskException, DayTask>> getTodayDayTasks() async {
    final date = DateTime.now();
    final todayDayTask = DayTask(
      id: -1,
      types: [
        DailyTaskType.work,
        DailyTaskType.programing,
      ],
      day: DateFormat("EEE").format(date),
      dayNumber: date.day,
      tasks: [
        DailyTask(
          endDate: date.add(const Duration(hours: 2)),
          initialDate: date.add(const Duration(hours: 0)),
          title: "Programar",
          neonColor: AppColors.orange,
          dailyTaskType: DailyTaskType.programing,
          hoursInDay: date
              .add(const Duration(hours: 4))
              .difference(date.add(const Duration(hours: 3)))
              .inHours,
        ),
        DailyTask(
          endDate: date.add(const Duration(hours: 7)),
          initialDate: date.add(const Duration(hours: 5)),
          title: "Ler",
          dailyTaskType: DailyTaskType.programing,
          neonColor: AppColors.rose,
          hoursInDay: date
              .add(const Duration(hours: 9))
              .difference(date.add(const Duration(hours: 10)))
              .inHours,
        ),
        DailyTask(
          endDate: date.add(const Duration(hours: 7)),
          initialDate: date.add(const Duration(hours: 5)),
          title: "Ler",
          dailyTaskType: DailyTaskType.work,
          neonColor: AppColors.rose,
          hoursInDay: date
              .add(const Duration(hours: 9))
              .difference(date.add(const Duration(hours: 10)))
              .inHours,
        ),
      ],
    );
    return Right(todayDayTask);
  }
}
