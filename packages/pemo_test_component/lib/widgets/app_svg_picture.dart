import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A widget that displays an SVG picture from an asset or a network URL.
///
/// This widget is a wrapper around the `flutter_svg` package's [SvgPicture]
/// and provides a consistent way to handle SVGs throughout the app,
/// with support for disabled states and placeholder widgets.
class AppSvgPicture extends StatelessWidget {
  /// Creates a widget that displays an SVG from an asset.
  ///
  /// The [assetName] must not be null.
  const AppSvgPicture.asset(
    this.assetName, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.package = AssetPackageType.componentsLibrary,
    this.disabled = false,
  })  : url = null,
        placeholder = null;

  /// Creates a widget that displays an SVG from a network URL.
  ///
  /// The [url] must not be null.
  const AppSvgPicture.network(
    this.url, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.disabled = false,
    this.placeholder,
    this.package = AssetPackageType.componentsLibrary,
  }) : assetName = null;

  /// The color to apply to the SVG picture.
  ///
  /// If [disabled] is true, this color will be ignored and a
  /// disabled color will be used instead.
  final Color? color;

  /// The width of the SVG picture.
  final double? width;

  /// The height of the SVG picture.
  final double? height;

  /// The name of the asset to display.
  final String? assetName;

  /// How to fit the SVG picture within its bounds.
  final BoxFit fit;

  /// Whether the SVG picture is disabled.
  ///
  /// If true, a disabled color filter will be applied.
  final bool disabled;

  /// The URL of the network SVG to display.
  final String? url;

  /// A widget to display while the network SVG is loading.
  final Widget? placeholder;

  /// The package from which to load the asset.
  /// Defaults to `AssetPackageType.componentsLibrary`.
  final AssetPackageType package;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;

    ColorFilter? getColorFilter() {
      if (disabled) {
        return ColorFilter.mode(
          colors.secondTextColor.withValues(alpha: 0.5),
          BlendMode.srcIn,
        );
      }
      if (color != null) {
        return ColorFilter.mode(color!, BlendMode.srcIn);
      }
      return null;
    }

    if (assetName != null) {
      return SvgPicture.asset(
        assetName!,
        colorFilter: getColorFilter(),
        width: width,
        height: height,
        fit: fit,
        package: package.name,
      );
    } else if (url != null) {
      return SvgPicture.network(
        url!,
        colorFilter: getColorFilter(),
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: placeholder != null
            ? (_) => placeholder!
            : (context) => SvgPicture.asset(
                  Assets.svgs.placeHolder,
                  package: package.name,
                ),
      );
    } else {
      // This case should not be reached due to the constructors.
      return SizedBox(width: width, height: height);
    }
  }
}
