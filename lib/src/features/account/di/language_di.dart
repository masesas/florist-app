import 'package:florist_app/src/features/account/data/language_data.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utils/shared_pref_utils.dart';
import '../domain/language_domain.dart';
import '../presentation/cubit/language/language_cubit.dart';

void initLanguageDI(GetIt sl) async {
  // * Bloc
  sl.registerFactory(() => LanguageCubit(
        fetchLanguageUseCase: sl(),
        changeLanguageUseCase: sl(),
      ));

  // * UseCase
  sl.registerLazySingleton<ChangeLanguageUseCase>(() => ChangeLanguageUseCase(
        languageRepository: sl(),
      ));
  sl.registerLazySingleton<FetchLanguageUseCase>(() => FetchLanguageUseCase(
        languageRepository: sl(),
      ));

  // * Repository
  sl.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImpl(sharePref: sl<SharePrefUtils>()));
}
