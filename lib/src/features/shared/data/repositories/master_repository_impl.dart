import 'package:florist_app/src/core/helper/exceptions/exception.dart';

import '../../domain/master_domain.dart';
import '../datasources/remote/master/master_remote_datasource.dart';

class MasterRepositoryImpl extends MasterRepository {
  final MasterRemoteDataSource masterRemoteDataSource;

  MasterRepositoryImpl({
    required this.masterRemoteDataSource,
  });

  @override
  Future<List<LogisticVehicleEntity>> getLogisticVehicle() async {
    final result = await masterRemoteDataSource.getLogisticVehicle(1);
    if (result.error == 0) {
      return result.data;
    }

    throw CustomException(msg: result.message);
  }
}
