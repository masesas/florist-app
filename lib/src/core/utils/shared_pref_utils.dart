import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class SharePrefUtils {
  SharedPreferences prefs;

  SharePrefUtils({
    required this.prefs,
  });

  Future<bool> setUser(String user) async {
    return await prefs.setString(SharePrefKeys.USER, user);
  }

  Future<String?> getUser() async {
    return prefs.getString(SharePrefKeys.USER);
  }

  Future<bool> setLanguage(String lang) async {
    return await prefs.setString(SharePrefKeys.LANGUAGE, lang);
  }

  Future<String?> getLanguage() async {
    return prefs.getString(SharePrefKeys.LANGUAGE);
  }

  Future<bool> setUserToken(String token) async {
    return await prefs.setString(SharePrefKeys.USER_TOKEN, token);
  }

  Future<bool> setUserExpiresIn(int? expiresIn) async {
    return await prefs.setInt(SharePrefKeys.USER_EXPIRES_IN, expiresIn ?? 0);
  }

  Future<String?> getUserToken() async {
    return prefs.getString(SharePrefKeys.USER_TOKEN);
  }

  Future<bool> clearAllData() async {
    await prefs.remove(SharePrefKeys.USER);
    await prefs.remove(SharePrefKeys.USER_TOKEN);
    await prefs.remove(SharePrefKeys.USER_EXPIRES_IN);
    return true;
  }
}

class SharePrefKeys {
  static const String USER = "${AppConstants.APP_KEY}_user";
  static const String LANGUAGE = "${AppConstants.APP_KEY}_language";
  static const String USER_TOKEN = "${AppConstants.APP_KEY}_token";
  static const String USER_EXPIRES_IN = "${AppConstants.APP_KEY}_expires_in";
}
