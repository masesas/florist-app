import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

import '../../../app/app_module.dart';
import '../../../core/network/network.dart';
import '../../../core/utils/utils.dart';
import '../../shared/shared.dart' show SharedModule;
import '../account.dart';

class AccountModule extends Module {
  final getIt = GetIt.I;

  static const String ACC_INFO = "${Routes.ACCOUNT}${Routes.FLORIST_INFO}";
  static const String ACC_CHANGE_ADDRESS =
      "${Routes.ACCOUNT}${Routes.CHANE_ADDRESS}";
  static const String ACC_CHANGE_PW =
      "${Routes.ACCOUNT}${Routes.CHANE_PASSWORD}";
  static const String ACC_CHANGE_LANG = "${Routes.ACCOUNT}${Routes.LANGUAGE}";

  @override
  List<Bind<Object>> get binds => [
        // * DataSource
        Bind.lazySingleton<AccountLocalDataSource>(
          export: true,
          (i) => AccountLocalDataSourceImpl(
            sharePrefUtils: getIt<SharePrefUtils>(),
          ),
        ),
        Bind.lazySingleton<AccountServices>(
          export: true,
          (i) => AccountServicesImpl(),
        ),
        Bind.lazySingleton(
          export: true,
          (i) => AccountRetrofitServices(getIt<DioHttpClient>()),
        ),

        // * repository
        Bind.lazySingleton<LanguageRepository>(
          export: true,
          (i) => LanguageRepositoryImpl(
            sharePref: getIt<SharePrefUtils>(),
          ),
        ),
        Bind.lazySingleton<AccountRepository>(
          export: true,
          (i) => AccountRepositoryImpl(
            accountLocalDataSource: i.get(),
            accountRetrofitServices: i.get(),
            accountServices: i.get(),
            userLocalDataSource: i.get(),
          ),
        ),

        // * UseCase
        Bind.lazySingleton(
            export: true,
            (i) => ChangeLanguageUseCase(
                  languageRepository: i.get(),
                )),
        Bind.lazySingleton(
            export: true,
            (i) => FetchLanguageUseCase(
                  languageRepository: i.get(),
                )),
        Bind.lazySingleton((i) => ChangeAddressUseCase(
              accountRepository: i.get(),
            )),
        Bind.lazySingleton(
          export: true,
          (i) => LogoutUseCase(
            accountRepository: i.get(),
          ),
        ),
        Bind.lazySingleton((i) => ChangePasswordUseCase(
              accountRepository: i.get(),
            )),

        // * Bloc
        Bind.factory(
          export: true,
          (i) => AccountBloc(
            logoutUseCase: i.get(),
          ),
        ),
        Bind.factory(
          export: true,
          (i) => LanguageCubit(
            changeLanguageUseCase: i.get(),
            fetchLanguageUseCase: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Routes.FLORIST_INFO,
            child: (_, __) => const FloristInformationPage()),
        ChildRoute(Routes.LANGUAGE,
            child: (_, __) => const ChangeLanguagePage()),
        ChildRoute(Routes.CHANE_PASSWORD,
            child: (_, __) => const ChangePasswordPage()),
        ChildRoute(Routes.CHANE_ADDRESS,
            child: (_, __) => const ChangeAddressPage()),
      ];

  @override
  List<Module> get imports => [];

  Future<dynamic> navigateToGoogleMaps() async {
    return await Modular.to.pushNamed(SharedModule.SHARED_MAPS);
  }
}
