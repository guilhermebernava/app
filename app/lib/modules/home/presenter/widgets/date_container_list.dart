import 'package:app/modules/home/domain/bloc/tasks/tasks_events.dart';
import 'package:app/modules/home/domain/entities/day_task.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/date_container.dart';
import 'package:flutter/material.dart';

class DateContainerList extends StatefulWidget {
  final Size size;
  final List<DayTask> dates;
  final IHomeUseCase homeUseCase;

  const DateContainerList({
    super.key,
    required this.size,
    required this.dates,
    required this.homeUseCase,
  });

  @override
  State<DateContainerList> createState() => _DateContainerListState();
}

class _DateContainerListState extends State<DateContainerList> {
  int selectedIndex = 0;
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    //cada item vai demorar 100 milisegundos a mais que o anterior
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _animate ? 1 : 0,
      duration: const Duration(milliseconds: 1300),
      child: SizedBox(
        height: widget.size.height * 0.2,
        width: widget.size.width,
        child: ListView.builder(
          itemCount: widget.dates.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return DateContainer(
              index: index,
              onTap: () {
                widget.homeUseCase.taskBloc.add(
                  GetTasks(dayNumber: widget.dates[index].dayNumber),
                );

                setState(() {
                  selectedIndex = index;
                });
              },
              size: widget.size,
              key: ValueKey(widget.dates[index].dayNumber),
              dataDto: widget.dates[index],
              isSelected: selectedIndex == index,
            );
          },
        ),
      ),
    );
  }
}
