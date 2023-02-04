/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $FontsGen {
  const $FontsGen();

  /// File path: fonts/.gitkeep
  String get gitkeep => 'fonts/.gitkeep';

  /// File path: fonts/GothamBold.ttf
  String get gothamBold => 'fonts/GothamBold.ttf';

  /// File path: fonts/GothamBook.ttf
  String get gothamBook => 'fonts/GothamBook.ttf';

  /// File path: fonts/GothamMedium.ttf
  String get gothamMedium => 'fonts/GothamMedium.ttf';

  /// File path: fonts/Montserrat-Bold.ttf
  String get montserratBold => 'fonts/Montserrat-Bold.ttf';

  /// File path: fonts/Montserrat-Medium.ttf
  String get montserratMedium => 'fonts/Montserrat-Medium.ttf';

  /// File path: fonts/Montserrat-Regular.ttf
  String get montserratRegular => 'fonts/Montserrat-Regular.ttf';

  /// File path: fonts/Montserrat-SemiBold.ttf
  String get montserratSemiBold => 'fonts/Montserrat-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
        gitkeep,
        gothamBold,
        gothamBook,
        gothamMedium,
        montserratBold,
        montserratMedium,
        montserratRegular,
        montserratSemiBold
      ];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/ic_id.png
  AssetGenImage get icId => const AssetGenImage('assets/icon/ic_id.png');

  /// File path: assets/icon/ic_uk.png
  AssetGenImage get icUk => const AssetGenImage('assets/icon/ic_uk.png');

  /// File path: assets/icon/logo_titleapp_black.png
  AssetGenImage get logoTitleappBlack =>
      const AssetGenImage('assets/icon/logo_titleapp_black.png');

  /// File path: assets/icon/logo_titleapp_white.png
  AssetGenImage get logoTitleappWhite =>
      const AssetGenImage('assets/icon/logo_titleapp_white.png');

  /// File path: assets/icon/logo_titleapp_white_513.png
  AssetGenImage get logoTitleappWhite513 =>
      const AssetGenImage('assets/icon/logo_titleapp_white_513.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icId, icUk, logoTitleappBlack, logoTitleappWhite, logoTitleappWhite513];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $FontsGen fonts = $FontsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
