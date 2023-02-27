import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/domain/user_domain.dart';
import '../../../domain/domain.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final LogoutUseCase logoutUseCase;

  AccountBloc({
    required this.logoutUseCase,
  }) : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {});

    on<InitialAccountEvent>(_onInitial);

    on<LogoutEvent>(_onLogoutEvent);
  }

  _onInitial(InitialAccountEvent event, Emitter<AccountState> emit) async {}

  _onLogoutEvent(LogoutEvent event, Emitter<AccountState> emit) async {
    emit(LogoutLoadingState());
    await Future.value(const Duration(seconds: 3));

    final logout = await logoutUseCase.invoke();

    logout.fold(
      (left) => emit(LogoutFailState(message: left.msg)),
      (right) => emit(LogoutSuccessState()),
    );
  }
}
