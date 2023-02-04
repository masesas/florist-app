import 'package:florist_app/src/app/themes/themes.dart';
import 'package:florist_app/src/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_dialogs/material_dialogs.dart';

Future<dynamic> showDialogConfirmation(
  BuildContext context, {
  String? title,
  required String message,
  required Function() onYes,
  Function()? onNo,
}) async {
  return await Dialogs.materialDialog(
      title: title,
      msg: message,
      color: AppColors.colorBackground,
      context: context,
      actions: [
        OutlinedButton(
          onPressed: onNo ?? () => Modular.to.pop(),
          child: Text(context.lang.no),
        ),
        OutlinedButton(
          onPressed: onYes,
          child: Text(context.lang.yes),
        ),
      ]);
}
