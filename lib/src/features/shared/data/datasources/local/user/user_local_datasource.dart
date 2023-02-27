import 'dart:convert';

import 'package:florist_app/src/core/utils/shared_pref_utils.dart';

import '../../../models/user_model.dart';

part 'user_local_datasource_impl.dart';

abstract class UserLocalDataSource {
  Future<bool> cacheUser(UserModel user);

  Future<UserModel?> getCacheUser();
}
