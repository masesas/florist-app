part of '../master_domain.dart';

abstract class MasterRepository {
  Future<List<LogisticVehicleEntity>> getLogisticVehicle();
}
