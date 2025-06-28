import 'package:flutter/material.dart';
import 'package:pemo_test_project/core/theme/theme.dart';

class ThemeProvider extends StatelessWidget {
  const ThemeProvider({required this.builder, super.key});

  final Widget Function(BuildContext context, ThemeData theme) builder;

  @override
  Widget build(BuildContext context) {
    final colors = ColorModel();
    final texts = getTextsFromColors(colors);

    return AppTheme(
      color: colors,
      text: texts,
      child: builder(context, getThemeFromColors(colors)),
    );
  }
}
