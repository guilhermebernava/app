import 'package:app/core/domain/enums/daily_task_type.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_events.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_states.dart';
import 'package:app/modules/home/domain/interfaces/i_bottom_bar_usecase.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/bottom_bar.dart';
import 'package:app/modules/home/presenter/widgets/date_container_list.dart';
import 'package:app/modules/home/presenter/widgets/home_container.dart';
import 'package:app/modules/home/presenter/widgets/hour_list_container.dart';
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
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              HomeContainer(
                                size: size,
                                title: bloc.data.todayDayTasks.tasks.length
                                    .toString(),
                                subtitle: "Total de Tarefas",
                              ),
                              HomeContainer(
                                size: size,
                                title: bloc.data.todayDayTasks.tasks
                                    .where(
                                      (element) =>
                                          element.dailyTaskType ==
                                          DailyTaskType.programing,
                                    )
                                    .length
                                    .toString(),
                                subtitle: "Total de Tarefas do Tipo Programar",
                              ),
                            ],
                          ),
                        ),
                        DateContainerList(
                          homeUseCase: homeUseCase,
                          size: size,
                          dates: bloc.data.daysTasks,
                        ),
                        HourListContainer(
                          homeUseCase: homeUseCase,
                          size: size,
                        ),
                        SizedBox(
                          height: size.height * 0.2,
                        ),
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
