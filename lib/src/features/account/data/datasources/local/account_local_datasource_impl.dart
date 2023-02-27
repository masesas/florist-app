part of 'account_local_datasource.dart';

class AccountLocalDataSourceImpl extends AccountLocalDataSource {
  final SharePrefUtils sharePrefUtils;

  AccountLocalDataSourceImpl({
    required this.sharePrefUtils,
  });

  @override
  Future<bool> logout() async {
    return await sharePrefUtils.clearAllData();
  }
}
