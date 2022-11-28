import 'package:app/core/domain/enums/daily_task_type.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class GetColor {
  static Color getColor(DailyTaskType type) {
    switch (type) {
      case DailyTaskType.programing:
        return AppColors.blue;
      case DailyTaskType.studying:
        return AppColors.darkOrange;
      case DailyTaskType.work:
        return AppColors.rose;
      default:
        return AppColors.white;
    }
  }
}
