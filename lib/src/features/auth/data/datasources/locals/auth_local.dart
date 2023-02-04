part of 'local.dart';

abstract class AuthLocal {
  Future<void> setUser(UserModel user);
  Future<void> setUserToken(String token);
}
