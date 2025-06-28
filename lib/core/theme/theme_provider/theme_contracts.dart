import 'package:flutter/material.dart';
import 'package:pemo_test_project/core/generated/fonts.gen.dart';
import 'package:pemo_test_project/core/theme/theme.dart';
import 'package:pemo_test_project/core/widgets/app_texts.dart';

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

ThemeData getThemeFromColors(ColorModel color) {
  return ThemeData(
    fontFamily: FontFamily.figtreeRegular,
    primaryColor: color.primaryColor,
    scaffoldBackgroundColor: color.whiteScaffoldBGColor,
    colorScheme: ColorScheme(
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
