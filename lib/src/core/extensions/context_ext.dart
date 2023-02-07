import 'package:florist_app/src/core/utils/snackBar_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../gen/app_localizations.dart';

extension ContextExt on BuildContext {
  AppLocalizations get lang => AppLocalizations.of(this);

  SnackBarUtils get snackBar => SnackBarUtils(this);

  double get deviceWidth => MediaQuery.of(this).size.width;

  double get deviceHeight => MediaQuery.of(this).size.height;

  double get halfDeviceWidth => MediaQuery.of(this).size.width / 2;

  double get halfDeviceHeight => MediaQuery.of(this).size.height / 2;
}
