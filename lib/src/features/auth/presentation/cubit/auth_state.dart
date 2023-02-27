part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final LoginEntity? loginEntity;
  final String? responseMessage;
  final bool isFailLogin;
  final bool isSuccess;
  final bool isLoading;

  const AuthState._({
    this.loginEntity,
    this.responseMessage,
    this.isSuccess = false,
    this.isLoading = false,
    this.isFailLogin = false,
  });

  const AuthState.initial() : this._();

  AuthState copyWith({
    LoginEntity? loginEntity,
    String? responseMessage,
    bool? isSuccess,
    bool? isLoading,
    bool? isFailLogin,
  }) {
    return AuthState._(
      loginEntity: loginEntity ?? this.loginEntity,
      responseMessage: responseMessage ?? this.responseMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      isFailLogin: isFailLogin ?? false,
    );
  }

  @override
  List<Object?> get props => [
        loginEntity,
        responseMessage,
        isSuccess,
        isLoading,
        isFailLogin,
      ];
}
