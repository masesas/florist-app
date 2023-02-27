part of 'network.dart';

class DioServices extends DioHttpClient {
  Future<ApiResponse<DataType?>> getRequest<DataType>({
    required String url,
    Map<String, dynamic>? jsonData,
  }) async {
    int error = 0;
    int statusCode = 200;
    String message = '';
    DataType? resultData;

    try {
      final request = await get(
        url,
        queryParameters: jsonData,
      );
      statusCode = request.statusCode ?? 0;
      final data = (request.data ?? {}) as Map;

      if (statusCode == 200) {
        if (data.isMapDataResponse()) {
          resultData = data.toMapDataResponse() as DataType;
        } else if (data.isListDataResponse()) {
          resultData = data.toListDataResponse() as DataType;
        }
      }

      message = data['message'] as String? ?? '';
      error = data['error'] as int? ?? 0;
    } on DioError catch (e) {
      final errorData = (e.response?.data ?? {}) as Map;
      error = 1;
      message = AppConstants.DEFAULT_REQUEST_ERROR;

      if (errorData.containsKey('error') &&
          errorData.containsKey('message') &&
          errorData['message'] != null) {
        message = errorData['message'] as String? ?? message;
      }
    } catch (e) {
      error = 1;
      message = e.toString();
    }

    return ApiResponse(
      responseCode: statusCode,
      error: error,
      message: message,
      data: resultData,
    );
  }

  Future<ApiResponse<DataType?>> postRequest<DataType>({
    required String url,
    required Map<String, dynamic> jsonData,
  }) async {
    int error = 0;
    int statusCode = 200;
    String message = '';
    DataType? resultData;

    try {
      final request = await post(
        url,
        data: jsonData,
      );
      statusCode = request.statusCode ?? 0;
      final data = (request.data ?? {}) as Map;

      if (statusCode == 200 && data.isMapDataResponse()) {
        resultData = data.toMapDataResponse() as DataType;
      }

      message = data['message'] as String? ?? '';
      error = data['error'] as int? ?? 0;
    } on DioError catch (e) {
      final errorData = (e.response?.data ?? {}) as Map;
      error = 1;
      message = AppConstants.DEFAULT_REQUEST_ERROR;

      if (errorData.containsKey('error') &&
          errorData.containsKey('message') &&
          errorData['message'] != null) {
        message = errorData['message'] as String? ?? message;
      }
    } catch (e) {
      error = 1;
      message = e.toString();
    }

    return ApiResponse(
      responseCode: statusCode,
      error: error,
      message: message,
      data: resultData,
    );
  }
}
