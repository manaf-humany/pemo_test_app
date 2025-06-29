import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A primary button component for the application.
///
/// This button can be customized with different colors, an optional icon,
/// and a loading indicator. It handles enabled/disabled states based on
/// the presence of the [onTap] callback.
class AppMainButton extends StatelessWidget {
  /// Creates a main button.
  ///
  /// The [title] and [onTap] are required.
  const AppMainButton({
    required this.title,
    this.onTap,
    this.foregroundColor,
    this.backgroundColor,
    this.icon,
    this.showProgress = false,
    this.borderColor,
    super.key,
  });

  /// The background color of the button.
  /// Defaults to the theme's primary color.
  final Color? backgroundColor;

  /// The color of the text and icon.
  /// Defaults to the theme's main text color.
  final Color? foregroundColor;

  /// The color of the button's border.
  /// If null, no border is displayed.
  final Color? borderColor;

  /// The callback that is called when the button is tapped.
  /// If null, the button will be disabled.
  final VoidCallback? onTap;

  /// The text to display on the button.
  final String title;

  /// Whether to show a loading indicator instead of the title.
  final bool showProgress;

  /// The asset path for an optional SVG icon to display before the title.
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;
    final bool isDisabled = onTap == null;

    final effectiveBackgroundColor = isDisabled
        ? colors.primaryColor.withValues(alpha: 0.4)
        : backgroundColor ?? colors.primaryColor;

    final effectiveForegroundColor = foregroundColor ?? colors.mainTextColor;

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: double.infinity,
        height: AppSpacing.x12,
        decoration: ShapeDecoration(
          color: effectiveBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.x4),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 1.2)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[SvgPicture.asset(icon!), AppSpacing.v2],
            if (showProgress)
              AppLoaderWidget(
                loadingColor: effectiveForegroundColor,
                loadingSize: AppSpacing.x6,
              )
            else
              AppText.bodyMedium(
                title,
                align: TextAlign.center,
                maxLines: 2,
                color: effectiveForegroundColor,
              ),
          ],
        ),
      ),
    );
  }
}
