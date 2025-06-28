import 'package:flutter/material.dart';

class AppColor {
  // Blue
  static const MaterialColor blue = MaterialColor(
    0XFF0B152D, // Primary shade (600)
    <int, Color>{
      100: Color(0XFFEBEFFA),
      200: Color(0XFFDAE2F6),
      300: Color(0XFFB5C6ED),
      400: Color(0XFF8CA6E3),
      500: Color(0XFF688BDA),
      600: Color(0XFF3F6AD0), // Primary
      700: Color(0XFF2A51AC),
      800: Color(0XFF203E83),
      900: Color(0XFF152956),
    },
  );

  // Black
  static const MaterialColor black = MaterialColor(
    0XFF211D1D, // Primary shade (full black)
    <int, Color>{
      100: Color(0XFF211D1D), // 2%
      200: Color(0X05211D1D), // 5%
      300: Color(0X0A211D1D), // 10%
      400: Color(0X14211D1D), // 20%
      500: Color(0X28211D1D), // 40%
      600: Color(0X3C211D1D), // 60%
      700: Color(0X46211D1D), // 70%
      800: Color(0X50211D1D), // 80%
      900: Color(0X5F211D1D), // 95%
    },
  );

  // White
  static const MaterialColor white = MaterialColor(
    0XFFFFFFFF, // Primary shade (full white)
    <int, Color>{
      100: Color(0X0CFFFFFF), // 5%
      200: Color(0X19FFFFFF), // 10%
      300: Color(0X33FFFFFF), // 20%
      400: Color(0X66FFFFFF), // 40%
      500: Color(0XB3FFFFFF), // 70%
      600: Color(0XCCFFFFFF), // 80%
      700: Color(0XD9FFFFFF), // 85%
      800: Color(0XE6FFFFFF), // 90%
      900: Color(0XF2FFFFFF), // 95%
    },
  );

  // Red Light
  static const MaterialColor redLight = MaterialColor(
    0XFF660E0B,
    <int, Color>{
      100: Color(0XFFFFF5F5),
      200: Color(0XFFFFE2E0),
      300: Color(0XFFFFC7C2),
      400: Color(0XFFFFAFA3),
      500: Color(0XFFF24822),
      600: Color(0XFFDC3412),
      700: Color(0XFFBD2915),
      800: Color(0XFF9F1F18),
      900: Color(0XFF771208),
    },
  );

  // Red Dark
  static const MaterialColor redDark = MaterialColor(
    0XFF311817,
    <int, Color>{
      100: Color(0XFFFEE7E7),
      200: Color(0XFFFCCDCA),
      300: Color(0XFFFBBCB6),
      400: Color(0XFFFCA397),
      500: Color(0XFFE03E1A),
      600: Color(0XFFC4381C),
      700: Color(0XFF963323),
      800: Color(0XFF7C2622),
      900: Color(0XFF54211C),
    },
  );

  // Yellow Light
  static const MaterialColor yellowLight = MaterialColor(
    0XFFB86200,
    <int, Color>{
      100: Color(0XFFFFFBEB),
      200: Color(0XFFFFF1C2),
      300: Color(0XFFFFE8A3),
      400: Color(0XFFFFD966),
      500: Color(0XFFFFCD29),
      600: Color(0XFFFFC21A),
      700: Color(0XFFFAB815),
      800: Color(0XFFEBA611),
      900: Color(0XFFDD940E),
    },
  );

  // Yellow Dark
  static const MaterialColor yellowDark = MaterialColor(
    0XFF71440F,
    <int, Color>{
      100: Color(0XFFFDF7DD),
      200: Color(0XFFFBE8AD),
      300: Color(0XFFF9DF90),
      400: Color(0XFFF7D15F),
      500: Color(0XFFF3C11B),
      600: Color(0XFFF2B50D),
      700: Color(0XFFE4A711),
      800: Color(0XFFC58011),
      900: Color(0XFF925711),
    },
  );

  // Green Light
  static const MaterialColor greenLight = MaterialColor(
    0XFF083A23,
    <int, Color>{
      100: Color(0XFFEBFFEE),
      200: Color(0XFFCFF7D3),
      300: Color(0XFFAFF4C6),
      400: Color(0XFF85E0A3),
      500: Color(0XFF14AE5C),
      600: Color(0XFF009951),
      700: Color(0XFF008043),
      800: Color(0XFF036838),
      900: Color(0XFF024626),
    },
  );

