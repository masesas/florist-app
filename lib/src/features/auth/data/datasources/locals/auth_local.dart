part of 'local.dart';

abstract class AuthLocal {
  Future<void> setUserLogin({required String token, int? expiresIn});
}
