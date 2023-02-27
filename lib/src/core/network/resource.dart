part of 'network.dart';

class Resource<DataType> {
  int? statusCode;
  String? status;
  String? message;
  int? errors;
  DataType? data;

  Resource({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  Resource.fromData({required DataType dataType}) {
    status = ResourceType.REQUEST_OK;
    data = dataType;
  }

  Resource.fromResponse(Response<dynamic> response) {
    message = response.statusMessage;
    statusCode = response.statusCode ?? 0;
    final checkData = response.data ?? {};
    int error = 0;
    if (checkData is Map) {
      if (checkData.containsKey("error")) {
        if (checkData["error"] is String) {
          error = int.tryParse((checkData["error"] as String?) ?? '0') ?? 0;
        } else {
          error = checkData["error"] as int? ?? 0;
        }
      }
    }
    if ((statusCode == 200 || statusCode == 201) && error == 0) {
      status = ResourceType.REQUEST_OK;
    } else {
      status = ResourceType.REQUEST_ERROR;
      if (error == 1) {
        if ((checkData as Map? ?? {}).containsKey("message")) {
          message = checkData?["message"] as String?;
        }
      }
    }
  }

  Resource.withError(DioError error, {dynamic dataError}) {
    String message = "";
    String code = "";
    int statusCode = 0;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        code = ResourceType.REQUEST_CONNECT_TIMEOUT;
        message =
            "Request Timeout, Please Check Internet Connection and Try Again";
        break;
      case DioErrorType.sendTimeout:
        code = ResourceType.REQUEST_SEND_TIMEOUT;
        message =
            "Send Timeout, Please Check Internet Connection and Try Again";
        break;
      case DioErrorType.receiveTimeout:
        code = ResourceType.REQUEST_RECEIVE_TIMEOUT;
        message =
            "Receive Timeout, Please Check Internet Connection and Try Again";
        break;
      case DioErrorType.response:
        Response<dynamic>? response = error.response;
        if (response?.data != null) {
          if (response?.data is String) {
            message = response!.data as String? ?? '';
          } else {
            final data = response!.data as Map<String, dynamic>;
            if (data.containsKey("errors")) {
              List<dynamic> errors = data["errors"] as List? ?? [];
              for (final error in errors) {
                final values = error.value as List<dynamic>;
                for (final value in values) {
                  if ((value?.toString() ?? "").isNotEmpty) {
                    message += message.isNotEmpty ? "\n" : "";
                    message += value as String? ?? '';
                  }
                }
              }
            } else {
              //message = response.data["message"];
            }
          }
        }
        if (response!.statusCode == 401) {
          code = ResourceType.REQUEST_ERROR_TOKEN;
        } else {
          code = ResourceType.REQUEST_RESPONSE;
        }

        break;
      case DioErrorType.cancel:
        code = ResourceType.REQUEST_CANCEL;
        break;
      case DioErrorType.other:
        code = ResourceType.REQUEST_ERROR_SERVER;
        message = error.message;
        final socketException = error.error;
        if (socketException is SocketException) {
          message = socketException.message;
        } else if (message.contains("No address associated")) {
          // message = AppLanguages.of(context).alertDisconnect;
        } else if (message.contains("Connection refused")) {
          // message = AppLanguages.of(context).alertErrorServer;
        }
        break;
    }

    this.statusCode = statusCode;
    this.message = message;
    status = code;
    //data = dataError;
  }

  Resource.withDisconnect() {
    //message = AppLanguages.of(context).alertDisconnect;
    status = ResourceType.REQUEST_DISCONNECT;
    data = null;
  }

  Resource.withNoData() {
    message = "Data does not exist";
    status = ResourceType.REQUEST_NULL_DATA;
    data = null;
  }

  Resource.withHasData({required DataType dataType}) {
    //message = AppLanguages.of(context).alertGetDataSuccess;
    status = ResourceType.REQUEST_OK;
    data = dataType;
  }

  bool get isSuccess => status == ResourceType.REQUEST_OK;

  bool get isErrorToken => status == ResourceType.REQUEST_ERROR_TOKEN;

  bool get isError => status != ResourceType.REQUEST_OK;
}

// Request Status
class ResourceType {
  static const String REQUEST_NULL_DATA = "NULL_DATA";
  static const String REQUEST_DISCONNECT = "DISCONNECT";
  static const String REQUEST_CONNECT_TIMEOUT = "CONNECT_TIMEOUT";
  static const String REQUEST_SEND_TIMEOUT = "SEND_TIMEOUT";
  static const String REQUEST_RECEIVE_TIMEOUT = "RECEIVE_TIMEOUT";
  static const String REQUEST_RESPONSE = "RESPONSE";
  static const String REQUEST_CANCEL = "CANCEL";

  static const String REQUEST_OK = "OK";
  static const String REQUEST_ERROR = "ERROR";
  static const String REQUEST_ERROR_SERVER = "ERROR_SERVER";
  static const String REQUEST_ERROR_TOKEN = "ERROR_TOKEN";
}
