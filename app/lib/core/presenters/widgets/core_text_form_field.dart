import 'package:app/themes/colors/app_colors.dart';
import 'package:app/themes/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoreTextFormField extends StatelessWidget {
  final String label;
  final String? Function(String? value)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final double bottomMargin;
  final String? hintText;

  const CoreTextFormField({
    Key? key,
    required this.label,
    this.validator,
    this.onChanged,
    this.bottomMargin = 25.0,
    this.inputFormatters,
    this.initialValue,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 15,
            ),
            child: Text(
              label,
              style: AppFonts.textFormTitle,
            ),
          ),
          TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            validator: validator,
            style: AppFonts.textFormText,
            decoration: InputDecoration(
              hintText: hintText,
              errorStyle: AppFonts.textFormError,
              hintStyle: AppFonts.textFormHint,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2.5,
                  color: AppColors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
