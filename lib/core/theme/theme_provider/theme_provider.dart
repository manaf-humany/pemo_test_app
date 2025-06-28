import 'package:flutter/material.dart';
import 'package:pemo_test_project/core/theme/theme_export.dart';

class ThemeProvider extends StatelessWidget {
  const ThemeProvider({
    required this.builder,
    required this.themeType,
    super.key,
  });

  final Widget Function(BuildContext context, ThemeData theme) builder;
  final AppThemeType themeType;

  @override
  Widget build(BuildContext context) {
    final colors =
        themeType == AppThemeType.light
            ? ColorModel.lightMode()
            : ColorModel.darkMode();
    final texts = getTextsFromColors(colors);

    return AppTheme(
      color: colors,
      text: texts,
      themeType: themeType,
      child: builder(context, getThemeFromColors(colors, themeType)),
    );
  }
}
