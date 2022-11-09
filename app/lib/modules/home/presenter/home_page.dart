import 'package:app/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:app/modules/home/presenter/widgets/date_container_list.dart';
import 'package:app/modules/home/presenter/widgets/top_container.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final IHomeUseCase homeUseCase;
  const HomePage({
    super.key,
    required this.homeUseCase,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: FutureBuilder(
        future: homeUseCase.getDays(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 40,
              ),
              child: Column(
                children: [
                  TopContainer(
                    size: size,
                  ),
                  DateContainerList(
                    size: size,
                    dates: snapshot.data!,
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
