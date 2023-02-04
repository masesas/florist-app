part of 'themes.dart';

class AppThemes {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: AppColors.colorPrimary,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.colorPrimary,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      //toggleableActiveColor: AppColors.colorPrimary,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: AppColors.colorPrimaryDark,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: AppColors.colorPrimaryDark,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      //toggleableActiveColor: AppColors.colorPrimaryDark,
    );
  }
}
