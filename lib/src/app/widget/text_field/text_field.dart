import 'package:florist_app/gen/app_localizations.dart';
import 'package:florist_app/src/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'custom_reactive_text_field.dart';
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
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: outlineInputPrimary.copyWith(
          borderSide: BorderSide(color: color ?? AppColors.colorPrimary)),
      enabledBorder: borderAll
          ? outlineInputPrimary.copyWith(
              borderSide: BorderSide(color: color ?? AppColors.grey70))
          : null,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.grey70),
      ),
    );
