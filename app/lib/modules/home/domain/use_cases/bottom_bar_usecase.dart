import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_states.dart';
import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_events.dart';
import 'package:app/modules/home/domain/interfaces/i_bottom_bar_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarUsecase implements IBottomBarUsecase {
  @override
  Bloc<BottomBarEvent, BottomBarState> bottomBloc;

  BottomBarUsecase({required this.bottomBloc});

  @override
  void validateSelectedButton(int blocIndex, int index) {
    if (blocIndex != index) {
      bottomBloc.add(ChangeIndex(index: index));
      return;
    }
  }
}
