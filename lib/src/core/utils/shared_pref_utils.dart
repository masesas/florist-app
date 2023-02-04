import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class SharePrefUtils {
  SharedPreferences prefs;

  SharePrefUtils({
    required this.prefs,
  });

  Future<void> setUser(String user) async {
    await prefs.setString(SharePrefKeys.USER, user);
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

  Future<String?> getUserToken() async {
    return prefs.getString(SharePrefKeys.USER_TOKEN);
  }
}

class SharePrefKeys {
  static const String USER = "${AppConstants.APP_KEY}_user";
  static const String LANGUAGE = "${AppConstants.APP_KEY}_language";
  static const String USER_TOKEN = "${AppConstants.APP_KEY}_token";
}
