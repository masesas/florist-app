import 'package:florist_app/src/core/constants/app_constants.dart';

import '../../../../../../core/network/network.dart';
import '../../../../../shared/data/user_data.dart'
    show UserResponseModel, UserModel;
import '../../../models/models.dart';

part 'account_services_impl.dart';

abstract class AccountServices {
  /// * POST Update Address
  Future<UserResponseModel> updateAddress(ChangeAddressModel addressModel);

  /// * POST Change Password
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordModel changePasswordModel);
}
