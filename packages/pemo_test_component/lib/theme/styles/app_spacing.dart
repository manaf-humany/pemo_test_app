import 'package:flutter/material.dart';

/// Defines standard spacing and SizedBox widgets for the application.
///
/// This class provides a set of predefined spacing values and ready-to-use
/// `SizedBox` widgets for creating consistent layouts.
///
/// The spacing values can be used for `padding`, `margin`, `gap`, etc.
/// The `SizedBox` widgets are convenient for adding fixed-size spaces
/// between widgets in a `Column` or `Row`.
///
/// Example:
/// ```dart
/// Column(
///   children: [
///     Text('First item'),
///     AppSpacing.vSpace8, // Adds a vertical space of 8.0
///     Text('Second item'),
///   ],
/// )
///
/// Padding(
///   padding: EdgeInsets.all(AppSpacing.s16),
///   child: Text('Padded content'),
/// )
/// ```
class AppSpacing {
  static const double x0 = 2.0;
  static const double x1 = 4.0;
  static const double x2 = 8.0;
  static const double x3 = 12.0;
  static const double x4 = 16.0;
  static const double x5 = 20.0;
  static const double x6 = 24.0;
  static const double x7 = 28.0;
  static const double x8 = 32.0;
  static const double x9 = 36.0;
  static const double x10 = 40.0;
  static const double x11 = 44.0;
  static const double x12 = 48.0;
  static const double x13 = 52.0;
  static const double x14 = 56.0;
  static const double x15 = 60.0;
  static const double x16 = 64.0;

  static const SizedBox v1 = SizedBox(height: x1);
  static const SizedBox v2 = SizedBox(height: x2);
  static const SizedBox v3 = SizedBox(height: x3);
  static const SizedBox v4 = SizedBox(height: x4);
  static const SizedBox v5 = SizedBox(height: x5);
  static const SizedBox v6 = SizedBox(height: x6);
  static const SizedBox v7 = SizedBox(height: x7);
  static const SizedBox v8 = SizedBox(height: x8);
  static const SizedBox v9 = SizedBox(height: x9);
  static const SizedBox v10 = SizedBox(height: x10);
  static const SizedBox v11 = SizedBox(height: x11);
  static const SizedBox v12 = SizedBox(height: x12);

  static const SizedBox h1 = SizedBox(width: x1);
  static const SizedBox h2 = SizedBox(width: x2);
  static const SizedBox h3 = SizedBox(width: x3);
  static const SizedBox h4 = SizedBox(width: x4);
  static const SizedBox h5 = SizedBox(width: x5);
  static const SizedBox h6 = SizedBox(width: x6);
  static const SizedBox h7 = SizedBox(width: x7);
  static const SizedBox h8 = SizedBox(width: x8);
  static const SizedBox h9 = SizedBox(width: x9);
  static const SizedBox h10 = SizedBox(width: x10);
  static const SizedBox h11 = SizedBox(width: x11);
  static const SizedBox h12 = SizedBox(width: x12);
}
