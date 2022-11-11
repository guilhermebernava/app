import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_states.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_events.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_events.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_states.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUseCase implements IHomeUseCase {
  @override
  Bloc<DayTaskEvent, DayTaskState> dayTaskBloc;
  @override
  Bloc<TaskEvent, TaskState> taskBloc;

  HomeUseCase({
    required this.dayTaskBloc,
    required this.taskBloc,
  });
}
