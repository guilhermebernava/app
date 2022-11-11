import 'package:app/modules/home/domain/entities/day_task.dart';
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
        vertical: 15,
        horizontal: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width * 0.17,
          decoration: BoxDecoration(
            gradient: isSelected
                ? AppColors.darkOrangeGradient
                : AppColors.whiteGradient,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(40, 0, 0, 0),
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dataDto.dayNumber.toString(),
                style: AppFonts.homeDataBold(
                    isSelected ? AppColors.white : AppColors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                dataDto.day,
                style: AppFonts.homeData(
                    isSelected ? AppColors.white : AppColors.black),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
