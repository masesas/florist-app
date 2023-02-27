part of 'request_permission_bloc.dart';

enum PermissionType {
  LOCATION,
  CAMERA,
  STORAGE,
}

class RequestPermissionEvent {
  final PermissionType permissionType;

  RequestPermissionEvent({
    required this.permissionType,
  });
}
