import 'package:florist_app/src/core/utils/shared_pref_utils.dart';
import 'package:get_it/get_it.dart';

import '../../../core/network/network.dart';
import '../data/datasources/datasources.dart';
import '../data/repositories/repositories.dart';
import '../domain/domain.dart';
import '../presentation/cubit/auth_cubit.dart';

void initAuthDI(GetIt sl) {
  /// * DataSources
  sl.registerLazySingleton(() => AuthService(sl<DioHttpClient>()));
  sl.registerLazySingleton(
      () => AuthLocalImpl(sharePref: sl<SharePrefUtils>()));

  /// * Repository
  sl.registerLazySingleton(() => AuthRepositoryImpl(
        authLocal: sl<AuthLocalImpl>(),
        authService: sl<AuthService>(),
      ));

  /// * UseCase
  sl.registerLazySingleton(() => LoginUseCase(
        authRepository: sl<AuthRepositoryImpl>(),
      ));

  /// * Bloc
  sl.registerFactory(() => AuthCubit(
        loginUseCase: sl<LoginUseCase>(),
        sharePrefUtils: sl<SharePrefUtils>(),
      ));
}
