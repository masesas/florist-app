import 'package:flutter_modular/flutter_modular.dart';

import '../features/account/account.dart' show AccountModule;
import '../features/auth/auth.dart';
import '../features/order/order.dart' show OrderModule;
import '../features/shared/shared.dart' show SharedModule;
import 'ui/main_page.dart';
import 'ui/splash_page.dart';

class Routes {
  /// * Core
  static const String CORE = '/core';

  /// * Main
  static const String SPLASH = "/";
  static const String HOME = "/home";

  /// * Shared
  static const String SHARED = '/shared';
  static const String GOOGLE_MAPS = "/google-maps";

  /// * Authentication
  static const String AUTH = "/auth";
  static const String LOGIN = "/login";

  /// * Account
  static const String ACCOUNT = "/account";
  static const String FLORIST_INFO = "/florist-info";
  static const String CHANE_ADDRESS = "/change-address";
  static const String CHANE_PASSWORD = "/change-password";
  static const String LANGUAGE = "/language";

  /// * Orders
  static const String ORDERS = "/orders";
  static const String SEARCH_ORDER = "/search-order";
  static const String REQUEST_SHIPPING_FORM = "/request-shipping-form";
  static const String REQUEST_SHIPPING = "/request-shipping";
  static const String SET_AS_DELIVERY = "/set-as-delivery";
}

class AppModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
        OrderModule(),
        AccountModule(),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => SharedModule()),
        Bind((i) => AuthRoutes()),
        Bind((i) => AccountModule()),
        Bind((i) => OrderModule()),
      ];

  @override
  List<ModularRoute> get routes => [
        /// * Main Module
        ChildRoute(Routes.SPLASH, child: (_, __) => const SplashPage()),
        ChildRoute(Routes.HOME, child: (_, __) => const MainPage()),

        /// * Core Module
        //ModuleRoute(Routes.CORE, module: CoreModule()),

        /// * Shared Module
        ModuleRoute(Routes.SHARED, module: SharedModule()),

        /// * Auth Module
        ModuleRoute(Routes.AUTH, module: AuthRoutes()),

        /// * Account Module
        ModuleRoute(Routes.ACCOUNT, module: AccountModule()),

        /// * Order Routes
        ModuleRoute(Routes.ORDERS, module: OrderModule()),
      ];
}
