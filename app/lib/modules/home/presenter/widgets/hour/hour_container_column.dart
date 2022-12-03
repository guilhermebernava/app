import 'package:app/modules/home/presenter/widgets/colored_container.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HourContainerColumn extends StatelessWidget {
  final Color color;
  final Size size;
  final List<Widget> children;
  final String type;

  const HourContainerColumn({
    super.key,
    required this.children,
    required this.color,
    required this.size,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ColoredContainer(
        type: type,
        radius: 18,
        color: AppColors.lightBlack,
        height: size.height * 0.18,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
