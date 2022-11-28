import 'package:app/modules/home/presenter/widgets/hour/hour_container_skeleton.dart';
import 'package:flutter/material.dart';

class HourListContainerLoading extends StatelessWidget {
  final Size size;
  const HourListContainerLoading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return HourContainerSkeleton(size: size);
        },
      ),
    );
  }
}
