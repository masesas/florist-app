import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  static Future<bool> isIpad() async {
    if (Platform.isAndroid) return false;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo info = await deviceInfo.iosInfo;
    if ((info.name ?? "").toLowerCase().contains("ipad")) {
      return true;
    }
    return false;
  }

  static Future<String> getInfoDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String model = '';
    String machine = '';
    String version = packageInfo.version;
    String buildNumber = 'build:${packageInfo.buildNumber}';

    if (Platform.isIOS) {
      IosDeviceInfo info = await deviceInfo.iosInfo;
      model = '${info.model ?? ""} ${info.utsname.machine ?? ""}';
      machine = info.systemVersion ?? "";
    } else {
      AndroidDeviceInfo info = await deviceInfo.androidInfo;
      model = '${info.manufacturer.toLowerCase()} ${info.model}';
      machine = info.version.sdkInt.toString();
    }
    // Get Country Local
    final currentAsLocale = await Devicelocale.currentAsLocale;
    String countryCode = currentAsLocale?.countryCode ?? '';

    return '$version $buildNumber ($model;$machine;$countryCode)';
  }
}
