import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_states.dart';
import 'package:app/modules/home/domain/interfaces/i_bottom_bar_usecase.dart';
import 'package:app/modules/home/presenter/widgets/bottom_icon_button.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  final Size size;
  final IBottomBarUsecase bottomBarUsecase;

  const BottomBar({
    super.key,
    required this.size,
    required this.bottomBarUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.92),
      child: Container(
        width: size.width * 0.92,
        height: size.height * 0.13,
        decoration: BoxDecoration(
          color: AppColors.bottomBarColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: BlocBuilder(
            bloc: bottomBarUsecase.bottomBloc,
            builder: (_, bloc) {
              if (bloc is BottomBarSuccess) {
                return Row(
                  children: [
                    BottomIconButton(
                      icon: Icons.home,
                      isSelected: bloc.index == 0,
                      onTap: () {
                        bottomBarUsecase.validateSelectedButton(bloc.index, 0);
                      },
                    ),
                    BottomIconButton(
                      icon: Icons.calendar_month,
                      isSelected: bloc.index == 1,
                      onTap: () {
                        bottomBarUsecase.validateSelectedButton(bloc.index, 1);
                      },
                    )
                  ],
                );
              }
              return Container();
            }),
      ),
    );
  }
}
