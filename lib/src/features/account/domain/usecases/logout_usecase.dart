part of '../domain.dart';

class LogoutUseCase extends UseCaseWithoutParam<bool> {
  final AccountRepository accountRepository;

  LogoutUseCase({
    required this.accountRepository,
  });

  @override
  Future<Either<AppFailure, bool>> execute() async {
    final result = await accountRepository.logoutApp();
    return Right(result);
  }
}
