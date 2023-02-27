part of '../user_domain.dart';

class GetCacheUserProfileUseCase extends UseCaseWithoutParam<UserEntity> {
  final UserRepository userRepository;

  GetCacheUserProfileUseCase({required this.userRepository});

  @override
  Future<Either<AppFailure, UserEntity>> execute() async {
    final data = await userRepository.getProfileUser(isFromCache: true);
    return Right(data);
  }
}
