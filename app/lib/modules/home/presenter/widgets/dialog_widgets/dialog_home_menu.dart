import 'package:app/modules/home/presenter/widgets/dialog_widgets/dialog_button.dart';
import 'package:app/modules/home/presenter/widgets/dialog_widgets/dialog_close_button.dart';
import 'package:flutter/material.dart';

class DialogHomeMenu extends StatelessWidget {
  final VoidCallback onTap;
  const DialogHomeMenu({
    super.key,
    required this.onTap,
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
              onTap: () {},
              icon: Icons.abc,
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
