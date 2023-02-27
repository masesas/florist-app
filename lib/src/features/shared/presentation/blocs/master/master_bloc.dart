import 'package:equatable/equatable.dart';
import 'package:florist_app/src/features/shared/domain/master_domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'master_event.dart';
part 'master_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final GetLogisticVehicleUseCase getLogisticVehicleUseCase;

  MasterBloc({
    required this.getLogisticVehicleUseCase,
  }) : super(MasterInitial()) {
    on<GetMasterLogisticVehicleEvent>(_onGetLogisticVehicle);
  }

  _onGetLogisticVehicle(
    GetMasterLogisticVehicleEvent event,
    Emitter<MasterState> emit,
  ) async {
    final result = await getLogisticVehicleUseCase.invoke();
    result.fold((exception) {
      emit(LogisticVehicleErrorState(message: exception.msg));
    }, (data) {
      emit(LogisticVehicleLoadedState(logisticVehicleList: data));
    });
  }
}
