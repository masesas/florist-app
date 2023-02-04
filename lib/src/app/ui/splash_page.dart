import 'dart:async';

import 'package:florist_app/gen/assets.gen.dart';
import 'package:florist_app/src/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/di/injection_container.dart';
import '../../core/utils/shared_pref_utils.dart';
import '../routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _splashTimer();
  }

  _splashTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, _checkLogin);
  }

  void _checkLogin() async {
    String? user = await getIt<SharePrefUtils>().getUser();
    Modular.to.navigate(Routes.HOME);
    /*if (user != null) {
      Modular.to.navigate(Routes.HOME);
    } else {
      Modular.to.navigate(AuthRoutes.AUTH_LOGIN);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: FutureBuilder<void>(
          future: getIt.allReady(),
          builder: (context, snapshot) {
            String message = "";
            if (!snapshot.hasData) {
              message = "Memuat Data";
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Assets.icon.logoTitleappBlack
                          .image(fit: BoxFit.fitWidth),
                    ),
                    /* if (message.isNotEmpty)
                      Text(message, style: AppStyles.fontBold11),
                    if (message.isNotEmpty) const SizedBox(height: 20),
                    const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    )*/
                  ],
                ),
              ),
            );
          }),
    );
  }
}
