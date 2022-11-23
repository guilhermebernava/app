import 'package:app/core/presenters/widgets/core_back_button.dart';
import 'package:app/core/presenters/widgets/core_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: CoreBackButton(
          onTap: () => Modular.to.pop(),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: const [
              CoreTextFormField(
                label: "Título:",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
