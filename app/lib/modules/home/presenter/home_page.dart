import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_events.dart';
import 'package:app/modules/home/domain/bloc/day_task_bloc/day_task_states.dart';
import 'package:app/modules/home/domain/entities/task.dart';
import 'package:app/modules/home/domain/interfaces/i_bottom_bar_usecase.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/bottom_bar.dart';
import 'package:app/modules/home/presenter/widgets/date_container_list.dart';
import 'package:app/modules/home/presenter/widgets/hour_list_container.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.55,
                        child: SfCircularChart(
                          title: ChartTitle(text: 'Suas horas de hoje'),
                          borderWidth: 0,
                          series: <CircularSeries<DailyTask, String>>[
                            PieSeries<DailyTask, String>(
                              dataSource: bloc.dayTasks[1].tasks,
                              sortingOrder: SortingOrder.descending,
                              explodeGesture: ActivationMode.singleTap,
                              selectionBehavior: SelectionBehavior(
                                enable: true,
                              ),
                              radius: "130",
                              pointColorMapper: (datum, index) =>
                                  datum.neonColor,
                              xValueMapper: (datum, index) =>
                                  "${datum.title} - ${datum.hoursInDay} hour/s",
                              yValueMapper: (datum, index) => datum.hoursInDay,
                              dataLabelMapper: (datum, index) =>
                                  "${datum.title} ${datum.hoursInDay} Horas",
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                textStyle: AppFonts.basic,
                                margin: EdgeInsets.zero,
                                labelPosition: ChartDataLabelPosition.inside,
                                overflowMode: OverflowMode.trim,
                              ),
                            )
                          ],
                        ),
                      ),
                      DateContainerList(
                        homeUseCase: homeUseCase,
                        size: size,
                        dates: bloc.dayTasks,
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
