import 'package:florist_app/src/app/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../presentation/page/pages.dart';

class AccountRoutes extends Module {
  static const String ACC_INFO = "${Routes.ACCOUNT}${Routes.FLORIST_INFO}";
  static const String ACC_CHANGE_ADDRESS =
      "${Routes.ACCOUNT}${Routes.CHANE_ADDRESS}";
  static const String ACC_CHANGE_PW =
      "${Routes.ACCOUNT}${Routes.CHANE_PASSWORD}";
  static const String ACC_CHANGE_LANG = "${Routes.ACCOUNT}${Routes.LANGUAGE}";

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
}
