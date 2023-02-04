import 'package:florist_app/src/core/utils/snackBar_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../gen/app_localizations.dart';

extension ContextExt on BuildContext {
  AppLocalizations get lang => AppLocalizations.of(this);

  SnackBarUtils get snackBar => SnackBarUtils(this);
}
