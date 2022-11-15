import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_events.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_states.dart';
import 'package:app/modules/home/domain/interfaces/i_bottom_bar_usecase.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/bottom_bar.dart';
import 'package:app/modules/home/presenter/widgets/date_container_list.dart';
import 'package:app/modules/home/presenter/widgets/hour_list_container.dart';
import 'package:app/modules/home/presenter/widgets/top_container.dart';
import 'package:app/themes/colors/app_colors.dart';
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
          backgroundColor: AppColors.white,
          body: BlocBuilder(
            bloc: homeUseCase.dayTaskBloc,
            builder: (_, bloc) {
              if (bloc is DayTaskLoading) {
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 5,
                  ),
                );
              }

              if (bloc is DayTaskError) {
                Text(bloc.message);
              }

              if (bloc is DaysTasks) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TopContainer(
                          size: size,
                        ),
                        DateContainerList(
                          homeUseCase: homeUseCase,
                          size: size,
                          dates: bloc.dayTasks,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        HourListContainer(
                          homeUseCase: homeUseCase,
                          size: size,
                        )
                      ],
                    ),
                  ),
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
