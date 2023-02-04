part of 'entity.dart';

class OrderEntity extends Equatable {
  final String productId;
  final String name;
  final int price;
  final String address;
  final String productDate;
  final OrderEnum orderFlag;

  const OrderEntity({
    required this.productId,
    required this.name,
    required this.price,
    required this.address,
    required this.productDate,
    required this.orderFlag,
  });

  @override
  List<Object?> get props => [
        productId,
        name,
        price,
        address,
        productDate,
        orderFlag,
      ];
}
