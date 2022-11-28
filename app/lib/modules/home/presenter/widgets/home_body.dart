import 'package:app/modules/home/domain/dtos/days_tasks.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/date/date_container_list.dart';
import 'package:app/modules/home/presenter/widgets/grid_home_container.dart';
import 'package:app/modules/home/presenter/widgets/home_title.dart';
import 'package:app/modules/home/presenter/widgets/hour/hour_list_container.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final IHomeUseCase homeUseCase;
  final Size size;
  final DaysTasksDto data;

  const HomeBody({
    super.key,
    required this.data,
    required this.homeUseCase,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          children: [
            HomeTitle(
              data: data,
              size: size,
            ),
            GridHomeContainer(
              size: size,
              data: data,
            ),
            DateContainerList(
              homeUseCase: homeUseCase,
              size: size,
              data: data,
              dates: data.daysTasks,
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
}
