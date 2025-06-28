import 'package:flutter/material.dart';
import 'package:pemo_test_project/core/theme/theme_export.dart';
import 'package:pemo_test_project/core/widgets/app_texts.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    required this.color,
    required this.text,
    required this.themeType,
    required super.child,
    super.key,
  });

  final ColorModel color;
  final TextStyleModel text;
  final AppThemeType themeType;

  static AppTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
