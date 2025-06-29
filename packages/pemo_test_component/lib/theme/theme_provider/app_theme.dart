import 'package:flutter/material.dart';

import '../../pemo_test_component.dart';

/// Provides the application's theme to its descendants.
///
/// `AppTheme` is an `InheritedWidget` that holds the color and text style
/// definitions for the application. Widgets can access the theme data using
/// `AppTheme.of(context)`.
///
/// This allows for a centralized and consistent theme management.
///
/// Example:
/// ```dart
/// final theme = AppTheme.of(context);
/// Container(
///   color: theme.color.primaryColor,
///   child: Text(
///     'Hello World',
///     style: theme.text.bodyMedium,
///   ),
/// )
/// ```
class AppTheme extends InheritedWidget {
  /// Creates an `AppTheme`.
  ///
  /// The [color] and [text] parameters must not be null.
  const AppTheme({
    required this.color,
    required this.text,
    required super.child,
    super.key,
  });

  /// The color palette of the theme.
  final ColorModel color;

  /// The text styles of the theme.
  final TextStyleModel text;

  /// Retrieves the closest `AppTheme` instance from the widget tree.
  ///
  /// This method provides direct access to the `AppTheme` data. It will throw
  /// an error if no `AppTheme` is found in the widget's context.
  ///
  /// For a null-safe alternative, see [maybeOf].
  static AppTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!;
  }

  /// Retrieves the closest `AppTheme` instance from the widget tree, if one exists.
  ///
  /// Returns `null` if no `AppTheme` is found in the context. This is useful
  /// when the presence of an `AppTheme` is optional.
  static AppTheme? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }

  bool updateShouldNotify(covariant AppTheme oldWidget) =>
      color != oldWidget.color || text != oldWidget.text;
}
