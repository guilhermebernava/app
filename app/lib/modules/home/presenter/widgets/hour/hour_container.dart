import 'package:app/modules/home/presenter/widgets/hour/hour_container_bottom.dart';
import 'package:app/modules/home/presenter/widgets/hour/hour_container_column.dart';
import 'package:app/modules/home/presenter/widgets/hour/hour_container_top.dart';
import 'package:flutter/material.dart';

class HourContainer extends StatefulWidget {
  final Size size;
  final String hour;
  final String title;
  final String type;
  final String duration;
  final Color color;
  final int index;
  final DateTime dueDate;
  final bool isCompleted;

  const HourContainer({
    super.key,
    required this.size,
    required this.isCompleted,
    required this.hour,
    required this.title,
    required this.duration,
    required this.color,
    required this.index,
    required this.dueDate,
    required this.type,
  });

  @override
  State<HourContainer> createState() => _HourContainerState();
}

class _HourContainerState extends State<HourContainer> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    //cada item vai demorar 100 milisegundos a mais que o anterior
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 1000),
        padding: _animate
            ? const EdgeInsets.all(4.0)
            : const EdgeInsets.only(top: 10),
        child: HourContainerColumn(
          type: widget.type,
          color: widget.color,
          size: widget.size,
          children: [
            HourContainerTop(
              isCompleted: widget.isCompleted,
              size: widget.size,
              title: widget.title,
              type: widget.type,
            ),
            SizedBox(
              height: widget.size.height * 0.06,
            ),
            HourContainerBottom(
              dueDate: widget.dueDate,
              duration: widget.duration,
            )
          ],
        ),
      ),
    );
  }
}
