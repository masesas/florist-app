part of 'account_services.dart';

class AccountServicesImpl extends DioServices implements AccountServices {
  @override
  Future<UserResponseModel> updateAddress(
      ChangeAddressModel addressModel) async {
    final request = await postRequest<Map<String, dynamic>>(
      url: _AccountEndPoint.UPDATE_ADDRESS,
      jsonData: addressModel.toJson(),
    );

    return UserResponseModel(
      error: request.error,
      message: request.message,
      user: UserModel.fromJson(request.data ?? {}),
    );
  }

  @override
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordModel changePasswordModel) async {
    final request = await postRequest(
      url: _AccountEndPoint.CHANGE_PASSWORD,
      jsonData: changePasswordModel.toJson(),
    );

    return ChangePasswordResponse(
      error: request.error,
      message: request.message,
    );
  }
}

class _AccountEndPoint {
  static const String _BASE_URL = AppConstants.BASE_API_URL;

  static const String UPDATE_ADDRESS = '$_BASE_URL/address/update';

  static const String CHANGE_PASSWORD = '$_BASE_URL/password/update';
}
