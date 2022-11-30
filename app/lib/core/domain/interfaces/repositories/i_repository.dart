import 'package:isar/isar.dart';

abstract class IRepository {
  Future<Isar> openDatabase();
  Future<bool> closeDatabase(Isar database);
}
