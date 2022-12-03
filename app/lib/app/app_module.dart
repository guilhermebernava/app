import 'package:app/core/infra/repositories/daily_task/daily_task_repository.dart';
import 'package:app/core/infra/repositories/daily_task_type/daily_task_type_repository.dart';
import 'package:app/core/infra/repositories/day_task/day_task_repository.dart';
import 'package:app/core/infra/services/app_show_date_picker.dart';
import 'package:app/modules/create_daily_task/create_daily_task_module.dart';
import 'package:app/modules/home/home_module.dart';
import 'package:app/modules/splash/domain/use_cases/splash_use_case.dart';
import 'package:app/modules/splash/presenter/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => AppShowDatePicker(),
        ),
        Bind(
          (i) => DailyTaskTypeRepository(),
        ),
        Bind(
          (i) => DailyTaskRepository(),
        ),
        Bind(
          (i) => DayTaskRepository(
            dailyTaskRepository: i.get(),
            dailyTaskTypeRepository: i.get(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => SplashPage(
            splashUseCase: SplashUseCase(route: HomeModule.moduleRoute),
          ),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          HomeModule.moduleRoute,
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          CreateDailyTaskModule.moduleRoute,
          module: CreateDailyTaskModule(),
          transition: TransitionType.fadeIn,
        )
      ];
}
