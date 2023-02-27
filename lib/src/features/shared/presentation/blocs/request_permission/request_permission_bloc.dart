import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'request_permission_event.dart';
part 'request_permission_state.dart';

class RequestPermissionBloc
    extends Bloc<RequestPermissionEvent, RequestPermissionState> {
  RequestPermissionBloc() : super(RequestPermissionInitial()) {
    on<RequestPermissionEvent>(_checkPermission);
  }

  void _checkPermission(
    RequestPermissionEvent event,
    Emitter<RequestPermissionState> emit,
  ) async {
    emit(CheckingPermissionState());

    switch (event.permissionType) {
      case PermissionType.LOCATION:
        await _singlePermissionRequest(emit, Permission.location);
        break;
      case PermissionType.CAMERA:
        await _singlePermissionRequest(emit, Permission.camera);
        break;
      case PermissionType.STORAGE:
        await _singlePermissionRequest(emit, Permission.storage);
        break;
    }
  }

  Future<void> _singlePermissionRequest(
    Emitter<RequestPermissionState> emit,
    Permission permission,
  ) async {
    bool isPermissionGranted = true;
    Map<Permission, PermissionStatus> permissions = await [
      permission,
    ].request();

    for (var status in permissions.values) {
      if (status.isDenied || status.isPermanentlyDenied) {
        isPermissionGranted = false;
        break;
      }
    }

    emit(isPermissionGranted
        ? PermissionGrantedState()
        : const PermissionDeniedState());
  }
}
