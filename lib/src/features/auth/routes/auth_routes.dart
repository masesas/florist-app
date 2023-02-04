import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/routes/routes.dart';
import '../presentation/page/pages.dart';

class AuthRoutes extends Module {
  static const String AUTH_LOGIN = "${Routes.AUTH}${Routes.LOGIN}";

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Routes.LOGIN, child: (_, __) => const LoginPage()),
        /*ChildRoute(Routes.CHANE_PASSWORD,
            child: (context, args) => VerificationOtpPage(data: args.data)),*/
      ];
}
