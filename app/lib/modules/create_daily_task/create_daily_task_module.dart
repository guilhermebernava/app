import 'package:app/modules/create_daily_task/presenter/create_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateDailyTaskModule extends Module {
  static const moduleRoute = "/create-daily-task/";

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const CreatePage(),
        ),
      ];
}
