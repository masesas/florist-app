part of 'request_permission_bloc.dart';

@immutable
abstract class RequestPermissionState extends Equatable {
  const RequestPermissionState();

  @override
  List<Object?> get props => [];
}

class RequestPermissionInitial extends RequestPermissionState {}

class CheckingPermissionState extends RequestPermissionState {}

class PermissionGrantedState extends RequestPermissionState {}

class PermissionDeniedState extends RequestPermissionState {
  final PermissionType? type;

  const PermissionDeniedState({this.type});

  @override
  List<Object?> get props => [type];
}