  // Green Dark
  static const MaterialColor greenDark = MaterialColor(
    0XFF0B1E15,
    <int, Color>{
      100: Color(0XFFDDFDE2),
      200: Color(0XFFBEEFC2),
      300: Color(0XFFA1E8B9),
      400: Color(0XFF79D297),
      500: Color(0XFF198F51),
      600: Color(0XFF078348),
      700: Color(0XFF0A5C35),
      800: Color(0XFF0A4C2D),
      900: Color(0XFF082618),
    },
  );

  // Gray
  static const MaterialColor gray = MaterialColor(
    0xFFE1E1E1, // Primary shade (300)
    <int, Color>{
      50: Color(0xFFF4F3F3),
      100: Color(0xFFEFEFEF), // Lightest
      200: Color(0xFFE4E4E4), // Lighter
      300: Color(0xFFE1E1E1), // Light (Primary)
      400: Color(0xFFD4D4D4),
      500: Color(0xFFC4C4C4),
      600: Color(0xFFAAAAAA),
      700: Color(0xFF888888),
      800: Color(0xFF666666),
      850: Color(0xFF646161),
      900: Color(0xFF444444),
    },
  );

  // Text colors
  static const Color textDefault = black;
  static Color textSecondary = black[700]!;
  static Color textTertiary = black[600]!;
  static Color textQuaternary = black[500]!;
  static const Color textOnbrand = white;
  static Color textBrand = blue[600]!;
  static Color textBrandSecondary = blue[400]!;
  static Color textDangerLight = redLight[600]!;
  static Color textDangerDark = redDark[600]!;
  static Color textWarningLight = yellowLight[700]!;
  static Color textWarningDark = yellowDark[700]!;
  static Color textSuccessLight = greenLight[600]!;
  static Color textSuccessDark = greenDark[600]!;

  // Background colors
  static const Color bgDefault = white;
  static Color bgSecondary = white[400]!;
  static Color bgTeritiary = white[200]!;
  static Color bgHoverActive = black[200]!;
  static Color bgSelected = blue[100]!;
  static Color bgBrand = blue[600]!;
  static Color bgDangerLight = redLight[100]!;
  static Color bgDangerDark = redDark[100]!;
  static Color bgWarningLight = yellowLight[100]!;
  static Color bgWarningDark = yellowDark[100]!;
  static Color bgSuccessLight = greenLight[100]!;
  static Color bgSuccessDark = greenDark[100]!;
  static Color bgInput = black[200]!;

  // Border colors
  static Color borderDefault = black[300]!;
  static Color borderStrong = black[400]!;
  static Color borderLight = black[200]!;
  static Color borderOnbrandStrong = white;
  static Color borderActive = blue[600]!;
  static Color borderActiveLight = blue[200]!;
}

class ColorModel {
  // Private constructor - only to be used by factory methods
  const ColorModel._({
    required this.blue,
    required this.black,
    required this.white,
    required this.red,
    required this.yellow,
    required this.green,
    required this.gray,

    // Text colors
    required this.textDefault,
    required this.textSecondary,
    required this.textTertiary,
    required this.textQuaternary,
    required this.textOnbrand,
    required this.textBrand,
    required this.textBrandSecondary,
    required this.textDanger,
    required this.textWarning,
    required this.textSuccess,

    // Background colors
    required this.bgDefault,
    required this.bgSecondary,
    required this.bgTeritiary,
    required this.bgHoverActive,
    required this.bgSelected,
    required this.bgBrand,
    required this.bgDanger,
    required this.bgWarning,
    required this.bgSuccess,
    required this.bgInput,

    // Border colors
    required this.borderDefault,
    required this.borderStrong,
    required this.borderLight,
    required this.borderOnbrandStrong,
    required this.borderActive,
    required this.borderActiveLight,
  });

