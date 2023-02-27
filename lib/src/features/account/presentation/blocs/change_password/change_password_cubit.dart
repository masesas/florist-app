import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart'
    show ChangePasswordUseCase, ChangePasswordParams;

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit({
    required this.changePasswordUseCase,
  }) : super(ChangePasswordInitial());

  void submit({
    required String pw,
    required String pwConfirm,
  }) async {
    emit(LoadingChangePassword());

    final data = await changePasswordUseCase.invoke(ChangePasswordParams(
      password: pw,
      passwordConfirmation: pwConfirm,
    ));

    data.fold((error) {
      emit(DoneChangePasswordState(message: error.msg));
    }, (success) {
      emit(const DoneChangePasswordState(isSuccess: true));
    });
  }
}
