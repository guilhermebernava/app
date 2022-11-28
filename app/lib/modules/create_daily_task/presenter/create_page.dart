import 'package:app/core/presenters/widgets/core_back_button.dart';
import 'package:app/core/presenters/widgets/core_text_form_field.dart';
import 'package:app/modules/create_daily_task/domain/interfaces/i_create__daily_task_use_case.dart';
import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class CreatePage extends StatefulWidget {
  final ICreateDailyTaskUseCase createDailyTaskUseCase;
  const CreatePage({
    super.key,
    required this.createDailyTaskUseCase,
  });

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  //TODO implementar tela para salvar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.black,
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
            children: [
              const CoreTextFormField(
                label: "Título:",
                hintText: "Título:",
              ),
              IconButton(
                onPressed: () async {
                  final date = await widget
                      .createDailyTaskUseCase.showDatePicker
                      .showDatePickerWithHours(context);

                  if (date != null) {
                    widget.createDailyTaskUseCase.dailyTaskModel
                        .initialDate(date);
                  }
                },
                icon: const Icon(
                  Icons.date_range_rounded,
                  size: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    const Divider(
                      thickness: 2,
                    ),
                    const Text("Data E Hora Inicial:"),
                    Text(
                      DateFormat("dd/MM/yyyy")
                          .format(
                            widget.createDailyTaskUseCase.dailyTaskModel
                                    .initialDate.value ??
                                DateTime.now(),
                          )
                          .toString(),
                      style: AppFonts.textFormTitle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat.Hm().format(
                        widget.createDailyTaskUseCase.dailyTaskModel.initialDate
                                .value ??
                            DateTime.now(),
                      ),
                      style: AppFonts.textFormError,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
