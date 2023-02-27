part of 'master_bloc.dart';

@immutable
abstract class MasterState extends Equatable {
  final List<LogisticVehicleEntity> logisticVehicleList;

  const MasterState({
    this.logisticVehicleList = const [],
  });

  @override
  List<Object?> get props => [
        logisticVehicleList,
      ];
}

class MasterInitial extends MasterState {}

class LogisticVehicleLoadingState extends MasterState {}

class LogisticVehicleLoadedState extends MasterState {
  @override
  final List<LogisticVehicleEntity> logisticVehicleList;

  const LogisticVehicleLoadedState({
    required this.logisticVehicleList,
  });

  @override
  List<Object?> get props => [
        logisticVehicleList,
      ];
}

class LogisticVehicleErrorState extends MasterState {
  final String message;

  const LogisticVehicleErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
