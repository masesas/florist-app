part of 'order_native_services.dart';

class OrderNativeServicesImpl extends DioServices
    with _OrderEndPoint
    implements OrderNativeServices {
  @override
  Future<OrderStatusResponse> getOrderStatusList() async {
    final request = await getRequest<List<dynamic>>(url: getOrderStatus);
    final List<OrderStatusModel> statusList = [];

    if ((request.data ?? []).isNotEmpty) {
      final data = (request.data as List)
          .map((e) => OrderStatusModel.fromJson(e as Map<String, dynamic>));
      statusList.addAll(data);
    }

    return OrderStatusResponse(
      error: request.error,
      message: request.message,
      data: statusList,
    );
  }
}

class _OrderEndPoint {
  static const String _BASE_URL = AppConstants.BASE_API_URL;

  final String getOrderStatus = '$_BASE_URL/orders/status';
}
