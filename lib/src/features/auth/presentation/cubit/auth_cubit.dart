import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:florist_app/gen/app_localizations.dart';
import 'package:florist_app/src/features/auth/data/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
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

  void login(String userId, String pw) async {
    final langId = await sharePrefUtils.getLanguage() ?? AppConstants.EN;
    final loadLocale = await AppLocalizations.delegate.load(Locale(langId));

    emit(state.copyWith(
      isLoading: true,
      isSuccess: false,
    ));
    final result = await loginUseCase.invoke(LoginRequest(
      userId: userId,
      password: pw,
    ));

    result.fold((error) {
      emit(state.copyWith(
        isSuccess: false,
        isLoading: false,
        //responseMessage: loadLocale.actionFail,
      ));
    }, (data) {
      emit(state.copyWith(
        isSuccess: true,
        isLoading: false,
        //responseMessage: loadLocale.actionSuccess,
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
