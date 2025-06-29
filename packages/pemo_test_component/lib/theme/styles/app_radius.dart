/// Defines the standard border radiuses for the application.
///
/// This class provides a set of predefined corner radiuses to ensure consistency
/// in the user interface, for example in `BorderRadius` or `RoundedRectangleBorder`.
///
/// Example:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(AppRadius.x5),
///   ),
/// )
/// ```
abstract class AppRadius {
  /// A radius of 4.0 logical pixels.
  static const double x1 = 4;

  /// A radius of 4.5 logical pixels.
  static const double x2 = 4.5;

  /// A radius of 5.0 logical pixels.
  static const double x3 = 5.0;

  /// A radius of 6.0 logical pixels.
  static const double x4 = 6.0;

  /// A radius of 8.0 logical pixels.
  static const double x5 = 8.0;

  /// A radius of 10.0 logical pixels.
  static const double x6 = 10.0;

  /// A radius of 12.0 logical pixels.
  static const double x7 = 12.0;

  /// A radius of 14.0 logical pixels.
  static const double x8 = 14.0;
}
