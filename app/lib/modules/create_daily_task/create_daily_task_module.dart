import 'package:app/core/infra/services/app_show_date_picker.dart';
import 'package:app/modules/create_daily_task/domain/use_cases/create_daily_task_use_case.dart';
import 'package:app/modules/create_daily_task/presenter/create_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateDailyTaskModule extends Module {
  static const moduleRoute = "/create-daily-task/";

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => CreateDailyTaskUseCase(
            showDatePicker: i.get<AppShowDatePicker>(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => CreatePage(
            createDailyTaskUseCase: Modular.get<CreateDailyTaskUseCase>(),
          ),
        ),
      ];
}
