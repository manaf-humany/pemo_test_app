import 'package:flutter/material.dart';

import '../../pemo_test_component.dart';

/// A widget that provides the application's theme to its descendants.
///
/// `ThemeProvider` is responsible for creating and providing the `AppTheme`,
/// which contains the color and text style definitions for the application.
///
/// It should be placed at the root of the widget tree, so that all screens
/// can access the theme data via `AppTheme.of(context)`.
///
/// This provider also passes a standard `ThemeData` object to its `builder`,
/// which can be used to configure a `MaterialApp` or `CupertinoApp`.
///
/// Example:
/// ```dart
/// ThemeProvider(
///   builder: (context, theme) {
///     return MaterialApp(
///       theme: theme,
///       home: MyHomePage(),
///     );
///   },
/// )
/// ```
class ThemeProvider extends StatefulWidget {
  /// Creates a `ThemeProvider`.
  ///
  /// The [builder] function is required and is used to build the part of the
  /// widget tree that will have access to the theme.
  ///
  /// An optional [colorModel] can be provided to customize the color scheme.
  /// If not provided, a default `ColorModel` will be used.
  const ThemeProvider({required this.builder, this.colorModel, super.key});

  /// A builder function that receives the `BuildContext` and a `ThemeData`
  /// object, and returns the widget tree to be themed.
  final Widget Function(BuildContext context, ThemeData theme) builder;

  /// An optional custom color model for the theme.
  final ColorModel? colorModel;

  @override
  State<ThemeProvider> createState() => _ThemeProviderState();
}

class _ThemeProviderState extends State<ThemeProvider> {
  late ColorModel _colors;
  late TextStyleModel _texts;

  @override
  void initState() {
    super.initState();
    _updateThemeData();
  }

  @override
  void didUpdateWidget(covariant ThemeProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.colorModel != oldWidget.colorModel) {
      _updateThemeData();
    }
  }

  void _updateThemeData() {
    _colors = widget.colorModel ?? ColorModel();
    _texts = getTextsFromColors(_colors);
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      color: _colors,
      text: _texts,
      child: widget.builder(context, getThemeFromColors(_colors)),
    );
  }
}
