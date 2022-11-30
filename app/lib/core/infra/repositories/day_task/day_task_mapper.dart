import 'package:app/core/domain/database_entities/day_task_db/day_task_db.dart';
import 'package:app/core/domain/entities/daily_task.dart';
import 'package:app/core/domain/entities/day_task.dart';
import 'package:app/core/domain/interfaces/mapper/i_mapper.dart';
import 'package:flutter/material.dart';

class DayTaskMapper implements IMapper<DayTask, DayTaskDb> {
  @override
  DayTask fromEntity(DayTaskDb entity) {
    //TODO adicionar TASKS

    final tasks = <DailyTask>[];

    for (var taskDb in entity.tasks) {
      final task = DailyTask(
        dayTaskId: taskDb.id,
        endDate: taskDb.endDate,
        initialDate: taskDb.initialDate,
        title: taskDb.title,
        neonColor: Colors.red,
        hoursInDay: taskDb.hoursInDay,
        dailyTaskType: taskDb.dailyTaskType,
      );

      tasks.add(task);
    }
    return DayTask(
      id: entity.id,
      tasks: tasks,
      day: entity.day,
      dayNumber: entity.dayNumber,
      types: [],
    );
  }
}
