import 'package:florist_app/src/core/network/network.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../models/user_model.dart';

part 'user_remote_datasource_impl.dart';

abstract class UserRemoteDataSource {
  /// * GET User Data
  Future<UserResponseModel> getProfileFlorist();
}
