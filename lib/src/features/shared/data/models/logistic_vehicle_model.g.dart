// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistic_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogisticModel _$LogisticModelFromJson(Map<String, dynamic> json) =>
    LogisticModel(
      id: json['id'] as int,
      supplierId: json['supplier_id'] as int,
      logisticId: json['logistic_id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$LogisticModelToJson(LogisticModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplier_id': instance.supplierId,
      'logistic_id': instance.logisticId,
      'name': instance.name,
    };

LogisticVehicleResponse _$LogisticVehicleResponseFromJson(
        Map<String, dynamic> json) =>
    LogisticVehicleResponse(
      error: json['error'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  LogisticVehicleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LogisticVehicleResponseToJson(
        LogisticVehicleResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

LogisticVehicleModel _$LogisticVehicleModelFromJson(
        Map<String, dynamic> json) =>
    LogisticVehicleModel(
      id: json['id'] as int,
      logisticId: json['logistic_id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$LogisticVehicleModelToJson(
        LogisticVehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logistic_id': instance.logisticId,
      'name': instance.name,
      'code': instance.code,
    };
