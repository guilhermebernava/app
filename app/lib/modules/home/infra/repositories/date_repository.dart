import 'dart:isolate';
import 'package:app/modules/home/domain/entities/day_task.dart';
import 'package:app/modules/home/domain/entities/task.dart';
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
          day: DateFormat("EEE").format(date),
          dayNumber: date.day,
          tasks: [
            DailyTask(
              endDate: date.add(Duration(hours: i + 2)),
              initialDate: date.add(Duration(hours: i)),
              title: "Teste 1",
              gradient: AppColors.orangeGradient,
              neonColor: AppColors.orange,
            ),
            DailyTask(
              endDate: date.add(Duration(hours: i + 4)),
              initialDate: date.add(Duration(hours: i + 2)),
              title: "Teste 2",
              gradient: AppColors.roseGradient,
              neonColor: AppColors.rose,
            ),
            DailyTask(
              endDate: date.add(Duration(hours: i + 6)),
              initialDate: date.add(Duration(hours: i + 3)),
              title: "Teste 3",
              gradient: AppColors.blueGradient,
              neonColor: AppColors.blue,
            )
          ],
        ),
      );
    }

    Isolate.exit(isolatePort, dates);
  }
}
