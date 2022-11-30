import 'package:app/core/domain/enums/daily_task_type.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class DailyTask {
  final Id dayTaskId;
  final DateTime initialDate;
  final DateTime endDate;
  final Color neonColor;
  final String title;
  final num hoursInDay;
  final DailyTaskType dailyTaskType;

  DailyTask({
    required this.dayTaskId,
    required this.endDate,
    required this.initialDate,
    required this.title,
    required this.neonColor,
    required this.hoursInDay,
    required this.dailyTaskType,
  });
}
