import 'package:florist_app/gen/app_localizations.dart';
import 'package:florist_app/src/app/themes/themes.dart';
import 'package:florist_app/src/app/widget/button/button.dart';
import 'package:florist_app/src/core/constants/hero_constants.dart';
import 'package:florist_app/src/core/extensions/context_ext.dart';
import 'package:florist_app/src/features/auth/presentation/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

import '../../../../../gen/assets.gen.dart';
import '../../../../app/app_module.dart';
import '../../../../app/widget/text_field/text_field.dart';
import '../../../../core/di/injection_container.dart';
import '../cubit/auth_cubit.dart';

part 'login_page.dart';
