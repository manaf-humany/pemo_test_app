import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A widget to display a full-screen error message with an image and a retry button.
///
/// This widget is typically used to indicate a significant error state,
/// such as a network failure or a server error, and provides the user
/// with an option to retry the failed action.
class AppErrorWidget extends StatelessWidget {
  /// Creates a widget to display an error state.
  ///
  /// The [errorMessage] and [onRetryPressed] are required.
  const AppErrorWidget({
    required this.errorMessage,
    required this.onRetryPressed,
    this.responseType = ResponseType.generalError,
    super.key,
  });

  /// The specific error message to display to the user.
  final String errorMessage;

  /// A callback function that is executed when the user presses the retry button.
  final VoidCallback onRetryPressed;

  /// The type of response error, which determines the displayed image, title, and subtitle.
  final ResponseType responseType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: responseType.image != null
                  ? Image.asset(responseType.image!)
                  : Lottie.asset(Assets.lottie.errorAnim),
            ),
            AppSpacing.h4,
            AppText.headingLarge(responseType.title, align: TextAlign.center),
            AppSpacing.h2,
            AppText.bodyLarge(responseType.subTitle, align: TextAlign.center),
            AppSpacing.h2,
            AppText.bodyMedium(errorMessage, align: TextAlign.center, maxLines: 3),
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.x12),
              child: AppMainButton(title: 'Retry', onTap: onRetryPressed),
            ),
          ],
        ),
      ),
    );
  }
}

/// A compact, single-line widget for displaying an error message with a refresh icon.
///
/// This widget is suitable for displaying less critical errors in a small space,
/// for example, at the bottom of a list or in a snackbar.
class OneLineErrorWidget extends StatelessWidget {
  /// Creates a single-line error widget.
  ///
  /// The [onRetryPressed] and [errorMessage] are required.
  const OneLineErrorWidget({
    required this.onRetryPressed,
    required this.errorMessage,
    super.key,
  });

  /// A callback function that is executed when the user taps the widget.
  final VoidCallback onRetryPressed;

  /// The error message to display.
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;
    return GestureDetector(
      onTap: onRetryPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.x4,
          vertical: AppSpacing.x2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppSpacing.x2,
          children: [
            Icon(Icons.error_outline, color: colors.errorColor),
            Expanded(child: AppText.bodySmall(errorMessage, maxLines: 2)),
            const Icon(Icons.refresh_outlined),
          ],
        ),
      ),
    );
  }
}
