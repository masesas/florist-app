part of 'master_remote_datasource.dart';

class MasterRemoteDataSourceImpl extends DioServices
    with _MasterEndPoint
    implements MasterRemoteDataSource {
  @override
  Future<LogisticVehicleResponse> getLogisticVehicle(int logisticId) async {
    final request =
        await getRequest<List<dynamic>>(url: logisticVehicle(logisticId));
    final List<LogisticVehicleModel> logistics = [];

    if (request.error == 0 || (request.data ?? []).isNotEmpty) {
      final data = request.data!.map((e) {
        return LogisticVehicleModel.fromJson(e as Map<String, dynamic>);
      }).toList();
      logistics.addAll(data);
    }

    return LogisticVehicleResponse(
      error: request.error,
      message: request.message,
      data: logistics,
    );
  }
}

class _MasterEndPoint {
  static const String _BASE_URL = AppConstants.BASE_API_URL;

  String logisticVehicle(int logisticId) {
    return '$_BASE_URL/vehicle/$logisticId';
  }
}
