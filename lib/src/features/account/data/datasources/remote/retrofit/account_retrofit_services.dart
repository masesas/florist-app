import 'package:dio/dio.dart';
import 'package:florist_app/src/features/account/data/models/change_address_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/network/network.dart';
import '../../../../../shared/data/user_data.dart' show UserModel;
import '../../../models/models.dart';

part 'account_retrofit_services.g.dart';

@RestApi(baseUrl: AppConstants.BASE_API_URL)
abstract class AccountRetrofitServices {
  factory AccountRetrofitServices(DioHttpClient retrofit, {String baseUrl}) =
      _AccountRetrofitServices;

  @POST("/address/update")
  Future<HttpResponse<UserModel>> updateFloristAddress(
    @Body() ChangeAddressModel changeAddressModel,
  );
}
