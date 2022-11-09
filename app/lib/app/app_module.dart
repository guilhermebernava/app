import 'package:app/modules/home/home_module.dart';
import 'package:app/modules/splash/domain/use_cases/splash_use_case.dart';
import 'package:app/modules/splash/presenter/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => SplashPage(
            splashUseCase: SplashUseCase(route: HomeModule.moduleRoute),
          ),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          HomeModule.moduleRoute,
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        )
      ];
}
