part of 'google_maps_bloc.dart';

@immutable
abstract class GoogleMapsEvent {}

class GoogleMapsInitialEvent extends GoogleMapsEvent {
  final PlaceEntity? initialPlace;
  final GoogleMapController? googleMapController;

  GoogleMapsInitialEvent({
    this.initialPlace,
    this.googleMapController,
  });
}

class SelectedPlaceEvent extends GoogleMapsEvent {
  final PlaceSearchEntity placeSearchEntity;

  SelectedPlaceEvent({
    required this.placeSearchEntity,
  });
}

class GooglePlaceSearchEvent extends GoogleMapsEvent {
  final String value;

  GooglePlaceSearchEvent({
    required this.value,
  });
}

class LongPressMapsEvent extends GoogleMapsEvent {
  final LatLng latLngSelected;

  LongPressMapsEvent({required this.latLngSelected});
}

class TapMapsEvent extends GoogleMapsEvent {}

class MoveMapsEvent extends GoogleMapsEvent {
  final CameraPosition cameraPosition;

  MoveMapsEvent({
    required this.cameraPosition,
  });
}
