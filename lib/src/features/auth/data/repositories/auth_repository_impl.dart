part of 'repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocal authLocal;
  final AuthService authService;

  AuthRepositoryImpl({
    required this.authLocal,
    required this.authService,
  });

  @override
  Future<LoginEntity> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(seconds: 3));
    /*final result = await authService.login(loginRequest);
    authLocal.setUserToken(result.token);
    //authLocal.setUser()
    return result;*/
    return const LoginEntity(token: '', message: "Successfully");
  }
}
