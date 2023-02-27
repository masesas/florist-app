import 'package:florist_app/src/app/app_module.dart';
import 'package:florist_app/src/features/order/data/repositories/order_repository_impl.dart';
import 'package:florist_app/src/features/order/domain/repositories/repositories.dart';
import 'package:florist_app/src/features/order/domain/usecases/usecases.dart';
import 'package:florist_app/src/features/order/presentation/bloc/order_status/order_status_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../data/datasources/remote/native/order_native_services.dart';
import '../presentation/page/pages.dart';

class OrderModule extends Module {
  static const String ORDER_SEARCH = "${Routes.ORDERS}${Routes.SEARCH_ORDER}";
  static const String ORDER_SHIPPING_FORM =
      "${Routes.ORDERS}${Routes.REQUEST_SHIPPING_FORM}";
  static const String ORDER_SHIPPING =
      "${Routes.ORDERS}${Routes.REQUEST_SHIPPING}";
  static const String ORDER_SET_AS_DELIVERY =
      "${Routes.ORDERS}${Routes.SET_AS_DELIVERY}";

  @override
  List<Module> get imports => [];

  @override
  List<Bind<Object>> get binds => [
        // * Data Source
        Bind.lazySingleton<OrderNativeServices>(
          export: true,
          (i) => OrderNativeServicesImpl(),
        ),

        // * Repository
        Bind.lazySingleton<OrderRepository>(
          export: true,
          (i) => OrderRepositoryImpl(
            orderNativeServices: i.get(),
          ),
        ),

        // * UseCase
        Bind.lazySingleton(
          export: true,
          (i) => GetOrderStatusUseCase(
            orderRepository: i.get(),
          ),
        ),

        // * Bloc
        Bind.factory(
          export: true,
          (i) => OrderStatusCubit(
            getOrderStatusUseCase: i.get(),
          ),
        ),
      ];

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
