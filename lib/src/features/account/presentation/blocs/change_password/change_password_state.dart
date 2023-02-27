part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object?> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class LoadingChangePassword extends ChangePasswordState {}

class DoneChangePasswordState extends ChangePasswordState {
  final bool isSuccess;
  final String message;

  const DoneChangePasswordState({
    this.isSuccess = false,
    this.message = '',
  });

  @override
  List<Object?> get props => [
        isSuccess,
        message,
      ];
}
