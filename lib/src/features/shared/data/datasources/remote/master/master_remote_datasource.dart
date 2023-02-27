import 'package:florist_app/src/core/extensions/dynamic_ext.dart';
import 'package:florist_app/src/core/network/network.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../models/logistic_vehicle_model.dart';

part 'master_remote_datasource_impl.dart';

abstract class MasterRemoteDataSource {
  /// * GET Method
  Future<LogisticVehicleResponse> getLogisticVehicle(int logisticId);
}
