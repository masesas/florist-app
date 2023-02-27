import 'package:florist_app/src/features/shared/data/datasources/local/user/user_local_datasource.dart';
import 'package:florist_app/src/features/shared/domain/user_domain.dart';

import '../../../../core/helper/exceptions/exception.dart';
import '../datasources/remote/user/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({
    required this.userLocalDataSource,
    required this.userRemoteDataSource,
  });

  @override
  Future<UserEntity> getProfileUser({
    bool isFromCache = false,
  }) async {
    if (isFromCache) {
      final cacheUser = await userLocalDataSource.getCacheUser();
      if (cacheUser != null) {
        return cacheUser;
      }
    }

    final data = await userRemoteDataSource.getProfileFlorist();
    if (data.error == 0 && data.user != null) {
      await userLocalDataSource.cacheUser(data.user!);
      return data.user!;
    }

    final cacheUser = await userLocalDataSource.getCacheUser();
    if (cacheUser != null) {
      return cacheUser;
    }

    throw CustomException(msg: data.message);
  }
}
