import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class BottomIconButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomIconButton({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color:
              isSelected ? AppColors.white : AppColors.white.withOpacity(0.3),
          size: 30,
        ),
      ),
    );
  }
}
