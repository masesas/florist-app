import 'package:florist_app/gen/assets.gen.dart';
import 'package:florist_app/src/app/themes/themes.dart';
import 'package:florist_app/src/app/widget/app_bar/app_bar.dart';
import 'package:florist_app/src/app/widget/button/button.dart';
import 'package:florist_app/src/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../app/widget/text_field/text_field.dart';
import '../../domain/google_maps_domain.dart';
import '../blocs/google_maps/google_maps_bloc.dart';

final getIt = GetIt.I;

class GoogleMapsPage extends StatefulWidget {
  final PlaceEntity? placeEntity;

  const GoogleMapsPage({
    Key? key,
    this.placeEntity,
  }) : super(key: key);

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Modular.get<GoogleMapsBloc>()
          ..add(
            GoogleMapsInitialEvent(
              initialPlace: widget.placeEntity,
            ),
          );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.colorBackground,
        appBar: AppBarForm(title: context.lang.selectAddress),
        body: BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
          buildWhen: (prev, curr) {
            // only build when camera position was changed or marker was changed
            /* return prev.mapsCameraPosition != curr.mapsCameraPosition ||
                prev.markers != curr.markers;*/
            return (prev.selectedPlace != curr.selectedPlace &&
                    prev.isMapsTooFar != curr.isMapsTooFar) ||
                prev.isLoadingMaps != curr.isLoadingMaps;
          },
          builder: (context, state) {
            if (state.isLoadingMaps) {
              return const Center(child: CircularProgressIndicator());
            }

            return _buildMaps(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildMaps(BuildContext context, GoogleMapsState state) {
    final cameraPos =
        state.mapsCameraPosition ?? const CameraPosition(target: LatLng(0, 0));

    if (state.mapController != null && state.mapsCameraPosition != null) {
      _gotoNewPosition(state.mapController!, cameraPos);
    }

    CameraPosition? cameraPositionMove;

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: cameraPos,
                onMapCreated: (controller) async {
                  _mapsInitialEvent(context, controller);
                },
                //markers: state.markers,
                onTap: (_) {
                  FocusScope.of(context).unfocus();
                  context.read<GoogleMapsBloc>().add(TapMapsEvent());
                },
                onCameraMove: (cameraPosition) {
                  cameraPositionMove = cameraPosition;
                },
                onCameraIdle: () {
                  if (!state.selectedPlaceLoading &&
                      cameraPositionMove != null) {
                    context.read<GoogleMapsBloc>().add(
                        MoveMapsEvent(cameraPosition: cameraPositionMove!));
                  }
                },
                /*onLongPress: (latLng) {
                  context
                      .read<GoogleMapsBloc>()
                      .add(LongPressMapsEvent(latLngSelected: latLng));
                },*/
              ),
              Center(
                child: Assets.icon.icMapsPoint.image(
                  width: 40,
                ),
              ),
            ],
          ),
        ),
        //_buildSearchPlaces(context),
        _buildConfirm(context),
      ],
    );
  }

  Widget _buildSearchPlaces(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topPadding = MediaQuery.of(context).padding.top + 20;

    return BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
      builder: (context, state) {
        List<PlaceSearchEntity> predictions = state.places ?? [];
        return Positioned(
            top: topPadding,
            left: 15,
            child: SizedBox(
              width: size.width - 30,
              height: size.height / 2,
              child: Column(
                children: [
                  SearchInput(
                    height: 50,
                    hintText: context.lang.address,
                    onChanged: (value) {
                      _onSearchEvent(context, value ?? "");
                    },
                  ),
                  if (predictions.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        itemCount: predictions.length,
                        itemBuilder: (_, index) {
                          String? preAddress = predictions[index].description;
                          return preAddress != null
                              ? Container(
                                  color: AppColors.colorBackground,
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      child: Icon(
                                        Icons.pin_drop,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(preAddress),
                                    onTap: () {
                                      _selectedPlaceEvent(
                                          context, predictions[index]);
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    ),
                ],
              ),
            ));
      },
    );
  }

  Widget _buildConfirm(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
      buildWhen: (prev, curr) {
        return prev.selectedPlace != curr.selectedPlace &&
            prev.isMapsTooFar != curr.isMapsTooFar;
      },
      builder: (context, state) {
        return Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(AppSize.spaceSmall),
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: _buildLocationDetails(width, state),
              ),
              const SizedBox(height: AppSize.spaceDefault),
              SizedBox(
                width: double.maxFinite,
                child: ButtonPrimary(
                    title: context.lang.selectAddress,
                    height: 40,
                    color: state.selectedPlaceLoading && state.isMapsTooFar
                        ? AppColors.btnDisabled
                        : AppColors.buttonColor,
                    onClick: () {
                      if (!state.selectedPlaceLoading) {
                        Modular.to.pop(state.selectedPlace);
                      }
                    }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLocationDetails(double width, GoogleMapsState state) {
    if (state.selectedPlaceLoading) {
      return Container(
        alignment: Alignment.center,
        width: width - 123,
        padding: const EdgeInsets.all(AppSize.spaceDefault),
        child: const CircularProgressIndicator(),
      );
    }

    if (state.isMapsTooFar) {
      return Center(
        child: Text(
          context.lang.zoomTooFar,
          style: AppStyles.fontSemiBold14,
          textAlign: TextAlign.center,
        ),
      );
    }

    return Row(
      children: [
        SizedBox(
          width: width - 123,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.selectedPlace?.city ?? "",
                style: AppStyles.fontSemiBold14
                    .copyWith(color: AppColors.colorBoldText, fontSize: 15),
              ),
              const SizedBox(height: 8.3),
              Text(
                state.selectedPlace?.address ?? "",
                style: AppStyles.fontMedium10
                    .copyWith(color: AppColors.colorBoldText, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _gotoNewPosition(
      GoogleMapController controller, CameraPosition newCamera) async {
    controller.animateCamera(CameraUpdate.newCameraPosition(newCamera));
  }

  void _mapsInitialEvent(BuildContext context, GoogleMapController controller) {
    context.read<GoogleMapsBloc>().add(
          GoogleMapsInitialEvent(
            googleMapController: controller,
          ),
        );
  }

  void _onSearchEvent(BuildContext context, String text) {
    context.read<GoogleMapsBloc>().add(GooglePlaceSearchEvent(
          value: text,
        ));
  }

  void _selectedPlaceEvent(
      BuildContext context, PlaceSearchEntity placeSearchEntity) {
    context.read<GoogleMapsBloc>().add(SelectedPlaceEvent(
          placeSearchEntity: placeSearchEntity,
        ));
  }
}
