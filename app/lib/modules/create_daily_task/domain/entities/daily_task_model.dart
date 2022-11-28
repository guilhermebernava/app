import 'package:app/core/domain/value_objects/not_null.dart';

class DailyTaskModel {
  final NotNull<DateTime> initialDate;
  final NotNull<DateTime> endDate;
  final NotNull<String> neonColor;
  final NotNull<String> gradient;
  final NotNull<String> title;
  final NotNull<double> hoursInDay;

  DailyTaskModel({
    required this.endDate,
    required this.initialDate,
    required this.title,
    required this.gradient,
    required this.neonColor,
    required this.hoursInDay,
  });

  factory DailyTaskModel.empty() {
    return DailyTaskModel(
      endDate: NotNull(null),
      initialDate: NotNull(null),
      title: NotNull(null),
      gradient: NotNull(null),
      neonColor: NotNull(null),
      hoursInDay: NotNull(null),
    );
  }
}
