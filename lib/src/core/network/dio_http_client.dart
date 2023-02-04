import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/app_constants.dart';

class DioHttpClient extends DioForNative {
  static const String KEY_ACCEPT = "Accept";
  static const String KEY_X_API = "x-api-key";
  static const String KEY_X_USER = "x-user";
  static const String USER_AGENT = "User-Agent";
  static const String KEY_AUTH = "Authorization";
  static const String VALUE_X_API = "rB7N6sFjQ64Wulgex05q";
  static const String VALUE_X_USER = "support@floweradvisor.com";

  DioHttpClient({
    String baseUrl = AppConstants.BASE_API_URL,
    BaseOptions? options,
  }) : super(options) {
    this.options.baseUrl = baseUrl;

    interceptors.add(InterceptorsWrapper(
      onRequest: _requestInterceptor,
      onResponse: _responseInterceptor,
      onError: _errorInterceptor,
    ));
    interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  _requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
/*    String? tokenValue = await AppShared.getTokenValue();
    String language = await AppShared.getLanguage() ?? AppConstants.EN;
    String countryCode = getIt<GlobalVariable>().getCountryCode();
    String currency = getIt<GlobalVariable>().getCurrency();
    String userAgent = getIt<GlobalVariable>().getUserAgent();

    options.headers = {};
    if (options.headers.containsKey(KEY_AUTH)) {
      options.headers.remove(KEY_AUTH);
    }
    if (tokenValue != null && tokenValue.isNotEmpty) {
      options.headers[KEY_AUTH] = "Bearer $tokenValue";
    }*/

    options.headers[KEY_ACCEPT] = "application/json";
    options.headers[KEY_X_API] = VALUE_X_API;
    options.headers[KEY_X_USER] = VALUE_X_USER;
    //options.headers[USER_AGENT] = userAgent;

    options.connectTimeout = 30000;
    options.receiveTimeout = 30000;

    /*  if (options.queryParameters['country_code'] == null) {
      if (countryCode.isNotEmpty) {
        options.queryParameters.addAll({"country_code": countryCode});
      }
    }
    if (options.queryParameters['currency'] == null) {
      if (currency.isNotEmpty) {
        options.queryParameters.addAll({"currency": currency});
      }
    }
    if (language.isNotEmpty) {
      options.queryParameters.addAll({"language": language});
    }*/

    handler.next(options);
  }

  _responseInterceptor(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  _errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    handler.next(dioError);
  }
}
