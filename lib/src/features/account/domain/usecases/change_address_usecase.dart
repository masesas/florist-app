part of '../domain.dart';

class ChangeAddressUseCase extends UseCase<AddressEntity, UserEntity> {
  final AccountRepository accountRepository;

  ChangeAddressUseCase({required this.accountRepository});

  @override
  Future<Either<AppFailure, UserEntity>> execute(AddressEntity param) async {
    final result = await accountRepository.updateAddress(param);
    return Right(result);
  }
}
