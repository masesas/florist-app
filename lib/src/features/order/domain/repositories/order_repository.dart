part of 'repositories.dart';

abstract class OrderRepository {
  /// * All Orders
  Future<List<OrderEntity>> fetchOrderList(OrderEnum orderFlag);

  /// * All Orders
  Future<List<OrderEntity>> fetchOrderListByFilter({
    SortEnum? sortFlag,
    DateTime? startTime,
    DateTime? endTime,
  });

  /// * Accepted
  Future<void> requestPickupOrder({
    required OrderEntity orderEntity,
  });

  /// * PrepareDelivery
  Future<void> setAsDelivery();

  /// * PrepareDelivery
  Future<void> remindDriver();

  /// rejecting NewOrder
  Future<void> rejectOrder();

  Future<List<OrderStatusEntity>> getStatusOrderList();
}
