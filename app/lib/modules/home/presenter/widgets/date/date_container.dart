import 'package:app/core/domain/entities/day_task.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  final Size size;
  final bool isSelected;
  final DayTask dataDto;
  final VoidCallback onTap;
  final int index;

  const DateContainer({
    super.key,
    this.isSelected = false,
    required this.size,
    required this.dataDto,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width * 0.16,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.darkOrange : AppColors.lightBlack,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dataDto.dayNumber.toString(),
                style: AppFonts.homeDataBold(AppColors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                dataDto.day,
                style: AppFonts.homeData(AppColors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
