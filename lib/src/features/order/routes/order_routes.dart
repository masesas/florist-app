import 'package:florist_app/src/app/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../presentation/page/pages.dart';

class OrderRoutes extends Module {
  static const String ORDER_SEARCH = "${Routes.ORDERS}${Routes.SEARCH_ORDER}";

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Routes.SEARCH_ORDER, child: (_, __) => const SearchPage()),
      ];
}
