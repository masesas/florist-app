part of 'repository.dart';

abstract class AuthRepository {
  /// login user
  Future<LoginEntity> login(LoginRequest loginRequest);
}
