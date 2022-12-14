import 'package:app/core/domain/entities/day_task/day_task.dart';
import 'package:app/core/domain/interfaces/repositories/i_day_task_repository.dart';
import 'package:app/core/extensions/dartz_extensions.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_events.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksBloc extends Bloc<TaskEvent, TaskState> {
  final IDayTaskRepository dayTaskRepository;

  TasksBloc({
    required this.dayTaskRepository,
  }) : super(TasksLoading()) {
    on<GetTasks>(
      ((event, emit) async {
        emit(TasksLoading());

        final result = await dayTaskRepository.getAll();

        if (result.isLeft()) {
          emit(TaskError(message: "Error in getting days"));
        }

        await Future.delayed(const Duration(seconds: 5));
        final dayTask = result.right().firstWhere(
              (element) => element.dayNumber == event.dayNumber,
              orElse: () => DayTask(
                day: "invalid",
                dayNumber: 0,
              ),
            );

        if (dayTask.dayNumber == 0) {
          emit(TaskError(message: "Could not found this day tasks"));
          return;
        }

        emit(TaskSuccess(tasks: dayTask.isarTasks.toList()));
      }),
    );
  }
}
