part of '../google_maps_domain.dart';

class PlaceDetailByLatLngUseCase extends UseCase<LatLng, PlaceEntity> {
  final GoogleMapsRepository googleMapsRepository;

  PlaceDetailByLatLngUseCase({required this.googleMapsRepository});

  @override
  Future<Either<AppFailure, PlaceEntity>> execute(LatLng param) async {
    final data = await googleMapsRepository.fetchPlaceByLatLng(param);
    return Right(data);
  }
}
