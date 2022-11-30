import 'package:app/core/domain/entities/day_task/day_task.dart';
import 'package:app/core/domain/interfaces/repositories/i_day_task_repository.dart';
import 'package:app/core/exceptions/db_exception.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_bloc.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_events.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_states.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IDayTaskRepository {}

void main() {
  final mockRepository = MockRepository();

  setUp(() {
    when(() => mockRepository.getAll()).thenAnswer(
      (invocation) async => Right([
        DayTask(day: "Segunda", dayNumber: 1),
      ]),
    );
  });

  blocTest<DayTaskBloc, DayTaskState>(
    'emits [DayTasksLoading, DayTasks] when have an Error with GetDaysTasks event',
    build: () => DayTaskBloc(
      dayTaskRepository: mockRepository,
      tasksBloc: TasksBloc(
        dayTaskRepository: mockRepository,
      ),
    ),
    act: (bloc) => bloc.add(GetDaysTasks()),
    wait: const Duration(seconds: 3),
    expect: () => [isA<DayTaskLoading>(), isA<DaysTasks>()],
  );

  blocTest<DayTaskBloc, DayTaskState>(
    'emits [DayTasksLoading, DayTaskError] when have a success with GetDaysTasks event',
    build: () => DayTaskBloc(
      dayTaskRepository: mockRepository,
      tasksBloc: TasksBloc(
        dayTaskRepository: mockRepository,
      ),
    ),
    act: (bloc) {
      reset(mockRepository);
      when(() => mockRepository.getAll()).thenAnswer(
        (invocation) async =>
            Left(DbException(error: "message", repository: "Message")),
      );
      bloc.add(GetDaysTasks());
    },
    wait: const Duration(seconds: 3),
    expect: () => [isA<DayTaskLoading>(), isA<DayTaskError>()],
  );
}
