import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemesDatas {
  static final datePickerLight = ThemeData.light().copyWith(
    dialogTheme: DialogTheme(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
    ),
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      onSurface: AppColors.black,
      background: AppColors.white,
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
