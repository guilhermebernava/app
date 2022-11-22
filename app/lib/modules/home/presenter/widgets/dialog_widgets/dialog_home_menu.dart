import 'package:app/modules/home/domain/dtos/dialog_home_dto.dart';
import 'package:app/modules/home/presenter/widgets/dialog_widgets/dialog_button.dart';
import 'package:app/modules/home/presenter/widgets/dialog_widgets/dialog_close_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DialogHomeMenu extends StatelessWidget {
  final VoidCallback onTap;
  final DialogHomeDto params;

  const DialogHomeMenu({
    super.key,
    required this.onTap,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DialogButton(
              onTap: () {},
              icon: Icons.abc,
              padding: EdgeInsets.zero,
            ),
            DialogButton(
              onTap: () {
                Modular.to.pop();
                Modular.to.navigate(params.createDailyTaskRoute);
              },
              icon: Icons.calendar_month_outlined,
            ),
            DialogButton(
              padding: EdgeInsets.zero,
              onTap: () {},
              icon: Icons.abc,
            ),
          ],
        ),
        DialogCloseButton(
          onTap: onTap,
        ),
      ],
    );
  }
}
