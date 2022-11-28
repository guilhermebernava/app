import 'package:app/core/domain/interfaces/services/i_app_show_date_picker.dart';
import 'package:app/modules/create_daily_task/domain/entities/daily_task_model.dart';
import 'package:app/modules/create_daily_task/domain/interfaces/i_create__daily_task_use_case.dart';

class CreateDailyTaskUseCase implements ICreateDailyTaskUseCase {
  @override
  DailyTaskModel dailyTaskModel = DailyTaskModel.empty();
  @override
  IAppShowDatePicker showDatePicker;

  CreateDailyTaskUseCase({
    required this.showDatePicker,
  });

  @override
  Future<bool> createDailyTask() {
    throw UnimplementedError();
  }
}
