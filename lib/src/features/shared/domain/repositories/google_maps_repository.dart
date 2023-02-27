part of '../google_maps_domain.dart';

abstract class GoogleMapsRepository {
  Future<List<PlaceSearchEntity>> fetchAutoCompletePlace(String typeAddress);

  Future<PlaceEntity> fetchPlaceDetailByPlaceId(
    String placeId, {
    String? postalCode,
  });

  Future<PlaceEntity> fetchPlaceByLatLng(LatLng latLng);
}
