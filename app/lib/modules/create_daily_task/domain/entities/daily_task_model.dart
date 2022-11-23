import 'package:flutter/material.dart';

class DailyTask {
  final DateTime initialDate;
  final DateTime endDate;
  final Color neonColor;
  final Gradient gradient;
  final String title;
  final num hoursInDay;

  DailyTask({
    required this.endDate,
    required this.initialDate,
    required this.title,
    required this.gradient,
    required this.neonColor,
    required this.hoursInDay,
  });
}
