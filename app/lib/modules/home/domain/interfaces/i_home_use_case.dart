import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_events.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_states.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_events.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IHomeUseCase {
  final Bloc<DayTaskEvent, DayTaskState> dayTaskBloc;
  final Bloc<TaskEvent, TaskState> taskBloc;

  IHomeUseCase({
    required this.dayTaskBloc,
    required this.taskBloc,
  });
}
