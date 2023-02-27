part of 'local.dart';

class AuthLocalImpl extends AuthLocal {
  final SharePrefUtils sharePref;

  AuthLocalImpl({required this.sharePref});

  @override
  Future<void> setUserLogin({required String token, int? expiresIn}) async {
    await sharePref.setUserToken(token);
    await sharePref.setUserExpiresIn(expiresIn);
  }
}
