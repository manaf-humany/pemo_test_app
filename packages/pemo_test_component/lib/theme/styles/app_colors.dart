import 'package:flutter/material.dart';

/// Defines the color palette for the application.
///
/// This class provides a centralized place for managing and accessing the colors
/// used throughout the app. It helps in maintaining a consistent look and feel.
///
/// The color palette is divided into several categories:
/// - **Primary Colors**: Core colors that define the brand identity.
/// - **Text Colors**: Colors used for text elements.
/// - **Background Colors**: Colors for screen backgrounds and component surfaces.
/// - **Border Colors**: Colors for borders and dividers.
/// - **Status Colors**: Colors that indicate different states like success, error, or warning.
/// - **Disabled State**: Colors for UI elements in a disabled state.
///
/// Example:
/// ```dart
/// Container(
///   color: AppColor.primaryColor,
///   child: Text(
///     'Hello World',
///     style: TextStyle(color: AppColor.textOnPrimary),
///   ),
/// )
/// ```
abstract class AppColor {
  // Primary Colors

  /// The primary brand color, used for main actions and highlights.
  static const Color primaryColor = Color(0xFFFAA616);

  /// The main color for text content.
  static const Color mainTextColor = Color(0xff050B1E);

  /// The secondary color for less prominent text.
  static const Color secondTextColor = Color(0xFFA4A4A4);

  /// A color representing success, often used for positive feedback.
  static const Color greenColor = Color(0xFF6DA544);

  /// A color representing an error state.
  static const Color errorColor = Color(0xFFEA4335);

  /// A background color for error messages or fields.
  static const Color backgroundErrorColor = Color(0xFFFEF5F5);

  /// The default background color for scaffolds with a white theme.
  static const Color whiteScaffoldBGColor = Color(0xffffffff);

  /// The background color for scaffolds with a grey theme.
  static const Color greyScaffoldBGColor = Color(0xffF9F9F9);

  /// The default color for borders.
  static const Color borderColor = Color(0xFFE7E7E7);

  /// The color white.
  static const Color whiteColor = Color(0xffffffff);

  /// The color black.
  static const Color blackColor = Color(0xFF000000);

  /// The base color for shimmer effects.
  static const Color shimmerBaseColor = Color(0XFFEAECF0);

  /// The highlight color for shimmer effects.
  static const Color shimmerHighlightColor = Color(0xFFF5F5F5);

  // Text colors

  /// The default color for text.
  static const Color textDefault = mainTextColor;

  /// The secondary color for text.
  static const Color textSecondary = secondTextColor;

  /// The color for text placed on a primary color background.
  static const Color textOnPrimary = whiteColor;

  /// The color for error text.
  static const Color textError = errorColor;

  /// The color for success text.
  static const Color textSuccess = greenColor;

  // Background colors

  /// The default background color.
  static const Color backgroundDefault = whiteScaffoldBGColor;

  /// The secondary background color.
  static const Color backgroundSecondary = greyScaffoldBGColor;

  /// A light background color for error states.
  static const Color backgroundErrorLight = backgroundErrorColor;

  // Border colors

  /// The default color for borders.
  static const Color borderDefault = borderColor;

  /// A light color for borders.
  static const Color borderLight = Color(0xFFF0F0F0);

  // Status colors

  /// The color for success status indicators.
  static const Color statusSuccess = greenColor;

  /// The color for error status indicators.
  static const Color statusError = errorColor;

  /// The color for warning status indicators.
  static const Color statusWarning = Color(0xFFFFA000);

  // Disabled state

  /// The color for disabled UI elements.
  static const Color disabled = Color(0xFFE0E0E0);

  /// The color for content on disabled UI elements.
  static const Color onDisabled = Color(0xFF9E9E9E);
}

/// Represents the color scheme of the application theme.
///
/// This class holds the set of colors that define the theme. An instance of this
/// class is used by `ThemeProvider` to make the color palette available throughout
/// the widget tree.
class ColorModel {
  /// Creates a color model.
  ///
  /// The parameters default to the values defined in [AppColor].
  const ColorModel({
    this.primaryColor = AppColor.primaryColor,
    this.secondaryColor = AppColor.secondTextColor,
    this.mainTextColor = AppColor.mainTextColor,
    this.secondTextColor = AppColor.secondTextColor,
    this.greenColor = AppColor.greenColor,
    this.errorColor = AppColor.errorColor,
    this.backgroundErrorColor = AppColor.backgroundErrorColor,
    this.whiteScaffoldBGColor = AppColor.whiteScaffoldBGColor,
    this.greyScaffoldBGColor = AppColor.greyScaffoldBGColor,
    this.borderColor = AppColor.borderColor,
    this.whiteColor = AppColor.whiteColor,
    this.blackColor = AppColor.blackColor,
    this.shimmerBaseColor = AppColor.shimmerBaseColor,
    this.shimmerHighlightColor = AppColor.shimmerHighlightColor,
    this.surfaceColor = AppColor.whiteScaffoldBGColor,
  });

  // Base colors

  /// The primary brand color.
  final Color primaryColor;

  /// The secondary color.
  final Color secondaryColor;

  /// The main color for text.
  final Color mainTextColor;

  /// The secondary color for text.
  final Color secondTextColor;

  /// A color representing success.
  final Color greenColor;

  /// A color representing an error.
  final Color errorColor;

  /// A background color for error messages.
  final Color backgroundErrorColor;

  /// The background color for white scaffolds.
  final Color whiteScaffoldBGColor;

  /// The background color for grey scaffolds.
  final Color greyScaffoldBGColor;

  /// The color for borders.
  final Color borderColor;

  /// The color white.
  final Color whiteColor;

  /// The color black.
  final Color blackColor;

  /// The base color for shimmer effects.
  final Color shimmerBaseColor;

  /// The highlight color for shimmer effects.
  final Color shimmerHighlightColor;

  /// The color for surfaces of components like cards, sheets, and menus.
  final Color surfaceColor;
}
