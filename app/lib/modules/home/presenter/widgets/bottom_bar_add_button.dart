import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomBarAddButton extends StatefulWidget {
  const BottomBarAddButton({super.key});

  @override
  State<BottomBarAddButton> createState() => _BottomBarAddButtonState();
}

class _BottomBarAddButtonState extends State<BottomBarAddButton>
    with TickerProviderStateMixin {
  late Animation<double> anim;
  late AnimationController _animationController;
  IconData icon = Icons.add;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
    anim = Tween(begin: 1.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          icon = Icons.close;
        });

        if (icon == Icons.close) {
          showDialog(
              context: context,
              builder: ((context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.add_a_photo,
                                color: AppColors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 70),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.add_a_photo,
                                color: AppColors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.add_a_photo,
                                color: AppColors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          icon = Icons.add;
                        });
                        Modular.to.pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 23),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.close,
                              size: 62,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, anim) => RotationTransition(
              turns: child.key == const ValueKey('add')
                  ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                  : Tween<double>(begin: 0.75, end: 1).animate(anim),
              child: ScaleTransition(scale: anim, child: child),
            ),
            child: icon == Icons.add
                ? const Icon(
                    Icons.add,
                    key: ValueKey('add'),
                    size: 60,
                    color: AppColors.white,
                  )
                : const Icon(
                    key: ValueKey('close'),
                    Icons.close,
                    size: 60,
                    color: AppColors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
