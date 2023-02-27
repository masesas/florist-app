// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusResponse _$OrderStatusResponseFromJson(Map<String, dynamic> json) =>
    OrderStatusResponse(
      error: json['error'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => OrderStatusModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrderStatusResponseToJson(
        OrderStatusResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) =>
    OrderStatusModel(
      alias: json['alias'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$OrderStatusModelToJson(OrderStatusModel instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'status': instance.status,
    };
