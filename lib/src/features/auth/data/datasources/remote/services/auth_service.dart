import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/network/dio_http_client.dart';
import '../../../models/models.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: AppConstants.BASE_API_URL)
abstract class AuthService {
  factory AuthService(DioHttpClient retrofit, {String baseUrl}) = _AuthService;

  @POST("login")
  Future<LoginResponse> login(@Body() LoginRequest request);
}
