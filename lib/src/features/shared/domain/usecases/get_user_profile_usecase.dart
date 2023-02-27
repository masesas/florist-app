part of '../user_domain.dart';

class GetProfileUserUseCase extends UseCaseWithoutParam<UserEntity> {
  final UserRepository userRepository;

  GetProfileUserUseCase({required this.userRepository});

  @override
  Future<Either<AppFailure, UserEntity>> execute() async {
    final data = await userRepository.getProfileUser();
    return Right(data);
  }
}
