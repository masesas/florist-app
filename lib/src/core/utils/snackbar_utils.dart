import 'package:florist_app/src/app/themes/themes.dart';
import 'package:flutter/material.dart';

class SnackBarUtils {
  final BuildContext context;

  SnackBarUtils(this.context);

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(text),
        action: SnackBarAction(
            label: "Dismiss",
            textColor: AppColors.buttonColorDark,
            onPressed: () {}),
      ),
    );
  }
}
