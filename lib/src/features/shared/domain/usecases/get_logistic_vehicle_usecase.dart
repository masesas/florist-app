part of '../master_domain.dart';

class GetLogisticVehicleUseCase
    extends UseCaseWithoutParam<List<LogisticVehicleEntity>> {
  final MasterRepository masterRepository;

  GetLogisticVehicleUseCase({
    required this.masterRepository,
  });

  @override
  Future<Either<AppFailure, List<LogisticVehicleEntity>>> execute() async {
    final data = await masterRepository.getLogisticVehicle();
    return Right(data);
  }
}
