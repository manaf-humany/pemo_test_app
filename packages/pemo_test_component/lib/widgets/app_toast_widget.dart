import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A helper class for showing styled toasts that align with the app's design system.
class AppToastWidget {
  /// Displays a styled toast with customizable content.
  static void show({
    required BuildContext context,
    required String title,
    String? subtitle,
    StyledToastPosition position = StyledToastPosition.bottom,
    AppSvgPicture? leadingIcon,
    AppSvgPicture? subtitleIcon,
    AppSvgPicture? closeIcon,
    VoidCallback? onTap,
    VoidCallback? onCloseToast,
    Duration duration = const Duration(seconds: 5),
  }) {
    // Create a toast controller to handle manual dismissal.
    final controller = ToastManager();

    // If a closeIcon is provided, the toast should not auto-dismiss.
    final autoDismiss = closeIcon == null;

    // The function to call when the close button is tapped.
    void handleClose() {
      // Dismiss the toast first to avoid any race conditions with context.
      controller.dismissAll();

      // Then, safely call the provided callback.
      // Using a microtask to ensure it runs after the current event loop.
      Future.microtask(() {
        try {
          onCloseToast?.call();
        } catch (e) {
          // Ignore errors if the callback fails after the toast is dismissed.
          debugPrint('Error in onCloseToast callback: $e');
        }
      });
    }

    showToastWidget(
      _AppToast(
        title: title,
        subtitle: subtitle,
        leadingIcon: leadingIcon,
        subtitleIcon: subtitleIcon,
        closeIcon: closeIcon,
        onTap: onTap,
        onClose: handleClose,
      ),
      context: context,
      position: position,
      animation: StyledToastAnimation.slideFromBottom,
      reverseAnimation: StyledToastAnimation.fade,
      duration: autoDismiss ? duration : null,
      // Pass the controller to allow for manual dismissal.
      dismissOtherToast: true,
    );
  }
}

/// The private widget that defines the toast's UI, styled according to the AppTheme.
class _AppToast extends StatelessWidget {
  const _AppToast({
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.subtitleIcon,
    this.closeIcon,
    this.onTap,
    this.onClose,
  });

  final String title;
  final String? subtitle;
  final AppSvgPicture? leadingIcon;
  final AppSvgPicture? subtitleIcon;
  final AppSvgPicture? closeIcon;
  final VoidCallback? onTap;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.x4,
        vertical: AppSpacing.x3,
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.x4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: theme.color.surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.x2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leadingIcon != null) ...[
            leadingIcon!,
            const SizedBox(width: AppSpacing.x2),
          ],
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodySmall(
                    title,
                    color: theme.color.mainTextColor,
                    maxLines: 2,
                  ),
                  if (subtitle?.isNotEmpty ?? false) ...[
                    const SizedBox(height: AppSpacing.x1),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: AppText.bodySmall(
                            subtitle!,
                            color: theme.color.secondTextColor,
                          ),
                        ),
                        if (subtitleIcon != null) ...[
                          const SizedBox(width: AppSpacing.x1),
                          subtitleIcon!,
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (closeIcon != null) ...[
            const SizedBox(width: AppSpacing.x2),
            GestureDetector(
              onTap: onClose,
              child: closeIcon,
            ),
          ],
        ],
      ),
    );
  }
}
