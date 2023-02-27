import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:florist_app/src/core/di/injection_container.dart';
import 'package:florist_app/src/core/extensions/map_ext.dart';
import 'package:florist_app/src/core/network/api_response.dart';
import 'package:florist_app/src/core/utils/global_variable_utils.dart';
import 'package:florist_app/src/core/utils/shared_pref_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/dio.dart';

import '../constants/app_constants.dart';

part 'data_resource.dart';
part 'dio_http_client.dart';
part 'dio_services.dart';
part 'network_info.dart';
part 'resource.dart';
