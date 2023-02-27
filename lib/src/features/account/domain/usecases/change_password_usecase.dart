part of '../domain.dart';

class ChangePasswordParams {
  final String password;
  final String passwordConfirmation;

  ChangePasswordParams({
    required this.password,
    required this.passwordConfirmation,
  });
}

class ChangePasswordUseCase extends UseCase<ChangePasswordParams, String> {
  final AccountRepository accountRepository;

  ChangePasswordUseCase({
    required this.accountRepository,
  });

  @override
  Future<Either<AppFailure, String>> execute(ChangePasswordParams param) async {
    final data = await accountRepository.updatePassword(
        param.password, param.passwordConfirmation);
    return Right(data);
  }
}
