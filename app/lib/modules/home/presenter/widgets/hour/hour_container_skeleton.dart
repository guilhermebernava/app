import 'package:flutter/material.dart';

class HourContainerSkeleton extends StatefulWidget {
  final Size size;
  const HourContainerSkeleton({
    super.key,
    required this.size,
  });

  @override
  State<HourContainerSkeleton> createState() => _HourContainerSkeletonState();
}

class _HourContainerSkeletonState extends State<HourContainerSkeleton>
    with TickerProviderStateMixin {
  late final AnimationController _animateController;
  late final Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _animateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _animation = Tween(
      begin: const Alignment(-3.0, -3.0),
      end: const Alignment(1, 1),
    ).animate(CurvedAnimation(
        parent: _animateController, curve: Curves.fastOutSlowIn));

    _animateController.repeat();
  }

  @override
  void dispose() {
    _animateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
          width: widget.size.width,
          height: widget.size.height * 0.18,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color.fromARGB(255, 30, 30, 31),
                Color.fromARGB(255, 37, 35, 35),
                Color.fromARGB(255, 33, 33, 35),
              ],
              stops: const [
                0.1,
                0.3,
                0.4,
              ],
              begin: _animation.value,
              end: const Alignment(1, 1),
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
