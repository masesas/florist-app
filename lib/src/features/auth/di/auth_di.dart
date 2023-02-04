import 'package:florist_app/src/core/network/dio_http_client.dart';
import 'package:florist_app/src/core/utils/shared_pref_utils.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/datasources.dart';
import '../data/repositories/repositories.dart';
import '../domain/domain.dart';
import '../presentation/cubit/auth_cubit.dart';

void initAuthDI(GetIt sl) {
  /// * Bloc
  sl.registerFactory(() => AuthCubit(
        loginUseCase: sl<LoginUseCase>(),
        sharePrefUtils: sl<SharePrefUtils>(),
      ));

  /// * UseCase
  sl.registerLazySingleton(() => LoginUseCase(
        authRepository: sl<AuthRepository>(),
      ));

  /// * Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authLocal: sl<AuthLocal>(),
        authService: sl<AuthService>(),
      ));

  /// * DataSources
  sl.registerLazySingleton(() => AuthService(sl<DioHttpClient>()));
  sl.registerLazySingleton<AuthLocal>(
      () => AuthLocalImpl(sharePref: sl<SharePrefUtils>()));
}
