import 'package:either_dart/either.dart';
import 'package:florist_app/src/core/helper/exceptions/exception.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../data/models/models.dart';
import '../domain.dart';

class LoginUseCase extends UseCase<LoginRequest, LoginEntity> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Either<AppFailure, LoginEntity>> execute(LoginRequest param) async {
    final login = await authRepository.login(param);
    return Right(login);
  }
}
