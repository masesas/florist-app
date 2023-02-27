import 'dart:convert' as convert;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../../../core/constants/app_constants.dart';
import '../../../models/place_autocomplete_model.dart';
import 'google_maps_remote_datasource.dart';

class GoogleMapsRemoteDataSourceImpl extends GoogleMapsRemoteDataSource {
  @override
  Future<List<PlaceSearchModel>> getAutoCompletePlace(String typeValue) async {
    final String placeAutoCompleteUrl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$typeValue&key=${AppConstants.GmapKey}'; //&components=country:$countryCode
    var response = await http.get(Uri.parse(placeAutoCompleteUrl));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;

    return jsonResults
        .map(
            (place) => PlaceSearchModel.fromJson(place as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<PlaceModel> getPlaceDetailByPlaceId(
    String placeId, {
    String? postalCode,
  }) async {
    String placeDetailUrl =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${AppConstants.GmapKey}';
    var response = await http.get(Uri.parse(placeDetailUrl));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    for (var element
        in PlaceModel.fromJson(placeId, jsonResult).addressComponents!) {
      if (element.types != null) {
        for (var type in element.types!) {
          if (type.postalCode == "postal_code") {
            postalCode = element.longName;
          }
        }
      }
    }
    return PlaceModel.fromJson(placeId, jsonResult);
  }

  @override
  Future<PlaceModel> getPlaceDetailByLatLng(LatLng latLng) async {
    String placeDetailUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=${AppConstants.GmapKey}';
    var response = await http.get(Uri.parse(placeDetailUrl));
    var json = convert.jsonDecode(response.body);
    var jsonResult = (json['results'] as List);
    PlaceModel place = PlaceModel();
    for (var element in jsonResult) {
      if (element["place_id"].toString().isNotEmpty) {
        place = PlaceModel.fromJson(
            element["place_id"].toString(), element as Map<String, dynamic>);
        break;
      }
    }

    return place;
  }
}
