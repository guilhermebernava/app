import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create DailyTask",
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}
