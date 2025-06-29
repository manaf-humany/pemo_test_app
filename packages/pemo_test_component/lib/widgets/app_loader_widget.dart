import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A widget that displays a centered circular progress indicator.
///
/// This widget is used to indicate a loading state in the application.
/// It can be customized with a specific size, color, and stroke width.
class AppLoaderWidget extends StatelessWidget {
  /// Creates a circular loader widget.
  ///
  /// The [loadingSize], [loadingColor], and [strokeWidth] are optional.
  const AppLoaderWidget({
    super.key,
    this.loadingSize,
    this.loadingColor,
    this.strokeWidth,
  });

  /// The size (width and height) of the loader.
  ///
  /// Defaults to `AppSpacing.x8`.
  final double? loadingSize;

  /// The color of the loader.
  ///
  /// Defaults to the theme's primary color with 30% opacity.
  final Color? loadingColor;

  /// The thickness of the loader's circular line.
  ///
  /// Defaults to `3.0`.
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).color;
    return Center(
      child: SizedBox(
        width: loadingSize ?? AppSpacing.x8,
        height: loadingSize ?? AppSpacing.x8,
        child: CircularProgressIndicator(
          color: loadingColor ?? color.primaryColor.withValues(alpha: 0.3),
          strokeWidth: strokeWidth ?? 3.0,
        ),
      ),
    );
  }
}
