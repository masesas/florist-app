part of 'google_maps_bloc.dart';

class GoogleMapsState extends Equatable {
  final List<PlaceSearchEntity>? places;
  final PlaceEntity? selectedPlace;
  final bool isLoadingPlace;
  final CameraPosition? mapsCameraPosition;
  final GoogleMapController? mapController;
  final Set<Marker> markers;
  final bool isLoadingMaps;
  final bool selectedPlaceLoading;
  final bool isMapsTooFar;

  const GoogleMapsState._({
    this.places,
    this.selectedPlace,
    this.isLoadingPlace = false,
    this.mapsCameraPosition,
    this.mapController,
    this.markers = const <Marker>{},
    this.isLoadingMaps = false,
    this.selectedPlaceLoading = false,
    this.isMapsTooFar = false,
  });

  const GoogleMapsState.initial()
      : this._(
          isLoadingMaps: true,
        );

  const GoogleMapsState.initialPosition({
    required CameraPosition mapsCameraPosition,
    required Set<Marker> markers,
    required PlaceEntity selectedPlace,
  }) : this._(
          mapsCameraPosition: mapsCameraPosition,
          markers: markers,
          selectedPlace: selectedPlace,
          isLoadingMaps: false,
        );

  const GoogleMapsState.placeAutoCompleteLoading({
    required GoogleMapController mapController,
    required CameraPosition cameraPosition,
    required Set<Marker> lastMarker,
  }) : this._(
          isLoadingPlace: true,
          mapsCameraPosition: cameraPosition,
          markers: lastMarker,
          mapController: mapController,
        );

  const GoogleMapsState.placeAutCompleteLoaded({
    required GoogleMapController mapController,
    required CameraPosition cameraPosition,
    required List<PlaceSearchEntity> places,
    required Set<Marker> lastMarker,
  }) : this._(
          mapController: mapController,
          mapsCameraPosition: cameraPosition,
          places: places,
          markers: lastMarker,
          isLoadingPlace: false,
        );

  const GoogleMapsState.placeSelectedLoading()
      : this._(
          selectedPlaceLoading: true,
        );

  const GoogleMapsState.placeSelectedLoaded({
    required PlaceEntity selectedPlace,
    bool isMapsTooFar = false,
    GoogleMapController? mapController,
    CameraPosition? mapsCameraPosition,
    Set<Marker>? markers,
  }) : this._(
          mapController: mapController,
          selectedPlace: selectedPlace,
          mapsCameraPosition: mapsCameraPosition,
          markers: markers ?? const <Marker>{},
          selectedPlaceLoading: false,
          isMapsTooFar: isMapsTooFar,
        );

  @override
  List<Object?> get props => [
        places,
        selectedPlace,
        isLoadingPlace,
      ];
}
