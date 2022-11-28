import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class HourContainerTop extends StatelessWidget {
  final String title;
  final String type;
  final Size size;
  final bool isCompleted;

  const HourContainerTop({
    super.key,
    required this.size,
    required this.title,
    required this.type,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppFonts.hourTitle,
            ),
            Text(
              "  -  ",
              style: AppFonts.hourTitle,
            ),
            Text(
              type,
              style: AppFonts.hourText,
            ),
          ],
        ),
        isCompleted
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 25,
              )
            : const Icon(
                Icons.cancel_rounded,
                color: Colors.red,
                size: 25,
              ),
      ],
    );
  }
}
