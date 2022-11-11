import 'package:app/modules/home/presenter/widgets/colored_container.dart';
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
    return ColoredContainer(
      neonColor: AppColors.primary,
      gradient: AppColors.primaryGradient,
      height: size.height * 0.2,
      width: size.width,
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
