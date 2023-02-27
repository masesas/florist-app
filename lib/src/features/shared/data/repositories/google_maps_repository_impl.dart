import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/google_maps_domain.dart';
import '../datasources/remote/google_maps/google_maps_remote_datasource.dart';

class GoogleMapsRepositoryImpl extends GoogleMapsRepository {
  final GoogleMapsRemoteDataSource googleMapsRemoteDataSource;

  GoogleMapsRepositoryImpl({
    required this.googleMapsRemoteDataSource,
  });

  @override
  Future<List<PlaceSearchEntity>> fetchAutoCompletePlace(
      String typeAddress) async {
    final data =
        await googleMapsRemoteDataSource.getAutoCompletePlace(typeAddress);
    return data;
  }

  @override
  Future<PlaceEntity> fetchPlaceDetailByPlaceId(
    String placeId, {
    String? postalCode,
  }) async {
    final data = await googleMapsRemoteDataSource
        .getPlaceDetailByPlaceId(placeId, postalCode: postalCode);
    return data;
  }

  @override
  Future<PlaceEntity> fetchPlaceByLatLng(LatLng latLng) async {
    final data =
        await googleMapsRemoteDataSource.getPlaceDetailByLatLng(latLng);

    return data;
  }
}
