/// Defines the standard border widths for the application.
///
/// This class provides a set of predefined border widths to ensure consistency
/// across the user interface. These values can be used for widgets like
/// `Container`, `Border`, etc.
///
/// Example:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     border: Border.all(width: AppBorderWidth.x1),
///   ),
/// )
/// ```
abstract class AppBorderWidth {
  /// A border width of 0.8 logical pixels.
  static const double x1 = 0.8;

  /// A border width of 0.9 logical pixels.
  static const double x2 = 0.9;

  /// A border width of 1.0 logical pixels.
  static const double x3 = 1.0;

  /// A border width of 1.2 logical pixels.
  static const double x4 = 1.2;

  /// A border width of 1.5 logical pixels.
  static const double x5 = 1.5;
}
