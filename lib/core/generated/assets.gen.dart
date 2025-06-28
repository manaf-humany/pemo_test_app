/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Figtree-Black.ttf
  String get figtreeBlack => 'assets/fonts/Figtree-Black.ttf';

  /// File path: assets/fonts/Figtree-BlackItalic.ttf
  String get figtreeBlackItalic => 'assets/fonts/Figtree-BlackItalic.ttf';

  /// File path: assets/fonts/Figtree-Bold.ttf
  String get figtreeBold => 'assets/fonts/Figtree-Bold.ttf';

  /// File path: assets/fonts/Figtree-BoldItalic.ttf
  String get figtreeBoldItalic => 'assets/fonts/Figtree-BoldItalic.ttf';

  /// File path: assets/fonts/Figtree-ExtraBold.ttf
  String get figtreeExtraBold => 'assets/fonts/Figtree-ExtraBold.ttf';

  /// File path: assets/fonts/Figtree-ExtraBoldItalic.ttf
  String get figtreeExtraBoldItalic =>
      'assets/fonts/Figtree-ExtraBoldItalic.ttf';

  /// File path: assets/fonts/Figtree-Italic.ttf
  String get figtreeItalic => 'assets/fonts/Figtree-Italic.ttf';

  /// File path: assets/fonts/Figtree-Light.ttf
  String get figtreeLight => 'assets/fonts/Figtree-Light.ttf';

  /// File path: assets/fonts/Figtree-LightItalic.ttf
  String get figtreeLightItalic => 'assets/fonts/Figtree-LightItalic.ttf';

  /// File path: assets/fonts/Figtree-Medium.ttf
  String get figtreeMedium => 'assets/fonts/Figtree-Medium.ttf';

  /// File path: assets/fonts/Figtree-MediumItalic.ttf
  String get figtreeMediumItalic => 'assets/fonts/Figtree-MediumItalic.ttf';

  /// File path: assets/fonts/Figtree-Regular.ttf
  String get figtreeRegular => 'assets/fonts/Figtree-Regular.ttf';

  /// File path: assets/fonts/Figtree-SemiBold.ttf
  String get figtreeSemiBold => 'assets/fonts/Figtree-SemiBold.ttf';

  /// File path: assets/fonts/Figtree-SemiBoldItalic.ttf
  String get figtreeSemiBoldItalic => 'assets/fonts/Figtree-SemiBoldItalic.ttf';

  /// List of all assets
  List<String> get values => [
        figtreeBlack,
        figtreeBlackItalic,
        figtreeBold,
        figtreeBoldItalic,
        figtreeExtraBold,
        figtreeExtraBoldItalic,
        figtreeItalic,
        figtreeLight,
        figtreeLightItalic,
        figtreeMedium,
        figtreeMediumItalic,
        figtreeRegular,
        figtreeSemiBold,
        figtreeSemiBoldItalic
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/general_error_icon.png
  AssetGenImage get generalErrorIcon =>
      const AssetGenImage('assets/images/general_error_icon.png',
          size: Size(600.0, 600.0));

  /// File path: assets/images/no_internet_error_icon.png
  AssetGenImage get noInternetErrorIcon =>
      const AssetGenImage('assets/images/no_internet_error_icon.png',
          size: Size(600.0, 600.0));

  /// File path: assets/images/server_error_icon.png
  AssetGenImage get serverErrorIcon =>
      const AssetGenImage('assets/images/server_error_icon.png',
          size: Size(572.0, 800.0));

  /// List of all assets
  List<AssetGenImage> get values =>
      [generalErrorIcon, noInternetErrorIcon, serverErrorIcon];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/error_anim.json
  String get errorAnim => 'assets/lottie/error_anim.json';

  /// File path: assets/lottie/no_data.json
  String get noData => 'assets/lottie/no_data.json';

  /// File path: assets/lottie/success_operation.json
  String get successOperation => 'assets/lottie/success_operation.json';

  /// List of all assets
  List<String> get values => [errorAnim, noData, successOperation];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/place_holder.svg
  String get placeHolder => 'assets/svgs/place_holder.svg';

  /// List of all assets
  List<String> get values => [placeHolder];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
