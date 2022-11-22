import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_states.dart';
import 'package:app/modules/home/domain/interfaces/i_bottom_bar_usecase.dart';
import 'package:app/modules/home/presenter/widgets/bottom_bar_add_button.dart';
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: const Alignment(0, 0.92),
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.15),
                  blurRadius: 20,
                  spreadRadius: 20,
                )
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder(
                bloc: bottomBarUsecase.bottomBloc,
                builder: (_, bloc) {
                  if (bloc is BottomBarSuccess) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BottomIconButton(
                          icon: Icons.home,
                          isSelected: bloc.index == 0,
                          onTap: () {
                            bottomBarUsecase.validateSelectedButton(
                                bloc.index, 0);
                          },
                        ),
                        BottomIconButton(
                          icon: Icons.abc,
                          isSelected: bloc.index == 1,
                          onTap: () {
                            bottomBarUsecase.validateSelectedButton(
                                bloc.index, 1);
                          },
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                        ),
                        BottomIconButton(
                          icon: Icons.dangerous,
                          isSelected: bloc.index == 2,
                          onTap: () {
                            bottomBarUsecase.validateSelectedButton(
                                bloc.index, 2);
                          },
                        ),
                        BottomIconButton(
                          icon: Icons.usb_rounded,
                          isSelected: bloc.index == 3,
                          onTap: () {
                            bottomBarUsecase.validateSelectedButton(
                                bloc.index, 3);
                          },
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.925),
          child: BottomBarAddButton(
            params: bottomBarUsecase.dialogHomeDto,
          ),
        ),
      ],
    );
  }
}
