import 'package:json_annotation/json_annotation.dart';

import '../../domain/master_domain.dart'
    show LogisticEntity, LogisticVehicleEntity;

part 'logistic_vehicle_model.g.dart';

@JsonSerializable()
class LogisticModel extends LogisticEntity {
  @override
  final int id;
  @override
  @JsonKey(name: 'supplier_id')
  final int supplierId;
  @override
  @JsonKey(name: 'logistic_id')
  final int logisticId;
  @override
  final String name;

  const LogisticModel({
    required this.id,
    required this.supplierId,
    required this.logisticId,
    required this.name,
  }) : super(
          id: id,
          logisticId: logisticId,
          supplierId: supplierId,
          name: name,
        );

  factory LogisticModel.fromJson(Map<String, dynamic> json) =>
      _$LogisticModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogisticModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LogisticVehicleResponse {
  final int error;
  final String message;
  final List<LogisticVehicleModel> data;

  LogisticVehicleResponse({
    this.error = 0,
    this.message = '',
    this.data = const [],
  });

  factory LogisticVehicleResponse.fromJson(Map<String, dynamic> json) =>
      _$LogisticVehicleResponseFromJson(json);
}

@JsonSerializable()
class LogisticVehicleModel extends LogisticVehicleEntity {
  @override
  final int id;
  @override
  @JsonKey(name: 'logistic_id')
  final int logisticId;
  @override
  final String name;
  @override
  final String code;

  const LogisticVehicleModel({
    required this.id,
    required this.logisticId,
    required this.name,
    required this.code,
  }) : super(
          id: id,
          logisticId: logisticId,
          code: code,
          name: name,
        );

  factory LogisticVehicleModel.fromJson(Map<String, dynamic> json) =>
      _$LogisticVehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogisticVehicleModelToJson(this);
}
