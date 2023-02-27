part of '../google_maps_domain.dart';

class PlaceDetailUseCase extends UseCase<String, PlaceEntity> {
  final GoogleMapsRepository googleMapsRepository;

  PlaceDetailUseCase({required this.googleMapsRepository});

  @override
  Future<Either<AppFailure, PlaceEntity>> execute(String param) async {
    final data = await googleMapsRepository.fetchPlaceDetailByPlaceId(param);
    return Right(data);
  }
}
