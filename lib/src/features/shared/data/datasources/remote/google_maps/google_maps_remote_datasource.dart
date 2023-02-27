import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/place_autocomplete_model.dart';

abstract class GoogleMapsRemoteDataSource {
  Future<List<PlaceSearchModel>> getAutoCompletePlace(String typeValue);

  /// watch [PlaceSearchModel] var [placeId]
  Future<PlaceModel> getPlaceDetailByPlaceId(
    String placeId, {
    String? postalCode,
  });

  Future<PlaceModel> getPlaceDetailByLatLng(LatLng latLng);
}
