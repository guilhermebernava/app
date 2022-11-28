import 'package:app/modules/home/domain/bloc/tasks/tasks_bloc.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_events.dart';
import 'package:app/modules/home/domain/bloc/tasks/tasks_states.dart';
import 'package:app/core/domain/entities/day_task.dart';
import 'package:app/modules/home/domain/interfaces/repositories/i_day_task_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IDayTaskRepository {}

void main() {
  final mockRepository = MockRepository();

  setUp(() {
    when(() => mockRepository.getDaysTasks()).thenAnswer(
      (invocation) async => Right([
        DayTask(tasks: [], day: "Segunda", dayNumber: 1, types: []),
      ]),
    );
  });

  blocTest<TasksBloc, TaskState>(
    'emits [TasksLoading, TasksSuccess] when have a success with GetTasks event',
    build: () => TasksBloc(dayTaskRepository: mockRepository),
    act: (bloc) => bloc.add(GetTasks(dayNumber: 1)),
    wait: const Duration(seconds: 3),
    expect: () => [isA<TasksLoading>(), isA<TaskSuccess>()],
  );

  blocTest<TasksBloc, TaskState>(
    'emits [TasksLoading, TaskError] when have an Error with GetTasks event',
    build: () => TasksBloc(dayTaskRepository: mockRepository),
    act: (bloc) => bloc.add(GetTasks(dayNumber: 10)),
    wait: const Duration(seconds: 3),
    expect: () => [isA<TasksLoading>(), isA<TaskError>()],
  );
}
