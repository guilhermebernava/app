import 'package:app/modules/home/presenter/widgets/colored_container.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

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
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: Text(
              "Hoje Você tem:",
              style: AppFonts.basicBold,
            ),
          ),
          Align(
            alignment: const Alignment(-0.7, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "* 8 horas livres",
                  style: AppFonts.basic,
                ),
                Text(
                  "* 1 Hora Trabalhando",
                  style: AppFonts.basic,
                ),
                Text(
                  "* 3 Horas Estudando",
                  style: AppFonts.basic,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
