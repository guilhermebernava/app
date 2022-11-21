import 'package:app/modules/home/presenter/widgets/colored_container.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class HourContainer extends StatefulWidget {
  final Size size;
  final String hour;
  final String title;
  final String duration;
  final Color color;
  final Gradient gradient;
  final int index;

  const HourContainer({
    super.key,
    required this.size,
    required this.hour,
    required this.title,
    required this.duration,
    required this.color,
    required this.gradient,
    required this.index,
  });

  @override
  State<HourContainer> createState() => _HourContainerState();
}

class _HourContainerState extends State<HourContainer> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    //cada item vai demorar 100 milisegundos a mais que o anterior
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 1000),
        padding: _animate
            ? const EdgeInsets.all(4.0)
            : const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.hour,
                    style: AppFonts.hourTitle,
                  ),
                  ColoredContainer(
                    neonColor: widget.color,
                    radius: 18,
                    gradient: widget.gradient,
                    height: widget.size.height * 0.11,
                    width: widget.size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppFonts.hourTextBold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.duration,
                          style: AppFonts.hourText,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Color(0xffebebed),
              thickness: 3,
            )
          ],
        ),
      ),
    );
  }
}
