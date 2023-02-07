import 'package:florist_app/src/app/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../presentation/page/pages.dart';

class OrderRoutes extends Module {
  static const String ORDER_SEARCH = "${Routes.ORDERS}${Routes.SEARCH_ORDER}";
  static const String ORDER_SHIPPING_FORM =
      "${Routes.ORDERS}${Routes.REQUEST_SHIPPING_FORM}";
  static const String ORDER_SHIPPING =
      "${Routes.ORDERS}${Routes.REQUEST_SHIPPING}";
  static const String ORDER_SET_AS_DELIVERY =
      "${Routes.ORDERS}${Routes.SET_AS_DELIVERY}";

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.SEARCH_ORDER,
          child: (_, __) => const SearchPage(),
          transition: TransitionType.downToUp,
        ),
        ChildRoute(Routes.REQUEST_SHIPPING_FORM,
            child: (_, __) => const RequestShippingFormPage()),
        ChildRoute(
          Routes.REQUEST_SHIPPING,
          child: (_, __) => const RequestShippingPage(),
          transition: TransitionType.downToUp,
        ),
        ChildRoute(
          Routes.SET_AS_DELIVERY,
          child: (_, __) => const SetAsDeliveryPage(),
          transition: TransitionType.downToUp,
        ),
      ];
}
