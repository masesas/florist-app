import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart' show SharePrefUtils;
import '../../domain/domain.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SharePrefUtils sharePrefUtils;

  AuthCubit({
    required this.loginUseCase,
    required this.sharePrefUtils,
  }) : super(const AuthState.initial());

  void login(String username, String pw) async {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: false,
    ));

    final result = await loginUseCase.invoke(LoginParams(
      username: username,
      password: pw,
    ));

    result.fold((error) {
      emit(state.copyWith(
        isSuccess: false,
        isLoading: false,
        isFailLogin: true,
        responseMessage: error.msg.toString(),
      ));
    }, (data) {
      emit(state.copyWith(
        isSuccess: true,
        isLoading: false,
      ));
    });
  }

  void logout() {
    emit(state.copyWith(
      isSuccess: true,
      isLoading: false,
    ));
  }
}