  /// Light theme color model
  factory ColorModel.lightMode() {
    return ColorModel._(
      blue: AppColor.blue,
      black: AppColor.black,
      white: AppColor.white,
      red: AppColor.redLight,
      yellow: AppColor.yellowLight,
      green: AppColor.greenLight,
      gray: AppColor.gray,
      // Text colors
      textDefault: AppColor.black,
      textSecondary: AppColor.black[700]!,
      textTertiary: AppColor.black[600]!,
      textQuaternary: AppColor.black[500]!,
      textOnbrand: AppColor.white,
      textBrand: AppColor.blue[600]!,
      textBrandSecondary: AppColor.blue[400]!,
      textDanger: AppColor.textDangerLight,
      textWarning: AppColor.textWarningLight,
      textSuccess: AppColor.textSuccessLight,

      // Background colors
      bgDefault: AppColor.white,
      bgSecondary: AppColor.white[400]!,
      bgTeritiary: AppColor.white[200]!,
      bgHoverActive: AppColor.black[200]!,
      bgSelected: AppColor.blue[100]!,
      bgBrand: AppColor.blue[600]!,
      bgDanger: AppColor.bgDangerLight,
      bgWarning: AppColor.bgWarningLight,
      bgSuccess: AppColor.bgSuccessLight,
      bgInput: AppColor.black[200]!,

      // Border colors
      borderDefault: AppColor.black[300]!,
      borderStrong: AppColor.black[400]!,
      borderLight: AppColor.black[200]!,
      borderOnbrandStrong: AppColor.white,
      borderActive: AppColor.borderActive,
      borderActiveLight: AppColor.borderActiveLight,
    );
  }

  /// Dark theme color model
  factory ColorModel.darkMode() {
    return ColorModel._(
      blue: AppColor.blue,
      black: AppColor.black,
      white: AppColor.white,
      red: AppColor.redDark,
      yellow: AppColor.yellowDark,
      green: AppColor.greenDark,
      gray: AppColor.gray,

      // Text colors - Dark theme uses lighter text on darker backgrounds
      textDefault: AppColor.white,
      textSecondary: AppColor.white[700]!,
      textTertiary: AppColor.white[600]!,
      textQuaternary: AppColor.white[500]!,
      textOnbrand: AppColor.black,
      textBrand: AppColor.blue[400]!,
      textBrandSecondary: AppColor.blue[300]!,
      textDanger: AppColor.textDangerDark,
      textWarning: AppColor.textWarningDark,
      textSuccess: AppColor.textSuccessDark,

      // Background colors - Dark theme uses darker backgrounds
      bgDefault: AppColor.black,
      bgSecondary: AppColor.black[700]!,
      bgTeritiary: AppColor.black[800]!,
      bgHoverActive: AppColor.white[200]!,
      bgSelected: AppColor.blue[900]!,
      bgBrand: AppColor.blue[800]!,
      bgDanger: AppColor.bgDangerDark,
      bgWarning: AppColor.bgWarningDark,
      bgSuccess: AppColor.bgSuccessDark,
      bgInput: AppColor.black[700]!,

      // Border colors - Dark theme uses lighter borders on darker backgrounds
      borderDefault: AppColor.white[300]!,
      borderStrong: AppColor.white[400]!,
      borderLight: AppColor.white[200]!,
      borderOnbrandStrong: AppColor.black,
      borderActive: AppColor.borderActive,
      borderActiveLight: AppColor.borderActiveLight,
    );
  }

  // Base colors as MaterialColors for flexible shade access
  final MaterialColor blue;
  final MaterialColor black;
  final MaterialColor white;
  final MaterialColor red;
  final MaterialColor yellow;
  final MaterialColor green;

  // Gray scale color
  final MaterialColor gray;

  // Text colors
  final Color textDefault;
  final Color textSecondary;
  final Color textTertiary;
  final Color textQuaternary;
  final Color textOnbrand;
  final Color textBrand;
  final Color textBrandSecondary;
  final Color textDanger;
  final Color textWarning;
  final Color textSuccess;

  // Background colors
  final Color bgDefault;
  final Color bgSecondary;
  final Color bgTeritiary;
  final Color bgHoverActive;
  final Color bgSelected;
  final Color bgBrand;
  final Color bgDanger;
  final Color bgWarning;
  final Color bgSuccess;
  final Color bgInput;

  // Border colors
  final Color borderDefault;
  final Color borderStrong;
  final Color borderLight;
  final Color borderOnbrandStrong;
  final Color borderActive;
  final Color borderActiveLight;
}
