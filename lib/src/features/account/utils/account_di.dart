/*
import '../../../core/di/injection_container.dart';
import '../../../core/network/network.dart';
import '../../../core/utils/utils.dart';
import '../account.dart';

void initAccountDi() {
  /// * DataSources
  _dataSources();

  /// * Repository
  _repositories();

  /// * UseCae
  _useCase();

  /// * Bloc
  _blocs();
}

void _dataSources() {
  registerLazySingleton(
    () => AccountLocalDataSourceImpl(sharePrefUtils: getIt<SharePrefUtils>()),
  );

  registerLazySingleton(
    () => AccountRetrofitServices(getIt<DioHttpClient>()),
  );

  registerLazySingleton(() => AccountServicesImpl());
}

void _repositories() {
  registerLazySingleton(
    () => LanguageRepositoryImpl(
      sharePref: getIt<SharePrefUtils>(),
    ),
  );
  registerLazySingleton(
    () => AccountRepositoryImpl(
      accountLocalDataSource: getIt<AccountLocalDataSourceImpl>(),
      accountRetrofitServices: getIt<AccountRetrofitServices>(),
      accountServices: getIt<AccountServicesImpl>(),
    ),
  );
}

void _useCase() {
  registerLazySingleton(
    () => ChangeLanguageUseCase(
      languageRepository: getIt<LanguageRepositoryImpl>(),
    ),
  );
  registerLazySingleton(
    () => FetchLanguageUseCase(
      languageRepository: getIt<LanguageRepositoryImpl>(),
    ),
  );
  registerLazySingleton(
    () => ChangeAddressUseCase(
      accountRepository: getIt<AccountRepositoryImpl>(),
    ),
  );
  registerLazySingleton(
    () => LogoutUseCase(
      accountRepository: getIt<AccountRepositoryImpl>(),
    ),
  );
  registerLazySingleton(
    () => GetProfileUserUseCase(
      accountRepository: getIt<AccountRepositoryImpl>(),
    ),
  );
  registerLazySingleton(
    () => GetCacheUserProfileUseCase(
      accountRepository: getIt<AccountRepositoryImpl>(),
    ),
  );
  registerLazySingleton(
    () => ChangePasswordUseCase(
      accountRepository: getIt<AccountRepositoryImpl>(),
    ),
  );
}

void _blocs() {
  registerFactory(
    () => LanguageCubit(
      fetchLanguageUseCase: getIt<FetchLanguageUseCase>(),
      changeLanguageUseCase: getIt<ChangeLanguageUseCase>(),
    ),
  );
}
*/
