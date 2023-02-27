part of 'change_address_bloc.dart';

@immutable
abstract class ChangeAddressEvent extends Equatable {
  const ChangeAddressEvent();

  @override
  List<Object> get props => [];
}

class LoadAddressEvent extends ChangeAddressEvent {}

class EditedAddressEvent extends ChangeAddressEvent {
  final String addressText;

  const EditedAddressEvent({
    required this.addressText,
  });
}

class LocationPermissionEvent extends ChangeAddressEvent {
  final bool isGranted;
  final bool isRequestPermission;

  const LocationPermissionEvent({
    this.isGranted = false,
    this.isRequestPermission = false,
  });
}

class SubmitChangeAddressEvent extends ChangeAddressEvent {
  final AddressEntity addressEntity;

  const SubmitChangeAddressEvent({
    required this.addressEntity,
  });
}
