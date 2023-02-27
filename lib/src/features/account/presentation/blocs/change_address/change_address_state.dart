part of 'change_address_bloc.dart';

class ChangeAddressState extends Equatable {
  final AddressEntity? addressEntity;
  final bool isInitial;
  final bool isPermissionGranted;
  final bool isRequestPermission;
  final bool isFullLoading;
  final bool isSuccessUpdate;
  final ChangeAddress? formModel;

  const ChangeAddressState({
    this.addressEntity,
    this.isInitial = true,
    this.isPermissionGranted = false,
    this.isRequestPermission = false,
    this.isFullLoading = false,
    this.isSuccessUpdate = false,
    this.formModel,
  });

  @override
  List<Object?> get props => [
        addressEntity,
        isPermissionGranted,
        isRequestPermission,
        isFullLoading,
        isSuccessUpdate,
        formModel,
      ];

  ChangeAddressState copyWith({
    AddressEntity? addressEntity,
    bool? isInitial,
    bool? isPermissionGranted,
    bool? isRequestPermission,
    bool? isFullLoading,
    bool? isSuccessUpdate,
    ChangeAddress? formModel,
  }) {
    return ChangeAddressState(
      addressEntity: addressEntity ?? this.addressEntity,
      isInitial: isInitial ?? this.isInitial,
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      isRequestPermission: isRequestPermission ?? this.isRequestPermission,
      isFullLoading: isFullLoading ?? false,
      isSuccessUpdate: isSuccessUpdate ?? false,
      formModel: formModel ?? this.formModel,
    );
  }
}
