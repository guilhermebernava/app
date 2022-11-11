import 'package:app/modules/home/presenter/widgets/colored_container.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class HourContainer extends StatelessWidget {
  final Size size;
  final String hour;
  final String title;
  final String duration;
  final Color color;
  final Gradient gradient;

  const HourContainer({
    super.key,
    required this.size,
    required this.hour,
    required this.title,
    required this.duration,
    required this.color,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hour,
                style: AppFonts.hourTitle,
              ),
              ColoredContainer(
                neonColor: color,
                radius: 18,
                gradient: gradient,
                height: size.height * 0.11,
                width: size.width * 0.71,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.hourTextBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      duration,
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
    );
  }
}
