import 'package:florist_app/src/app/widget/app_bar/app_bar.dart';
import 'package:florist_app/src/app/widget/box/box.dart';
import 'package:florist_app/src/app/widget/button/button.dart';
import 'package:florist_app/src/app/widget/dialog/dialog.dart';
import 'package:florist_app/src/app/widget/text_field/text_field.dart';
import 'package:florist_app/src/core/extensions/context_ext.dart';
import 'package:florist_app/src/features/account/domain/language_domain.dart';
import 'package:florist_app/src/features/account/presentation/page/forms/forms.dart';
import 'package:florist_app/src/features/account/routes/account_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/themes/themes.dart';
import '../../../../core/di/injection_container.dart';
import '../cubit/language/language_cubit.dart';

part 'account_page.dart';
part 'change_address_page.dart';
part 'change_language_page.dart';
part 'change_password_page.dart';
part 'florist_information_page.dart';
