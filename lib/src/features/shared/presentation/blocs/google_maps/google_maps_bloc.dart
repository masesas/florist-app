import 'package:equatable/equatable.dart';
import 'package:florist_app/src/core/utils/logger_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../domain/google_maps_domain.dart';

part 'google_maps_event.dart';
part 'google_maps_state.dart';

class GoogleMapsBloc extends Bloc<GoogleMapsEvent, GoogleMapsState> {
  final PlaceAutoCompleteUseCase placeAutoCompleteUseCase;
  final PlaceDetailUseCase placeDetailUseCase;
  final PlaceDetailByLatLngUseCase placeDetailByLatLngUseCase;

  GoogleMapsBloc({
    required this.placeAutoCompleteUseCase,
    required this.placeDetailUseCase,
    required this.placeDetailByLatLngUseCase,
  }) : super(const GoogleMapsState.initial()) {
    on<GoogleMapsInitialEvent>(_onInitial);

    on<GooglePlaceSearchEvent>(_onSearch);

    on<SelectedPlaceEvent>(_onSelectedPlace);

    on<LongPressMapsEvent>(_onLongPressMap);

    on<MoveMapsEvent>(_onMapsMove);
    //on<TapMapsEvent>(_onTapMaps);
  }

  late GoogleMapController _googleMapController;
  late CameraPosition _cameraPosition;
  late Marker _marker;
  late MarkerId _markerId;

  _onInitial(
    GoogleMapsInitialEvent event,
    Emitter<GoogleMapsState> emit,
  ) async {
    if (event.googleMapController == null) {
      Position currentPosition = await Geolocator.getCurrentPosition();
      LatLng latLng =
          LatLng(currentPosition.latitude, currentPosition.longitude);

      _cameraPosition = CameraPosition(target: latLng, zoom: 10);
      _markerId = const MarkerId("");
      _marker = Marker(markerId: _markerId, position: latLng);

      final place = await _latLngIntoPlace(latLng);

      emit(GoogleMapsState.initialPosition(
        mapsCameraPosition: _cameraPosition,
        markers: {_marker},
        selectedPlace: place,
      ));
    } else {
      _googleMapController = event.googleMapController!;
    }
  }

  _onSearch(
    GooglePlaceSearchEvent event,
    Emitter<GoogleMapsState> emit,
  ) async {
    emit(GoogleMapsState.placeAutoCompleteLoading(
      mapController: _googleMapController,
      cameraPosition: _cameraPosition,
      lastMarker: {_marker},
    ));

    final places = await placeAutoCompleteUseCase.invoke(event.value);
    places.fold((error) {
      LoggerUtils.print(error, isError: true);
    }, (result) {
      emit(GoogleMapsState.placeAutCompleteLoaded(
        mapController: _googleMapController,
        cameraPosition: _cameraPosition,
        places: result,
        lastMarker: {_marker},
      ));
    });
  }

  _onSelectedPlace(
    SelectedPlaceEvent event,
    Emitter<GoogleMapsState> emit,
  ) async {
    final placeDetail =
        await placeDetailUseCase.invoke(event.placeSearchEntity.placeId!);
    await placeDetail.fold((error) {
      LoggerUtils.print(error.msg, isError: true);
    }, (result) async {
      await _selectedPlace(result, emit);
    });
  }

  _onLongPressMap(
    LongPressMapsEvent event,
    Emitter<GoogleMapsState> emit,
  ) async {
    final placeByLatLng =
        await placeDetailByLatLngUseCase.invoke(event.latLngSelected);

    await placeByLatLng.fold((error) {
      LoggerUtils.print(error.msg, isError: true);
    }, (result) async {
      await _selectedPlace(result, emit);
    });
  }

  _onTapMaps(TapMapsEvent event, Emitter<GoogleMapsState> emit) {
    emit(GoogleMapsState.placeAutCompleteLoaded(
      mapController: _googleMapController,
      cameraPosition: _cameraPosition,
      places: const [],
      lastMarker: {_marker},
    ));
  }

  Future<void> _selectedPlace(
    PlaceEntity place,
    Emitter<GoogleMapsState> emit,
  ) async {
    LatLng latLng = LatLng(
      place.latitude!,
      place.longitude!,
    );

    List<Placemark> places =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    PlaceEntity newPlace = PlaceEntity(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      address:
          "${places.first.street ?? ""} ${places.first.locality ?? ""} ${places.first.subAdministrativeArea ?? ""} ${places.first.administrativeArea ?? ""}",
      city: places.first.subAdministrativeArea,
      placeId: place.placeId,
    );

    _cameraPosition = CameraPosition(target: latLng, zoom: 15);
    _markerId = MarkerId(place.placeId ?? "");
    _marker = Marker(markerId: _markerId, position: latLng);

    emit(GoogleMapsState.placeSelectedLoaded(
      mapController: _googleMapController,
      markers: {_marker},
      mapsCameraPosition: _cameraPosition,
      selectedPlace: newPlace,
    ));
  }

  _onMapsMove(MoveMapsEvent event, Emitter<GoogleMapsState> emit) async {
    final newPosition = event.cameraPosition;
    emit(const GoogleMapsState.placeSelectedLoading());

    final place = await _latLngIntoPlace(newPosition.target);
    emit(GoogleMapsState.placeSelectedLoaded(
      selectedPlace: place,
      isMapsTooFar: newPosition.zoom < 9.0,
    ));
  }

  Future<PlaceEntity> _latLngIntoPlace(LatLng latLng) async {
    List<Placemark> places =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    return PlaceEntity(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      address:
          "${places.first.street ?? ""} ${places.first.locality ?? ""} ${places.first.subAdministrativeArea ?? ""} ${places.first.administrativeArea ?? ""}",
      city: places.first.subAdministrativeArea,
      postalCode: places.first.postalCode,
    );
  }
}
