import 'package:app/modules/home/domain/bloc/bottom_bar/bottom_bar_states.dart';
import 'package:app/modules/home/domain/interfaces/i_bottom_bar_usecase.dart';
import 'package:app/modules/home/presenter/widgets/bottom_icon_button.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatefulWidget {
  final Size size;
  final IBottomBarUsecase bottomBarUsecase;

  const BottomBar({
    super.key,
    required this.size,
    required this.bottomBarUsecase,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool _visible = false;

  @override
  void dispose() {
    super.dispose();
  }

//TODO criar bloc para inatividade
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        Future.delayed(Duration(seconds: 5), () {
          setState(() {
            _visible = false;
          });
        });
      },
      child: GestureDetector(
        onTap: () {
          if (!_visible) {
            setState(() {
              _visible = true;
            });
          }
        },
        behavior: HitTestBehavior.opaque,
        child: AnimatedSlide(
          offset: _visible ? const Offset(0, 0) : const Offset(0, 0.5),
          duration: const Duration(milliseconds: 500),
          child: Align(
            alignment: const Alignment(0, 0.95),
            child: Container(
              width: widget.size.width * 0.92,
              height: widget.size.height * 0.13,
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
                  bloc: widget.bottomBarUsecase.bottomBloc,
                  builder: (_, bloc) {
                    if (bloc is BottomBarSuccess) {
                      return Row(
                        children: [
                          BottomIconButton(
                            icon: Icons.home,
                            isSelected: bloc.index == 0,
                            onTap: () {
                              widget.bottomBarUsecase
                                  .validateSelectedButton(bloc.index, 0);
                            },
                          ),
                          BottomIconButton(
                            icon: Icons.calendar_month,
                            isSelected: bloc.index == 1,
                            onTap: () {
                              widget.bottomBarUsecase
                                  .validateSelectedButton(bloc.index, 1);
                            },
                          )
                        ],
                      );
                    }
                    return Container();
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
