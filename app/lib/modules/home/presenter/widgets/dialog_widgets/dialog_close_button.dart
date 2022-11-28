import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class DialogCloseButton extends StatelessWidget {
  final VoidCallback onTap;

  const DialogCloseButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 9),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              Icons.close,
              size: 62,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
