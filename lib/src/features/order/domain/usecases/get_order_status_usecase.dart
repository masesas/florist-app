part of 'usecases.dart';

class GetOrderStatusUseCase
    extends UseCaseWithoutParam<List<OrderStatusEntity>> {
  final OrderRepository orderRepository;

  GetOrderStatusUseCase({
    required this.orderRepository,
  });

  @override
  Future<Either<AppFailure, List<OrderStatusEntity>>> execute() async {
    final status = await orderRepository.getStatusOrderList();
    return Right(status);
  }
}
