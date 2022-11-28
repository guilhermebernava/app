import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CoreLoading extends StatelessWidget {
  const CoreLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
        strokeWidth: 5,
      ),
    );
  }
}
