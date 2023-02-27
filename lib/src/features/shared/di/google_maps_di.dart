import 'package:get_it/get_it.dart';

import '../data/google_maps_data.dart';
import '../domain/google_maps_domain.dart';

void initGoogleMapsDI() {
  final getIt = GetIt.I;

  /// * DataSources
  getIt.registerLazySingleton<GoogleMapsRemoteDataSource>(
    () => GoogleMapsRemoteDataSourceImpl(),
  );

  /// * Repository
  getIt.registerLazySingleton<GoogleMapsRepository>(
    () => GoogleMapsRepositoryImpl(
      googleMapsRemoteDataSource: getIt(),
    ),
  );

  /// * UseCase
  getIt.registerLazySingleton<PlaceAutoCompleteUseCase>(
    () => PlaceAutoCompleteUseCase(
      googleMapsRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<PlaceDetailUseCase>(
    () => PlaceDetailUseCase(
      googleMapsRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<PlaceDetailByLatLngUseCase>(
    () => PlaceDetailByLatLngUseCase(
      googleMapsRepository: getIt(),
    ),
  );
}
