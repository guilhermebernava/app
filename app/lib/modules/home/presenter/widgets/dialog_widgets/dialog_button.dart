import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final EdgeInsets padding;

  const DialogButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = AppColors.blue,
    this.padding = const EdgeInsets.only(bottom: 70),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact;
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.white,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              icon,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
