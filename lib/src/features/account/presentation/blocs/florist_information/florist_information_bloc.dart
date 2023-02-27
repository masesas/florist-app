import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/domain/user_domain.dart';
import '../../page/forms/florist_information.dart';

part 'florist_information_event.dart';
part 'florist_information_state.dart';

class FloristInformationBloc
    extends Bloc<FloristInformationEvent, FloristInformationState> {
  final GetProfileUserUseCase getProfileUserUseCase;

  FloristInformationBloc({
    required this.getProfileUserUseCase,
  }) : super(FloristInformationInitial()) {
    on<FloristInformationEvent>((event, emit) {});

    on<InitialFloristInformationEvent>(_onInitFloristInformation);

    on<SubmitUpdateFloristInformationEvent>(_onSubmitUpdate);
  }

  _onInitFloristInformation(
    InitialFloristInformationEvent event,
    Emitter<FloristInformationState> emit,
  ) async {
    emit(LoadingFloristInformationState());

    final data = await getProfileUserUseCase.invoke();
    data.fold((exception) {
      emit(FailedLoadProfileFloristState(message: exception.msg));
    }, (data) {
      emit(LoadedFloristProfileData(userEntity: data));
    });
  }

  _onSubmitUpdate(
    SubmitUpdateFloristInformationEvent event,
    Emitter<FloristInformationState> emit,
  ) async {
    emit(LoadingFloristInformationState());
    await Future.value(const Duration(seconds: 10));
    emit(const SuccessUpdateState(message: 'Succssfully'));
  }
}
