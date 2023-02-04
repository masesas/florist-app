import 'package:florist_app/src/core/network/dio_http_client.dart';
import 'package:florist_app/src/core/utils/shared_pref_utils.dart';
import 'package:florist_app/src/features/auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/account/account.dart';

final getIt = GetIt.instance;

/// initialize service locator (dependencies injection)
Future<void> initServiceLocator() async {
  /// * Core
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => SharePrefUtils(prefs: sharedPreferences));
  getIt.registerLazySingleton(() => DioHttpClient());

  /// * Account
  initLanguageDI(getIt);
  initAuthDI(getIt);
}
