import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pemo_test_project/core/core.dart';

class AppSvgWidget extends StatelessWidget {
  const AppSvgWidget.asset(
    this.assetName, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.disabled = false,
  }) : url = null,
       placeholder = null;

  const AppSvgWidget.network(
    this.url, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.disabled = false,
    this.placeholder,
  }) : assetName = null;

  final Color? color;
  final double? width;
  final double? height;
  final String? assetName;
  final BoxFit fit;
  final bool disabled;
  final String? url;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    if (assetName != null) {
      return SvgPicture.asset(
        assetName!,
        colorFilter:
            disabled
                ? ColorFilter.mode(
                  Colors.white.withValues(alpha: 0.4),
                  BlendMode.color,
                )
                : null,
        width: width,
        height: height,
        fit: fit,
      );
    } else if (url != null) {
      return SvgPicture.network(
        url!,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder:
            placeholder != null
                ? (_) => placeholder!
                : (context) => SvgPicture.asset(Assets.svgs.placeHolder),
      );
    } else {
      throw ArgumentError('Either `assetName` or `url` must be provided.');
    }
  }
}
