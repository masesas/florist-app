part of '../google_maps_domain.dart';

class PlaceSearchEntity extends Equatable {
  final String? description;
  final String? placeId;

  const PlaceSearchEntity({
    this.description,
    this.placeId,
  });

  @override
  List<Object?> get props => [
        description,
        placeId,
      ];
}
