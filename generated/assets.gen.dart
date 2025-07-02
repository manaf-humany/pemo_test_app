/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $PackagesGen {
  const $PackagesGen();

  /// Directory path: packages/pemo_test_component
  $PackagesPemoTestComponentGen get pemoTestComponent =>
      const $PackagesPemoTestComponentGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/icons/app_icon.png',
      size: Size(512.0, 512.0));

  /// List of all assets
  List<AssetGenImage> get values => [appIcon];
}

class $PackagesPemoTestComponentGen {
  const $PackagesPemoTestComponentGen();

  /// Directory path: packages/pemo_test_component/assets
  $PackagesPemoTestComponentAssetsGen get assets =>
      const $PackagesPemoTestComponentAssetsGen();
}

class $PackagesPemoTestComponentAssetsGen {
  const $PackagesPemoTestComponentAssetsGen();

  /// Directory path: packages/pemo_test_component/assets/fonts
  $PackagesPemoTestComponentAssetsFontsGen get fonts =>
      const $PackagesPemoTestComponentAssetsFontsGen();
}

class $PackagesPemoTestComponentAssetsFontsGen {
  const $PackagesPemoTestComponentAssetsFontsGen();

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-Black.ttf
  String get figtreeBlack =>
      'packages/pemo_test_component/assets/fonts/Figtree-Black.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-BlackItalic.ttf
  String get figtreeBlackItalic =>
      'packages/pemo_test_component/assets/fonts/Figtree-BlackItalic.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-Bold.ttf
  String get figtreeBold =>
      'packages/pemo_test_component/assets/fonts/Figtree-Bold.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-BoldItalic.ttf
  String get figtreeBoldItalic =>
      'packages/pemo_test_component/assets/fonts/Figtree-BoldItalic.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-ExtraBold.ttf
  String get figtreeExtraBold =>
      'packages/pemo_test_component/assets/fonts/Figtree-ExtraBold.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-ExtraBoldItalic.ttf
  String get figtreeExtraBoldItalic =>
      'packages/pemo_test_component/assets/fonts/Figtree-ExtraBoldItalic.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-Italic.ttf
  String get figtreeItalic =>
      'packages/pemo_test_component/assets/fonts/Figtree-Italic.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-Light.ttf
  String get figtreeLight =>
      'packages/pemo_test_component/assets/fonts/Figtree-Light.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-LightItalic.ttf
  String get figtreeLightItalic =>
      'packages/pemo_test_component/assets/fonts/Figtree-LightItalic.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-Medium.ttf
  String get figtreeMedium =>
      'packages/pemo_test_component/assets/fonts/Figtree-Medium.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-MediumItalic.ttf
  String get figtreeMediumItalic =>
      'packages/pemo_test_component/assets/fonts/Figtree-MediumItalic.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-Regular.ttf
  String get figtreeRegular =>
      'packages/pemo_test_component/assets/fonts/Figtree-Regular.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-SemiBold.ttf
  String get figtreeSemiBold =>
      'packages/pemo_test_component/assets/fonts/Figtree-SemiBold.ttf';

  /// File path: packages/pemo_test_component/assets/fonts/Figtree-SemiBoldItalic.ttf
  String get figtreeSemiBoldItalic =>
      'packages/pemo_test_component/assets/fonts/Figtree-SemiBoldItalic.ttf';

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

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $PackagesGen packages = $PackagesGen();
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
