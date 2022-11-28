import 'package:flutter/material.dart';

class ColoredContainer extends StatefulWidget {
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
            boxShadow: widget.neonColor != null
                ? [
                    BoxShadow(
                      color: widget.neonColor!.withOpacity(0.05),
                      blurRadius: 45,
                      spreadRadius: 2,
                      offset: const Offset(0, 0),
                    )
                  ]
                : null,
            gradient: widget.gradient,
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
