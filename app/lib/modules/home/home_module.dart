import 'package:app/modules/create_daily_task/create_daily_task_module.dart';
import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_bloc.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_bloc.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_bloc.dart';
import 'package:app/modules/home/domain/dtos/dialog_home_dto.dart';
import 'package:app/modules/home/domain/use_cases/bottom_bar_usecase.dart';
import 'package:app/modules/home/domain/use_cases/home_use_case.dart';
import 'package:app/modules/home/infra/repositories/date_repository.dart';
import 'package:app/modules/home/presenter/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  static const moduleRoute = "/home/";

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (_) => DayTaskRepository(),
        ),
        Bind((_) => BottomBarBloc()),
        Bind(
          (i) => TasksBloc(
            dayTaskRepository: i.get<DayTaskRepository>(),
          ),
        ),
        Bind(
          (i) => DayTaskBloc(
              dayTaskRepository: i.get<DayTaskRepository>(),
              tasksBloc: i.get<TasksBloc>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(
            homeUseCase: HomeUseCase(
              dayTaskBloc: Modular.get<DayTaskBloc>(),
              taskBloc: Modular.get<TasksBloc>(),
            ),
            bottomBarUsecase: BottomBarUsecase(
              dialogHomeDto: DialogHomeDto(
                createDailyTaskRoute: CreateDailyTaskModule.moduleRoute,
              ),
              bottomBloc: Modular.get<BottomBarBloc>(),
            ),
          ),
        ),
      ];
}
