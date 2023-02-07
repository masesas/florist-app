part of 'routes.dart';

class Routes {
  /// * Main
  static const String SPLASH = "/";
  static const String HOME = "/home";

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

class AppRoutes extends Module {
  @override
  List<ModularRoute> get routes => [
        /// * Main Module
        ChildRoute(Routes.SPLASH, child: (_, __) => const SplashPage()),
        ChildRoute(Routes.HOME, child: (_, __) => const MainPage()),

        /// * Auth Module
        ModuleRoute(Routes.AUTH, module: AuthRoutes()),

        /// * Account Module
        ModuleRoute(Routes.ACCOUNT, module: AccountRoutes()),

        /// * Order Routes
        ModuleRoute(Routes.ORDERS, module: OrderRoutes()),
      ];
}
