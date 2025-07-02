import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A helper class for showing styled toasts that align with the app's design system.
///
/// This class provides static methods to display different types of toasts (e.g., success, error)
/// with predefined styles consistent with the application's theme.
class AppToastWidget {
  // Private constructor to prevent instantiation of this utility class.
  AppToastWidget._();

  /// Displays a success toast message.
  ///
  /// [context]: The BuildContext from which to display the toast.
  /// [message]: The message content to be displayed in the toast.
  static void showSuccessToast(
      {required BuildContext context, required String message}) {
    _showStyledToast(
      context: context,
      message: message,
      backgroundColor: AppTheme.of(context).color.greenColor,
    );
  }

  /// Displays an error toast message.
  ///
  /// [context]: The BuildContext from which to display the toast.
  /// [message]: The message content to be displayed in the toast.
  static void showErrorToast(
      {required BuildContext context, required String message}) {
    _showStyledToast(
      context: context,
      message: message,
      backgroundColor: AppTheme.of(context).color.errorColor,
    );
  }

  /// Internal helper method to show a styled toast with common configurations.
  ///
  /// [context]: The BuildContext.
  /// [message]: The message to display.
  /// [backgroundColor]: The background color of the toast.
  static void _showStyledToast(
      {required BuildContext context,
      required String message,
      required Color backgroundColor}) {
    showToast(message,
        context: context,
        backgroundColor: backgroundColor,
        position: StyledToastPosition.top,
        animation: StyledToastAnimation.slideToTop, // Consistent animation
        reverseAnimation: StyledToastAnimation.slideToTop,
        duration: const Duration(seconds: 4),
        animDuration:
            const Duration(milliseconds: 250) // Consistent animation duration
        );
  }
}
