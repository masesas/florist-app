import 'package:florist_app/src/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'gen/app_localizations.dart';
import 'src/app/app_module.dart';
import 'src/app/themes/themes.dart';
import 'src/app/widget/widgets.dart';
import 'src/core/di/injection_container.dart';
import 'src/features/account/account.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * injecting core module
  await initServiceLocator();

  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Modular.get<LanguageCubit>(),
        ),
        /*  BlocProvider(
          create: (context) => getIt<AuthCubit>(),
        ),*/
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayOpacity: 0.8,
        overlayColor: AppColors.grey44,
        overlayWidget: const LoadingContent(),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            // Navigation bar background
            systemNavigationBarColor: Colors.white,
            // Navigation bar background: dark/light
            // (The brightness of top status bar)
            systemNavigationBarDividerColor: Colors.white,
            // Navigation bar icon: dark/light
            // (The brightness of the top status bar icons)
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              final locale = Locale(state.language.id);

              return MaterialApp.router(
                title: AppConstants.APP_NAME,
                locale: locale,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale(AppConstants.EN, AppConstants.KEY_US), // English
                  Locale(AppConstants.ID, AppConstants.KEY_ID), // Indo
                ],
                theme: ThemeData(
                  //platform: TargetPlatform.iOS,
                  dividerColor: Colors.transparent,
                  canvasColor: Colors.transparent,
                  textTheme: const TextTheme(),
                  fontFamily: AppFonts.fontMontserrat,
                  primarySwatch: AppColors.primarySwatch,

                  tabBarTheme: TabBarTheme(
                    labelColor: AppColors.white,
                    labelStyle: AppStyles.fontBold14.copyWith(
                      color: AppColors.white,
                    ),
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                  ),
                  //buttonTheme: AppColors.buttonTheme,
                ),
                routeInformationParser: Modular.routeInformationParser,
                routerDelegate: Modular.routerDelegate,
              );
            },
          ),
        ),
      ),
    );
  }
}
