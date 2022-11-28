import 'package:app/core/domain/interfaces/services/i_app_show_date_picker.dart';
import 'package:app/themes/theme_data/app_themes_datas.dart';
import 'package:flutter/material.dart';

class AppShowDatePicker implements IAppShowDatePicker {
  @override
  Future<DateTime?> showDatePickerWithHours(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: AppThemesDatas.datePickerLight,
          child: child!,
        );
      },
    );

    if (date == null) {
      return null;
    }

    final time = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (context, child) {
        return Theme(
          data: AppThemesDatas.datePickerLight,
          child: child!,
        );
      },
      initialTime: TimeOfDay.now(),
    );

    if (time == null) {
      return null;
    }

    final dateTimeWithHours = date.add(
      Duration(
        hours: time.hour,
        minutes: time.minute,
      ),
    );

    return dateTimeWithHours;
  }
}
