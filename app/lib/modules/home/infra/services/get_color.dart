import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class GetColor {
  static Color getColor(String type) {
    switch (type) {
      case "programing":
        return AppColors.blue;
      case "studying":
        return AppColors.darkOrange;
      case "work":
        return AppColors.rose;
      default:
        return AppColors.white;
    }
  }
}
