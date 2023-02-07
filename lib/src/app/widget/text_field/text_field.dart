import 'package:florist_app/src/app/themes/themes.dart';
import 'package:florist_app/src/app/widget/widgets.dart';
import 'package:florist_app/src/core/extensions/context_ext.dart';
import 'package:florist_app/src/core/global/domain/entities/input_option_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'input_option_no_title.dart';
part 'reactive_input_option.dart';
part 'reactive_input_text.dart';
part 'text_field_no_input.dart';
part 'text_field_no_title.dart';

OutlineInputBorder outlineInputPrimary = OutlineInputBorder(
  borderSide: const BorderSide(color: AppColors.colorPrimary),
  borderRadius: BorderRadius.circular(10),
);

InputDecoration inputDecoration(
  String? hint, {
  bool borderAll = false,
  Color? color,
  Color? colorFilled,
}) =>
    InputDecoration(
      filled: true,
      fillColor: colorFilled ?? AppColors.colorBackground,
      focusedErrorBorder: outlineInputPrimary,
      hintText: hint,
      hintStyle: AppStyles.fontBold11.copyWith(color: AppColors.colorHintText),
      isDense: true,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.buttonColorDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.grey70),
      ),
    );
