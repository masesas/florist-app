import 'package:florist_app/src/core/network/network.dart';
import 'package:florist_app/src/features/order/data/models/order_status_model.dart';

import '../../../../../../core/constants/app_constants.dart';

part 'order_native_services_impl.dart';

abstract class OrderNativeServices {
  Future<OrderStatusResponse> getOrderStatusList();
}
