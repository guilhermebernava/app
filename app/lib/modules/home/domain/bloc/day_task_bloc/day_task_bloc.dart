import 'package:app/core/domain/entities/day_task/day_task.dart';
import 'package:app/core/domain/interfaces/repositories/i_day_task_repository.dart';
import 'package:app/core/extensions/dartz_extensions.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_events.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_states.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_events.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_states.dart';
import 'package:app/modules/home/domain/dtos/days_tasks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayTaskBloc extends Bloc<DayTaskEvent, DayTaskState> {
  final IDayTaskRepository dayTaskRepository;
  final Bloc<TaskEvent, TaskState> tasksBloc;

  DayTaskBloc({
    required this.dayTaskRepository,
    required this.tasksBloc,
  }) : super(DayTaskLoading()) {
    on<GetDaysTasks>((event, emit) async {
      emit(DayTaskLoading());
      final today = DateTime.now();
      await dayTaskRepository.insert(
        DayTask(day: "teste", dayNumber: today.day),
        [],
      );
      final todayDayTasks = await dayTaskRepository.getTodayDayTask();
      final daysTasks = await dayTaskRepository.getAll();

      if (todayDayTasks.isLeft() || daysTasks.isLeft()) {
        emit(DayTaskError(message: "Could not get your daily tasks"));
        return;
      }

      tasksBloc.add(
        GetTasks(
          dayNumber: todayDayTasks.right().dayNumber,
        ),
      );
      emit(
        DaysTasks(
          data: DaysTasksDto(
            daysTasks: daysTasks.right(),
            todayDayTasks: todayDayTasks.right(),
          ),
        ),
      );
    });
  }
}
