/*
import 'dart:convert';

import 'package:florist_app/src/core/global/data/google_maps_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../json/json_reader.dart';
import 'google_maps_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GoogleMapsRemoteDataSourceImpl>()])
void main() {
  late GoogleMapsRemoteDataSource googleMapsRemoteDataSource;

  setUp(() {
    googleMapsRemoteDataSource = MockGoogleMapsRemoteDataSourceImpl();
  });

  Future<List<PlaceSearchModel>> placeSearchList() async {
    final suggestionPlaceJson = jsonDecode(readJson('places.json'));
    final predictions = suggestionPlaceJson['predictions'] as List;

    return predictions
        .map((e) => PlaceSearchModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  group('test fetching data suggestion places from google maps api', () {
    String typedValue = "bogor";

    test('should return list value of suggestion place', () async {
      when(googleMapsRemoteDataSource.getAutoCompletePlace(typedValue))
          .thenAnswer((_) async => await placeSearchList());

      final data =
          await googleMapsRemoteDataSource.getAutoCompletePlace(typedValue);

      //assert
      verify(googleMapsRemoteDataSource.getAutoCompletePlace(typedValue));
      expect(data, await placeSearchList());
    });

    test('should return empty list', () async {
      when(googleMapsRemoteDataSource.getAutoCompletePlace(""))
          .thenAnswer((_) => Future.value(<PlaceSearchModel>[]));

      final data = await googleMapsRemoteDataSource.getAutoCompletePlace("");

      //assert
      verify(googleMapsRemoteDataSource.getAutoCompletePlace(""));
      expect(data, []);
    });
  });
}
*/
