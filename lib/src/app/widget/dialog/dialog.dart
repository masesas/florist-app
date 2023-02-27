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

Future<dynamic> showDialogInfo({
  required BuildContext context,
  String? title,
  required String message,
  String? btnText,
  Function()? onYes,
  IconData? icon,
}) async {
  return await Dialogs.materialDialog(
      context: context,
      color: AppColors.colorBackground,
      customView: Container(
        padding: const EdgeInsets.all(8.0),
        height: 300,
        child: Column(
          children: [
            Icon(
              icon ?? Icons.info,
              size: 50,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (title != null)
                      Container(
                          margin:
                              const EdgeInsets.only(top: AppSize.spaceSmall),
                          child: Text(title, style: AppStyles.fontBold16)),
                    Container(
                      margin: const EdgeInsets.only(top: AppSize.spaceDefault),
                      child: Text(
                        message,
                        style: AppStyles.fontBold14,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: onYes ?? () => Modular.to.pop(),
          child: Text(btnText ?? context.lang.close),
        ),
      ]);
}

void showLoadingDialog(
  BuildContext context, {
  String? message,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        content: Padding(
          padding: AppSize.paddingAllDefault,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
              const SizedBox(height: AppSize.spaceDefault),
              Text(message ?? 'Loading', style: AppStyles.fontBold16),
            ],
          ),
        ),
      );
    },
  );
}
