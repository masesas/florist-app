part of 'entity.dart';

class OrderStatusEntity extends Equatable {
  final String alias;
  final String status;

  const OrderStatusEntity({
    required this.alias,
    required this.status,
  });

  @override
  List<Object?> get props => [
        alias,
        status,
      ];
}
