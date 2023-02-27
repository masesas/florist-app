import 'package:either_dart/either.dart';
import 'package:florist_app/src/core/helper/exceptions/exception.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../domain.dart';

class LoginUseCase extends UseCase<LoginParams, LoginEntity> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Either<AppFailure, LoginEntity>> execute(LoginParams param) async {
    final login = await authRepository.login(
      username: param.username,
      password: param.password,
    );
    return Right(login);
  }
}

class LoginParams {
  final String username;
  final String password;

  LoginParams({
    required this.username,
    required this.password,
  });
}
