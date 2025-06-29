import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    required this.color,
    required this.text,
    required super.child,
    super.key,
  });

  final ColorModel color;
  final TextStyleModel text;

  static AppTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
