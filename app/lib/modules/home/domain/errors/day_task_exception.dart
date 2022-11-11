class DayTaskException implements Exception {
  final String message;
  final String exception;

  DayTaskException({
    required this.message,
    required this.exception,
  });
}
