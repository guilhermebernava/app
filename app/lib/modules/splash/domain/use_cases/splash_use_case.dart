import 'package:app/modules/splash/domain/interfaces/use_cases/i_splash_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashUseCase implements ISplashUseCase {
  @override
  final String route;

  SplashUseCase({required this.route});

  @override
  void redirect() {
    Modular.to.navigate(route);
  }
}
