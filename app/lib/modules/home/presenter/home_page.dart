import 'package:app/core/presenters/widgets/core_loading.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_events.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_states.dart';
import 'package:app/modules/home/domain/interfaces/i_bottom_bar_usecase.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/bottom_bar/bottom_bar.dart';
import 'package:app/modules/home/presenter/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final IHomeUseCase homeUseCase;
  final IBottomBarUsecase bottomBarUsecase;

  const HomePage({
    super.key,
    required this.homeUseCase,
    required this.bottomBarUsecase,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    homeUseCase.dayTaskBloc.add(GetDaysTasks());

    return Stack(
      children: [
        Scaffold(
          body: BlocBuilder(
            bloc: homeUseCase.dayTaskBloc,
            builder: (_, bloc) {
              if (bloc is DayTaskLoading) {
                return const CoreLoading();
              }

              if (bloc is DayTaskError) {
                return Text(bloc.message);
              }

              if (bloc is DaysTasks) {
                return HomeBody(
                  data: bloc.data,
                  homeUseCase: homeUseCase,
                  size: size,
                );
              }
              return Container();
            },
          ),
        ),
        BottomBar(
          size: size,
          bottomBarUsecase: bottomBarUsecase,
        )
      ],
    );
  }
}
