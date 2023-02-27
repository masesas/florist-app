import '../../../../core/helper/exceptions/exception.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repositories.dart';
import '../../utils/utils.dart';
import '../datasources/remote/native/order_native_services.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderNativeServices orderNativeServices;

  OrderRepositoryImpl({
    required this.orderNativeServices,
  });

  @override
  Future<List<OrderEntity>> fetchOrderList(OrderEnum orderFlag) {
    throw UnimplementedError();
  }

  @override
  Future<List<OrderEntity>> fetchOrderListByFilter({
    SortEnum? sortFlag,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<List<OrderStatusEntity>> getStatusOrderList() async {
    final response = await orderNativeServices.getOrderStatusList();
    if (response.error == 0) {
      final statusData = response.data;
      return statusData;
    }

    throw CustomException(msg: response.message);
  }

  @override
  Future<void> rejectOrder() async {
    throw UnimplementedError();
  }

  @override
  Future<void> remindDriver() async {
    throw UnimplementedError();
  }

  @override
  Future<void> requestPickupOrder({
    required OrderEntity orderEntity,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> setAsDelivery() async {
    throw UnimplementedError();
  }
}
