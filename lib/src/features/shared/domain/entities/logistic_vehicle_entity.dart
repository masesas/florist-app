part of '../master_domain.dart';

class LogisticEntity extends Equatable {
  final int id;
  final int supplierId;
  final int logisticId;
  final String name;

  const LogisticEntity({
    required this.id,
    required this.supplierId,
    required this.logisticId,
    required this.name,
  });

  @override
  List<Object> get props => [
        id,
        supplierId,
        logisticId,
        name,
      ];
}

class LogisticVehicleEntity extends Equatable {
  final int id;
  final int logisticId;
  final String code;
  final String name;

  const LogisticVehicleEntity({
    required this.id,
    required this.logisticId,
    required this.code,
    required this.name,
  });

  @override
  List<Object> get props => [
        id,
        logisticId,
        code,
        name,
      ];
}
