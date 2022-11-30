class DailyTaskDb {
  final DateTime initialDate;
  final DateTime endDate;
  final String neonColor;
  final String title;
  final double hoursInDay;
  final String type;

  DailyTaskDb({
    required this.endDate,
    required this.initialDate,
    required this.title,
    required this.neonColor,
    required this.hoursInDay,
    required this.type,
  });
}
