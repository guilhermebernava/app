import 'package:app/core/domain/enums/daily_task_type.dart';
import 'package:flutter/material.dart';

class DailyTask {
  final DateTime initialDate;
  final DateTime endDate;
  final Color neonColor;
  final Gradient gradient;
  final String title;
  final num hoursInDay;
  final DailyTaskType dailyTaskType;

  DailyTask({
    required this.endDate,
    required this.initialDate,
    required this.title,
    required this.gradient,
    required this.neonColor,
    required this.hoursInDay,
    required this.dailyTaskType,
  });
}
