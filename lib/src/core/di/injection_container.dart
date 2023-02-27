import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:florist_app/src/core/utils/global_variable_utils.dart';
import 'package:florist_app/src/core/utils/shared_pref_utils.dart';
import 'package:florist_app/src/features/auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../../features/account/account.dart';
import '../network/network.dart';

final getIt = GetIt.I;

/// initialize service locator (dependencies injection)
Future<void> initServiceLocator() async {
  /// * Core
  final sharePref = await SharedPreferences.getInstance();
  registerLazySingleton(() => sharePref);

  registerLazySingleton(() => SharePrefUtils(prefs: getIt()));

  registerLazySingleton(() => DioHttpClient());

  registerSingleton<GlobalVariableUtils>(GlobalVariableUtils()..init());

  registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: Connectivity()));

  /// * Account
  //initAccountDi();

  /// * Auth
  initAuthDI(getIt);

  /// * GoogleMaps
  //_initGoogleMapsDI();
}

// Get It Library wrappers
void registerSingleton<T extends Object>(T dependency) =>
    getIt.registerSingleton<T>(dependency);

void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc) =>
    getIt.registerLazySingleton<T>(factoryFunc);

void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc) =>
    getIt.registerFactory<T>(factoryFunc);
