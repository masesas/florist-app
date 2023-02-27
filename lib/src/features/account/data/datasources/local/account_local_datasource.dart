import 'package:florist_app/src/core/utils/shared_pref_utils.dart';

part 'account_local_datasource_impl.dart';

abstract class AccountLocalDataSource {
  Future<bool> logout();
}
