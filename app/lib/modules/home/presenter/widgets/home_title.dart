import 'package:app/modules/home/domain/dtos/days_tasks.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeTitle extends StatelessWidget {
  final DaysTasksDto data;
  final Size size;
  const HomeTitle({
    super.key,
    required this.data,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 5),
          child: Text(
            DateFormat("EEEE,  dd MMMM yyyy").format(
              data.todayDayTasks.tasks[0].initialDate,
            ),
            style: AppFonts.basicBold,
          ),
        ),
        Divider(
          color: AppColors.white.withOpacity(0.7),
          endIndent: size.width * 0.1,
          indent: size.width * 0.1,
          thickness: 1,
        ),
      ],
    );
  }
}
