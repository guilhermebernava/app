import 'package:app/core/domain/interfaces/services/i_app_show_date_picker.dart';
import 'package:app/modules/create_daily_task/domain/entities/daily_task_model.dart';

abstract class ICreateDailyTaskUseCase {
  final DailyTaskModel dailyTaskModel;
  final IAppShowDatePicker showDatePicker;

  ICreateDailyTaskUseCase({
    required this.dailyTaskModel,
    required this.showDatePicker,
  });

  Future<bool> createDailyTask();
}
