import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_bloc.dart';
import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_events.dart';
import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_states.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<BottomBarBloc, BottomBarState>(
    'emits [BottomBarError] when have an error with ChangeIndex event',
    build: () => BottomBarBloc(),
    act: (bloc) => bloc.add(ChangeIndex(index: -1)),
    expect: () => [isA<BottomBarError>()],
  );

  blocTest<BottomBarBloc, BottomBarState>(
    'emits [BottomBarSuccess] when have an success with ChangeIndex event',
    build: () => BottomBarBloc(),
    act: (bloc) => bloc.add(ChangeIndex(index: 1)),
    expect: () => [isA<BottomBarSuccess>()],
  );
}
