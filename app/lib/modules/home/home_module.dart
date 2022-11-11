import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_bloc.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_bloc.dart';
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
          ),
        ),
      ];
}
