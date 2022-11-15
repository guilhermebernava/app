import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_events.dart';
import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IBottomBarUsecase {
  final Bloc<BottomBarEvent, BottomBarState> bottomBloc;

  IBottomBarUsecase({required this.bottomBloc});

  void validateSelectedButton(int blocIndex, int index);
}
