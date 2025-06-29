import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// Creates a [TextStyleModel] from a given [ColorModel].
///
/// This function generates a set of predefined text styles based on the colors
/// provided in the [color] model. It establishes a consistent typography system
/// for the application.
///
/// The base text style uses the Figtree font family and the main text color
/// from the color model.
///
/// - [color]: The `ColorModel` to use for generating the text styles.
///
/// Returns a `TextStyleModel` with a complete set of text styles.
TextStyleModel getTextsFromColors(ColorModel color) {
  final base = TextStyle(
    color: color.mainTextColor,
    decoration: TextDecoration.none,
    fontFamily: FontFamily.figtreeRegular,
    leadingDistribution: TextLeadingDistribution.even,
  );

  return TextStyleModel(
    headingDisplay: base.copyWith(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      height: 56 / 48,
    ),
    headingLarge: base.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 32 / 28,
    ),
    headingMedium: base.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 26 / 20,
    ),
    headingSmall: base.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 24 / 18,
    ),

    // Body styles
    bodyLarge: base.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
    ),
    bodyLargeStrong: base.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 24 / 16,
    ),
    bodyMedium: base.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
    ),
    bodyMediumStrong: base.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 20 / 14,
    ),
    bodySmall: base.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 16 / 12,
    ),
    bodySmallStrong: base.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 16 / 12,
    ),
    bodyTiny: base.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 14 / 10,
    ),
    bodyTinyStrong: base.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 14 / 10,
    ),
  );
}

/// Creates a [ThemeData] from a given [ColorModel].
///
/// This function generates a `ThemeData` object for the application, using the
/// colors from the provided [color] model. It sets up the overall theme,
/// including the color scheme and font family.
///
/// - [color]: The `ColorModel` to use for generating the theme data.
///
/// Returns a `ThemeData` instance configured with the specified colors.
ThemeData getThemeFromColors(ColorModel color) {
  return ThemeData(
    fontFamily: FontFamily.figtreeRegular,
    primaryColor: color.primaryColor,
    scaffoldBackgroundColor: color.whiteScaffoldBGColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: color.primaryColor,
      brightness: Brightness.light,
      primary: color.primaryColor,
      onPrimary: color.whiteColor,
      secondary: color.primaryColor.withValues(alpha: 0.8),
      onSecondary: color.whiteColor,
      error: color.errorColor,
      onError: color.whiteColor,
      surface: color.greyScaffoldBGColor,
      onSurface: color.mainTextColor,
    ),
  );
}
