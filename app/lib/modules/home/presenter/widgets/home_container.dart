import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final Size size;
  final String title;
  final String subtitle;

  const HomeContainer({
    super.key,
    required this.size,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: const Alignment(0, -1.05),
        children: [
          Container(
            width: size.width * 0.5,
            decoration: BoxDecoration(
              color: AppColors.lightBlack,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withOpacity(0.05),
                  blurRadius: 0.8,
                  spreadRadius: 0.8,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppFonts.basicBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    subtitle,
                    style: AppFonts.basic,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: AppColors.primary,
            width: size.width * 0.3,
            height: 4,
          ),
        ],
      ),
    );
  }
}
