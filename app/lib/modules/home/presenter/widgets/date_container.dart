import 'package:app/modules/home/domain/entities/data_dto.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatefulWidget {
  final Size size;
  final bool isSelected;
  final DateDto dataDto;

  const DateContainer({
    super.key,
    this.isSelected = false,
    required this.size,
    required this.dataDto,
  });

  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  late bool isSelected = widget.isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 8,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          width: widget.size.width * 0.17,
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
                widget.dataDto.number.toString(),
                style: AppFonts.homeDataBold(
                    isSelected ? AppColors.white : AppColors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.dataDto.day,
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
