part of 'repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocal authLocal;
  final AuthService authService;

  AuthRepositoryImpl({
    required this.authLocal,
    required this.authService,
  });

  @override
  Future<LoginEntity> login({
    required String username,
    required String password,
  }) async {
    final result = await authService.login(LoginRequest(
      username: username,
      password: password,
    ));

    if (result.error != null && result.error.toString() == "1") {
      throw CustomException(msg: result.message ?? '');
    }

    await authLocal.setUserLogin(
      token: result.token!,
      expiresIn: result.expiresIn,
    );

    return result;
  }
}
