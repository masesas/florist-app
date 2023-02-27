part of '../google_maps_domain.dart';

class PlaceEntity extends Equatable {
  final String? placeId;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? city;
  final String? postalCode;

  const PlaceEntity({
    this.placeId,
    this.address,
    this.latitude,
    this.longitude,
    this.city,
    this.postalCode,
  });

  @override
  List<Object?> get props => [
        placeId,
        address,
        latitude,
        longitude,
        city,
        postalCode,
      ];
}
