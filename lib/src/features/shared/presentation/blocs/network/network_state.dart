part of 'network_cubit.dart';

@immutable
abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object?> get props => [];
}

class NetworkInitial extends NetworkState {}

class DeviceConnectedState extends NetworkState {
  final ConnectivityResult connectivityResult;

  const DeviceConnectedState({
    required this.connectivityResult,
  });

  @override
  List<Object?> get props => [
        connectivityResult,
      ];
}

class NetworkChangedState extends NetworkState {}

class DeviceDisconnectedState extends NetworkState {}
