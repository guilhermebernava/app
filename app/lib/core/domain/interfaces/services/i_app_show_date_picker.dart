import 'package:flutter/material.dart';

abstract class IAppShowDatePicker {
  Future<DateTime?> showDatePickerWithHours(BuildContext context);
}
