import 'package:florist_app/gen/app_localizations.dart';
import 'package:florist_app/src/app/themes/themes.dart';
import 'package:florist_app/src/app/widget/button/button.dart';
import 'package:florist_app/src/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../app/routes/routes.dart';
import '../../../../app/widget/text_field/text_field.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/helper/form/form.dart';
import '../cubit/auth_cubit.dart';

part 'login_page.dart';
