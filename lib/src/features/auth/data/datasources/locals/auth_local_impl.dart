part of 'local.dart';

class AuthLocalImpl extends AuthLocal {
  final SharePrefUtils sharePref;

  AuthLocalImpl({required this.sharePref});

  @override
  Future<void> setUserToken(String token) async {
    await sharePref.setUserToken(token);
  }

  @override
  Future<void> setUser(UserModel user) async {
    await sharePref.setUser(jsonEncode(user.toJson()));
  }
}
