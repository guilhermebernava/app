import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Gradient gradient;
  final double radius;
  final Color? neonColor;

  const ColoredContainer({
    super.key,
    required this.child,
    required this.height,
    required this.gradient,
    required this.width,
    this.radius = 30,
    this.neonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: neonColor != null
            ? [
                BoxShadow(
                  color: neonColor!.withOpacity(0.3),
                  blurRadius: 45,
                  spreadRadius: 2,
                  offset: const Offset(0, 0),
                )
              ]
            : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
