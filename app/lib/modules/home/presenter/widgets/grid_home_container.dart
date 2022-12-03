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
      itemCount: data.todayDayTasks.isarTypes.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final list = data.todayDayTasks.isarTasks.toList();
        final itens = list.where(
          (element) => element.type == list[index].type,
        );
        final item = itens.first;
        return HomeContainer(
          dailyTaskType: item.type.value?.type ?? "",
          size: size,
          title: itens.length.toString(),
          subtitle: "Total de Tarefas \n${item.type}",
        );
      },
    );
  }
}
