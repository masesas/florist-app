part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final LoginEntity? loginEntity;
  final String? responseMessage;
  final bool isSuccess;
  final bool isLoading;

  const AuthState._({
    this.loginEntity,
    this.responseMessage,
    this.isSuccess = false,
    this.isLoading = false,
  });

  const AuthState.initial() : this._();

  AuthState copyWith({
    LoginEntity? loginEntity,
    String? responseMessage,
    bool? isSuccess,
    bool? isLoading,
  }) {
    return AuthState._(
      loginEntity: loginEntity ?? this.loginEntity,
      responseMessage: responseMessage ?? this.responseMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        loginEntity,
        responseMessage,
        isSuccess,
        isLoading,
      ];
}
