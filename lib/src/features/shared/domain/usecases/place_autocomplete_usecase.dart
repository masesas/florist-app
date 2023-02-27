part of '../google_maps_domain.dart';

/// [String] as typedAddress
/// List [PlaceSearchEntity] as Result Fetching data
class PlaceAutoCompleteUseCase
    extends UseCase<String, List<PlaceSearchEntity>> {
  final GoogleMapsRepository googleMapsRepository;

  PlaceAutoCompleteUseCase({required this.googleMapsRepository});

  @override
  Future<Either<AppFailure, List<PlaceSearchEntity>>> execute(
      String param) async {
    final data = await googleMapsRepository.fetchAutoCompletePlace(param);
    return Right(data);
  }
}
