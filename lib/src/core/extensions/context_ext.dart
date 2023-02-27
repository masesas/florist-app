import 'package:florist_app/src/app/widget/dialog/dialog.dart';
import 'package:florist_app/src/core/utils/loading_utils.dart';
import 'package:florist_app/src/core/utils/snackBar_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../gen/app_localizations.dart';

extension ContextExt on BuildContext {
  AppLocalizations get lang => AppLocalizations.of(this);

  SnackBarUtils get snackBar => SnackBarUtils(this);

  void showFullLoading() {
    LoadingUtils.showFullLoading(this);
  }

  void hideFullLoading() {
    LoadingUtils.hideFullLoading(this);
  }

  void loadingDialog({
    String? message,
  }) {
    showLoadingDialog(this, message: message);
  }

  void dialogInfo({
    String? title,
    required String message,
    String? btnText,
    Function()? onYes,
  }) {
    showDialogInfo(
      context: this,
      message: message,
      title: title,
      btnText: btnText,
      onYes: onYes,
    );
  }

  double get deviceWidth => MediaQuery.of(this).size.width;

  double get deviceHeight => MediaQuery.of(this).size.height;

  double get halfDeviceWidth => MediaQuery.of(this).size.width / 2;

  double get halfDeviceHeight => MediaQuery.of(this).size.height / 2;
}
