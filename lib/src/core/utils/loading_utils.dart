import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoadingUtils {
  static void showFullLoading(BuildContext context) {
    if (!context.loaderOverlay.visible) {
      context.loaderOverlay.show();
    }
  }

  static void hideFullLoading(BuildContext context) {
    if (context.loaderOverlay.visible) {
      context.loaderOverlay.hide();
    }
  }
}
