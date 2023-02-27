import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/entity.dart' show OrderStatusEntity;

part 'order_status_model.g.dart';

@JsonSerializable()
class OrderStatusResponse {
  final int error;
  final String message;
  final List<OrderStatusModel> data;

  OrderStatusResponse({
    required this.error,
    required this.message,
    this.data = const [],
  });

  factory OrderStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusResponseFromJson(json);
}

@JsonSerializable()
class OrderStatusModel extends OrderStatusEntity {
  const OrderStatusModel({
    required String alias,
    required String status,
  }) : super(
          alias: alias,
          status: status,
        );

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusModelFromJson(json);
}
