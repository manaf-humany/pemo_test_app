import 'package:flutter/material.dart';

class AppColor {
  // Primary Colors
  static const Color primaryColor = Color(0xFFFAA616);
  static const Color mainTextColor = Color(0xff050B1E);
  static const Color secondTextColor = Color(0xFFA4A4A4);
  static const Color greenColor = Color(0xFF6DA544);
  static const Color errorColor = Color(0xFFEA4335);
  static const Color backgroundErrorColor = Color(0xFFFEF5F5);
  static const Color whiteScaffoldBGColor = Color(0xffffffff);
  static const Color greyScaffoldBGColor = Color(0xffF9F9F9);
  static const Color borderColor = Color(0xFFE7E7E7);
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Color(0xFF000000);
  static const Color shimmerBaseColor = Color(0XFFEAECF0);
  static const Color shimmerHighlightColor = Color(0xFFF5F5F5);

  // Text colors
  static const Color textDefault = mainTextColor;
  static const Color textSecondary = secondTextColor;
  static const Color textOnPrimary = whiteColor;
  static const Color textError = errorColor;
  static const Color textSuccess = greenColor;

  // Background colors
  static const Color backgroundDefault = whiteScaffoldBGColor;
  static const Color backgroundSecondary = greyScaffoldBGColor;
  static const Color backgroundErrorLight = backgroundErrorColor;

  // Border colors
  static const Color borderDefault = borderColor;
  static const Color borderLight = Color(0xFFF0F0F0);

  // Status colors
  static const Color statusSuccess = greenColor;
  static const Color statusError = errorColor;
  static const Color statusWarning = Color(0xFFFFA000);

  // Disabled state
  static const Color disabled = Color(0xFFE0E0E0);
  static const Color onDisabled = Color(0xFF9E9E9E);
}

class ColorModel {
  // Private constructor
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
  });

  // Base colors
  final Color primaryColor;
  final Color secondaryColor;
  final Color mainTextColor;
  final Color secondTextColor;
  final Color greenColor;
  final Color errorColor;
  final Color backgroundErrorColor;
  final Color whiteScaffoldBGColor;
  final Color greyScaffoldBGColor;
  final Color borderColor;
  final Color whiteColor;
  final Color blackColor;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
}
