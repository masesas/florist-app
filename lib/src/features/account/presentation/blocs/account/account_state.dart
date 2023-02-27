part of 'account_bloc.dart';

@immutable
abstract class AccountState extends Equatable {
  final UserEntity? userEntity;

  const AccountState({
    this.userEntity,
  });

  @override
  List<Object?> get props => [
        userEntity,
      ];
}

class AccountInitial extends AccountState {}

class LoadedUserData extends AccountState {
  @override
  final UserEntity userEntity;

  const LoadedUserData({required this.userEntity});

  @override
  List<Object?> get props => [
        userEntity,
      ];
}

class LogoutLoadingState extends AccountState {}

class LogoutSuccessState extends AccountState {}

class LogoutFailState extends AccountState {
  final String message;

  const LogoutFailState({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
