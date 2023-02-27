import 'package:florist_app/src/app/widget/dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  Future<bool> checkPermission(
    BuildContext context,
    Permission permission,
  ) async {
    bool isPermission = true;
    var status = await permission.status;
    if (status.isDenied) {
      status = await permission.request();
    }
    if (status.isPermanentlyDenied) {
      isPermission = false;
      if (context.mounted) {
        await showDialogInfo(context: context, message: "");
      }
    }

    if (status.isDenied) isPermission = false;

    return isPermission;
  }
}
