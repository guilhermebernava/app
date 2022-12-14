import 'package:app/modules/home/domain/bloc/tasks/tasks_states.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/hour/hour_container.dart';
import 'package:app/modules/home/presenter/widgets/hour/hour_list_container_loading.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HourListContainer extends StatelessWidget {
  final Size size;
  final IHomeUseCase homeUseCase;

  const HourListContainer({
    super.key,
    required this.size,
    required this.homeUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: homeUseCase.taskBloc,
      builder: (_, bloc) {
        if (bloc is TasksLoading) {
          return HourListContainerLoading(size: size);
        }
        if (bloc is TaskSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bloc.tasks.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return HourContainer(
                isCompleted: index.isEven,
                type: bloc.tasks[index].type.value?.type ?? "",
                index: index,
                //TODO adicionar cor
                color: AppColors.blue,
                dueDate: bloc.tasks[index].endDate,
                size: size,
                hour:
                    "${bloc.tasks[index].initialDate.hour}:${bloc.tasks[index].initialDate.minute}",
                title: bloc.tasks[index].title,
                duration:
                    "${bloc.tasks[index].initialDate.hour}:${bloc.tasks[index].initialDate.minute} - ${bloc.tasks[index].endDate.hour}:${bloc.tasks[index].endDate.minute}",
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
