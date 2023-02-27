import 'package:equatable/equatable.dart';
import 'package:florist_app/src/core/utils/logger_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/domain/user_domain.dart';
import '../../../domain/domain.dart';
import '../../page/forms/change_address.dart';

part 'change_address_event.dart';
part 'change_address_state.dart';

class ChangeAddressBloc extends Bloc<ChangeAddressEvent, ChangeAddressState> {
  final GetCacheUserProfileUseCase getCacheUserProfileUseCase;
  final ChangeAddressUseCase changeAddressUseCase;

  ChangeAddressBloc({
    required this.getCacheUserProfileUseCase,
    required this.changeAddressUseCase,
  }) : super(const ChangeAddressState()) {
    on<LoadAddressEvent>(_onLoadAddress);
    on<LocationPermissionEvent>(_onLocationPermission);
    on<SubmitChangeAddressEvent>(_onSubmitAddress);
  }

  _onLoadAddress(
    LoadAddressEvent event,
    Emitter<ChangeAddressState> emit,
  ) async {
    final data = await getCacheUserProfileUseCase.invoke();
    data.fold((left) {
      if (kDebugMode) {
        LoggerUtils.print('_onLoadAddress() >> ${left.msg}');
      }
    }, (data) {
      final address = UserEntity.toAddressEntity(data);
      emit(state.copyWith(
        addressEntity: address,
        formModel: ChangeAddress(
          address: address.address,
          latitude: address.latitude,
          longitude: address.longitude,
          zipCode: address.zipCode,
        ),
      ));
    });
  }

  void _onLocationPermission(
    LocationPermissionEvent event,
    Emitter<ChangeAddressState> emit,
  ) async {
    if (event.isRequestPermission) {
      emit(state.copyWith(
        isRequestPermission: true,
      ));
    } else {
      emit(state.copyWith(
        isPermissionGranted: event.isGranted,
        isRequestPermission: false,
        isInitial: false,
      ));
    }
  }

  _onSubmitAddress(
    SubmitChangeAddressEvent event,
    Emitter<ChangeAddressState> emit,
  ) async {
    emit(state.copyWith(isFullLoading: true));
    final updateAddress = await changeAddressUseCase.invoke(
      event.addressEntity,
    );

    updateAddress.fold((error) {
      if (kDebugMode) {
        LoggerUtils.print('_onSubmitAddress() >> ${error.msg}');
      }
      emit(state.copyWith(isSuccessUpdate: false));
    }, (success) {
      emit(state.copyWith(
        addressEntity: UserEntity.toAddressEntity(success),
        isSuccessUpdate: true,
      ));
    });
  }
}
