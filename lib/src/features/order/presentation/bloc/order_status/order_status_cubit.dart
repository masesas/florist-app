import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entity.dart';
import '../../../domain/usecases/usecases.dart' show GetOrderStatusUseCase;

part 'order_status_state.dart';

class OrderStatusCubit extends Cubit<OrderStatusState> {
  final GetOrderStatusUseCase getOrderStatusUseCase;

  OrderStatusCubit({
    required this.getOrderStatusUseCase,
  }) : super(OrderStatusInitial());

  void getOrderStatus() async {
    final result = await getOrderStatusUseCase.invoke();
    result.fold((exception) {
      emit(OrderStatusErrorState(message: exception.msg));
    }, (data) {
      emit(OrderStatusLoadedState(
        orderStatusList: data,
      ));
    });
  }
}
