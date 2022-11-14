import 'package:app/modules/home/presenter/widgets/hour_container_skeleton.dart';
import 'package:flutter/material.dart';

class HourListContainerLoading extends StatelessWidget {
  final Size size;
  const HourListContainerLoading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.51,
      width: size.width,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return HourContainerSkeleton(size: size);
        },
      ),
    );
  }
}
