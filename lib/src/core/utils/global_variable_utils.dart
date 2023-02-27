import 'dart:io';

import 'package:devicelocale/devicelocale.dart';

import '../constants/app_constants.dart';
import 'app_utils.dart';

/// * Provider Global Variable
class GlobalVariableUtils {
  String deviceCountryCode;
  String userAgent;
  String currency;

  GlobalVariableUtils({
    this.deviceCountryCode = '',
    this.userAgent = '',
    this.currency = '',
  });

  init() {
    setUserAgent();
    setDeviceCountryCode();
  }

  String getUserAgent() => userAgent;

  String getDeviceCountryCode() => deviceCountryCode;

  String getCurrency() => currency;

  Future<void> setUserAgent() async {
    final bool isIpad = await AppUtils.isIpad();
    final String infoDevice = await AppUtils.getInfoDevice();
    final String agent = Platform.isIOS
        ? isIpad
            ? AppConstants.flowerIpad
            : AppConstants.flowerIphone
        : AppConstants.flowerAndroid;
    userAgent = agent + infoDevice;
  }

  Future<void> setDeviceCountryCode() async {
    final currentAsLocale = await Devicelocale.currentAsLocale;
    deviceCountryCode = currentAsLocale?.countryCode ?? '';
  }

  void setCurrency(String currency) {
    this.currency = currency;
  }
}
