import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/network.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkInfo networkInfo;

  NetworkCubit({
    required this.networkInfo,
  }) : super(NetworkInitial()) {
    checkDeviceConnection();
    connectionChanged();
  }

  void checkDeviceConnection() async {
    final connectivity = await networkInfo.isConnected();
    if (connectivity) {
      final type = await networkInfo.connectivityResult;
      emit(DeviceConnectedState(connectivityResult: type));
    } else {
      emit(DeviceDisconnectedState());
    }
  }

  void connectionChanged() {
    networkInfo.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        emit(DeviceDisconnectedState());
      } else {
        // only emit network change when prev state is disconnected
        if (state is DeviceDisconnectedState) {
          emit(DeviceConnectedState(connectivityResult: connectivityResult));
        }
      }
    });
  }
}
