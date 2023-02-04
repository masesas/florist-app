import 'package:flutter/material.dart';

import '../../../gen/app_localizations.dart';

AppLocalizations get translation =>
    _tr!; // helper function to avoid typing '!' all the time

AppLocalizations? _tr; // global variable

class TranslationsUtils {
  static init(BuildContext context) {
    _tr = AppLocalizations.of(context);
  }
}
