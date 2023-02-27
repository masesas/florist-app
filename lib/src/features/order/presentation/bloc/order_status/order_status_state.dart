part of 'order_status_cubit.dart';

@immutable
abstract class OrderStatusState extends Equatable {
  const OrderStatusState();

  @override
  List<Object?> get props => [];
}

class OrderStatusInitial extends OrderStatusState {}

class OrderStatusLoadingState extends OrderStatusState {}

class OrderStatusLoadedState extends OrderStatusState {
  final List<OrderStatusEntity> orderStatusList;

  const OrderStatusLoadedState({
    required this.orderStatusList,
  });

  @override
  List<Object?> get props => [
        orderStatusList,
      ];
}

class OrderStatusErrorState extends OrderStatusState {
  final String message;

  const OrderStatusErrorState({
    this.message = '',
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
