import 'package:app/modules/home/domain/dtos/days_tasks.dart';
import 'package:app/modules/home/presenter/widgets/home_container.dart';
import 'package:flutter/material.dart';

class GridHomeContainer extends StatelessWidget {
  final Size size;
  final DaysTasksDto data;

  const GridHomeContainer({
    super.key,
    required this.data,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.todayDayTasks.types.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final itens = data.todayDayTasks.tasks.where(
          (element) => element.type == data.todayDayTasks.types.toList()[index],
        );
        return HomeContainer(
          dailyTaskType: itens.first.dailyTaskType,
          size: size,
          title: itens.length.toString(),
          subtitle: "Total de Tarefas \n${itens.first.dailyTaskType.name}",
        );
      },
    );
  }
}
