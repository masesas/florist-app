part of 'repository.dart';

abstract class AuthRepository {
  /// login user
  Future<LoginEntity> login({
    required String username,
    required String password,
  });
}
