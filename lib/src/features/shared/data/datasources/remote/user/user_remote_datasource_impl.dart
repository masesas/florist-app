part of 'user_remote_datasource.dart';

class UserRemoteDataSourceImpl extends DioServices
    implements UserRemoteDataSource {
  @override
  Future<UserResponseModel> getProfileFlorist() async {
    final request = await getRequest<Map<String, dynamic>>(
      url: _UserEndPoint.GET_FLORIST_PROFILE,
    );

    return UserResponseModel(
      error: request.error,
      message: request.message,
      user: UserModel.fromJson(request.data ?? {}),
    );
  }
}

class _UserEndPoint {
  static const String _BASE_URL = AppConstants.BASE_API_URL;

  static const String GET_FLORIST_PROFILE = '$_BASE_URL/profile';
}
