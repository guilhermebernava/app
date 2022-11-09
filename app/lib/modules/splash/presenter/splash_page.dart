import 'package:app/modules/splash/domain/interfaces/use_cases/i_splash_use_case.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final ISplashUseCase splashUseCase;

  const SplashPage({
    super.key,
    required this.splashUseCase,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _inController;
  late final Animation<double> _inAnimation;
  bool goToNextPage = false;

  @override
  void dispose() {
    _inController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _inController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _inAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    )
        .chain(
          TweenSequence(
            [
              TweenSequenceItem(
                tween: Tween(begin: 0.0, end: 1.0),
                weight: 2,
              ),
              TweenSequenceItem(
                tween: Tween(begin: 1.0, end: 1.8),
                weight: 2,
              ),
              TweenSequenceItem(
                tween: Tween(begin: 1.8, end: 1.0),
                weight: 2,
              ),
            ],
          ),
        )
        .animate(
          CurvedAnimation(
            parent: _inController,
            curve: Curves.decelerate,
          ),
        );

    super.initState();

    Future.delayed(const Duration(milliseconds: 500)).then((_) {
      setState(() {
        goToNextPage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: AnimatedContainer(
          onEnd: () async {
            _inController.forward().then((value) async {
              Future.delayed(const Duration(seconds: 2));
              widget.splashUseCase.redirect();
            });
          },
          duration: const Duration(seconds: 2),
          curve: Curves.fastLinearToSlowEaseIn,
          width: goToNextPage ? size.width * 0.4 : size.width,
          height: goToNextPage ? size.height * 0.2 : size.height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: goToNextPage ? AppColors.primary : AppColors.black,
          ),
          child: Center(
            child: ScaleTransition(
              filterQuality: FilterQuality.high,
              scale: _inAnimation,
              child: const Icon(
                Icons.wallet,
                size: 45,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
