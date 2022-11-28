import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CoreBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const CoreBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: AppColors.white,
        size: 30,
      ),
    );
  }
}
