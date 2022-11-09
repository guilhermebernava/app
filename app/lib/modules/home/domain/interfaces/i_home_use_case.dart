import 'package:app/modules/home/domain/entities/data_dto.dart';

abstract class IHomeUseCase {
  Future<List<DateDto>> getDays();
}
