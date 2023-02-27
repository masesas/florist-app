import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/app_module.dart';
import '../../../core/utils/utils.dart';
import '../data/google_maps_data.dart';
import '../data/master_data.dart';
import '../data/user_data.dart';
import '../domain/google_maps_domain.dart';
import '../domain/master_domain.dart';
import '../domain/user_domain.dart';
import '../presentation/blocs/master/master_bloc.dart';
import '../presentation/google_maps_presentation.dart';

class SharedModule extends Module {
  static const String SHARED_MAPS = '${Routes.SHARED}${Routes.GOOGLE_MAPS}';

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.GOOGLE_MAPS,
          child: (_, __) => const GoogleMapsPage(),
        ),
      ];

  @override
  List<Bind> get binds => [
        /// * Google Maps
        // * Data Sources
        Bind.lazySingleton<GoogleMapsRemoteDataSource>(
          export: true,
          (i) => GoogleMapsRemoteDataSourceImpl(),
        ),
        Bind.lazySingleton<GoogleMapsRepository>(
          export: true,
          (i) => GoogleMapsRepositoryImpl(
            googleMapsRemoteDataSource: i.get(),
          ),
        ),

        // * UseCase
        Bind.lazySingleton(
          export: true,
          (i) => PlaceAutoCompleteUseCase(googleMapsRepository: i.get()),
        ),
        Bind.lazySingleton(
          export: true,
          (i) => PlaceDetailUseCase(googleMapsRepository: i.get()),
        ),
        Bind.lazySingleton(
          export: true,
          (i) => PlaceDetailByLatLngUseCase(googleMapsRepository: i.get()),
        ),
        // * Bloc
        Bind.factory(
          (i) => GoogleMapsBloc(
            placeAutoCompleteUseCase: i.get(),
            placeDetailUseCase: i.get(),
            placeDetailByLatLngUseCase: i.get(),
          ),
        ),

        /// * User
        // * Data Sources
        Bind.lazySingleton<UserLocalDataSource>(
          export: true,
          (i) => UserLocalDataSourceImpl(
            sharePrefUtils: getIt<SharePrefUtils>(),
          ),
        ),
        Bind.lazySingleton<UserRemoteDataSource>(
          export: true,
          (i) => UserRemoteDataSourceImpl(),
        ),
        // * Repository
        Bind.lazySingleton(
          export: true,
          (i) => UserRepositoryImpl(
            userLocalDataSource: i.get(),
            userRemoteDataSource: i.get(),
          ),
        ),
        // * UseCase
        Bind.lazySingleton(
          export: true,
          (i) => GetProfileUserUseCase(
            userRepository: i.get(),
          ),
        ),
        Bind.lazySingleton(
          export: true,
          (i) => GetCacheUserProfileUseCase(
            userRepository: i.get(),
          ),
        ),

        // * Master
        // * Data Source
        Bind.lazySingleton<MasterRemoteDataSource>(
          export: true,
          (i) => MasterRemoteDataSourceImpl(),
        ),
        // * Repository
        Bind.lazySingleton(
          export: true,
          (i) => MasterRepositoryImpl(
            masterRemoteDataSource: i.get(),
          ),
        ),
        // * UseCase
        Bind.lazySingleton(
          export: true,
          (i) => GetLogisticVehicleUseCase(
            masterRepository: i.get(),
          ),
        ),
        // * Bloc
        Bind.factory(
          export: true,
          (i) => MasterBloc(
            getLogisticVehicleUseCase: i.get(),
          ),
        ),
      ];
}
