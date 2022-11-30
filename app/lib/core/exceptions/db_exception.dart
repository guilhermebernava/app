import 'package:isar/isar.dart';

class DbException implements Exception {
  final String error;
  final String repository;

  DbException({
    required this.error,
    required this.repository,
  });
}
