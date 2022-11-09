import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopContainer extends StatelessWidget {
  final Size size;

  const TopContainer({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: size.width,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat("MMMM, dd").format(DateTime.now()),
            style: AppFonts.basic,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "1/10 Tarefas",
              style: AppFonts.basicBold,
            ),
          ),
        ],
      ),
    );
  }
}
