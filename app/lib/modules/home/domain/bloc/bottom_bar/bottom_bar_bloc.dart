import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_events.dart';
import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  int _index = -1;

  int get index => _index;

  BottomBarBloc() : super(BottomBarSuccess(index: 0)) {
    on<ChangeIndex>((event, emit) async {
      if (event.index < 0) {
        emit(BottomBarError(message: "Value cannot be less than 0"));
        return;
      }
      _index = event.index;
      emit(BottomBarSuccess(index: _index));
    });
  }
}
