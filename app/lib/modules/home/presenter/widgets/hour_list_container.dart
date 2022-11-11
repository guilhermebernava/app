import 'package:app/modules/home/domain/bloc/tasks/tasks_states.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/hour_container.dart';
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
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 5,
            ),
          );
        }
        if (bloc is TaskSuccess) {
          return SizedBox(
            height: size.height * 0.5,
            width: size.width,
            child: ListView.builder(
              itemCount: bloc.tasks.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return HourContainer(
                  gradient: bloc.tasks[index].gradient,
                  color: bloc.tasks[index].neonColor,
                  size: size,
                  hour:
                      "${bloc.tasks[index].initialDate.hour}:${bloc.tasks[index].initialDate.minute}",
                  title: bloc.tasks[index].title,
                  duration:
                      "${bloc.tasks[index].initialDate.hour}:${bloc.tasks[index].initialDate.minute} - ${bloc.tasks[index].endDate.hour}:${bloc.tasks[index].endDate.minute}",
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
