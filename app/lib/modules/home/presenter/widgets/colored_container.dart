import 'package:app/modules/home/infra/services/get_color.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ColoredContainer extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final Color color;
  final double radius;
  final String? type;

  const ColoredContainer({
    super.key,
    required this.child,
    required this.height,
    required this.color,
    required this.width,
    this.type,
    this.radius = 30,
  });

  @override
  State<ColoredContainer> createState() => _ColoredContainerState();
}

class _ColoredContainerState extends State<ColoredContainer> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _animate ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 1000),
        padding: _animate
            ? const EdgeInsets.all(4.0)
            : const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            boxShadow: widget.type != null
                ? [
                    BoxShadow(
                      color: GetColor.getColor(widget.type!).withOpacity(0.8),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.white.withOpacity(0.05),
                      blurRadius: 0.8,
                      spreadRadius: 0.8,
                    ),
                  ],
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
