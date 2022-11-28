import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourContainerBottom extends StatelessWidget {
  final DateTime dueDate;
  final String duration;

  const HourContainerBottom({
    super.key,
    required this.dueDate,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              color: AppColors.white,
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              duration,
              style: AppFonts.hourText,
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.date_range,
              color: AppColors.white,
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              DateFormat("dd/MM/yyyy").format(
                dueDate,
              ),
              style: AppFonts.hourText,
            ),
          ],
        ),
      ],
    );
  }
}
