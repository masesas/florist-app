import 'package:badges/badges.dart' as badges;
import 'package:florist_app/src/app/themes/themes.dart';
import 'package:florist_app/src/app/widget/box/box.dart';
import 'package:florist_app/src/core/extensions/context_ext.dart';
import 'package:florist_app/src/features/order/presentation/bloc/order_status/order_status_cubit.dart';
import 'package:florist_app/src/features/order/presentation/page/forms/request_shipping.dart';
import 'package:florist_app/src/features/order/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../app/widget/app_bar/app_bar.dart';
import '../../../../app/widget/button/button.dart';
import '../../../../app/widget/text_field/text_field.dart';
import '../../../shared/domain/entities/input_option_entity.dart';
import '../widgets/widgets.dart';

part 'order_page.dart';
part 'request_shipping_form_page.dart';
part 'request_shipping_page.dart';
part 'search_page.dart';
part 'set_as_delivery_page.dart';
