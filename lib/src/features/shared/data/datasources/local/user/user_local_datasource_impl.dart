part of 'user_local_datasource.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharePrefUtils sharePrefUtils;

  UserLocalDataSourceImpl({
    required this.sharePrefUtils,
  });

  @override
  Future<bool> cacheUser(UserModel user) async {
    return await sharePrefUtils.setUser(jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel?> getCacheUser() async {
    final cache = await sharePrefUtils.getUser();
    if (cache != null) {
      return UserModel.fromJson(jsonDecode(cache) as Map<String, dynamic>);
    }

    return null;
  }
}
