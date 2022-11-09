import 'dart:isolate';
import 'package:app/modules/home/domain/entities/data_dto.dart';
import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:intl/intl.dart';

class HomeUseCase implements IHomeUseCase {
  @override
  Future<List<DateDto>> getDays() async {
    final port = ReceivePort();
    await Isolate.spawn<SendPort>(
      _getDates,
      port.sendPort,
      errorsAreFatal: true,
    );

    final response = await port.first;
    port.close();

    return response;
  }

  List<DateDto> _getDates(SendPort isolatePort) {
    final dateToday = DateTime.now();
    final dates = <DateDto>[];

    for (int i = -6; i <= 6; i++) {
      final date =
          DateTime(dateToday.year, dateToday.month - 1, dateToday.day + i);

      dates.add(DateDto(
        day: DateFormat("EEE").format(date),
        number: date.day,
      ));
    }

    Isolate.exit(isolatePort, dates);
  }
}
