import 'package:app/modules/home/domain/entities/data_dto.dart';
import 'package:app/modules/home/presenter/widgets/date_container.dart';
import 'package:flutter/material.dart';

class DateContainerList extends StatelessWidget {
  final Size size;
  final List<DateDto> dates;

  const DateContainerList({
    super.key,
    required this.size,
    required this.dates,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.2,
      width: size.width,
      child: ListView.builder(
        itemCount: dates.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DateContainer(
            size: size,
            key: ValueKey(dates[index].number),
            dataDto: dates[index],
            isSelected: DateTime.now().day == dates[index].number,
          );
        },
      ),
    );
  }
}
