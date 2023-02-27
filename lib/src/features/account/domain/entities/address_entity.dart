part of '../domain.dart';

class AddressEntity extends Equatable {
  final String? address;
  final String? latitude;
  final String? longitude;
  final String? zipCode;

  const AddressEntity({
    this.address,
    this.latitude,
    this.longitude,
    this.zipCode,
  });

  @override
  List<Object?> get props => [
        address,
        latitude,
        longitude,
        zipCode,
      ];
}
