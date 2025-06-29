import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

class AppErrorPage extends StatelessWidget {
  const AppErrorPage({
    required this.errorMessage,
    required this.onRetryPressed,
    this.isOneLineWidget = false,
    this.responseType = ResponseType.generalError,
    super.key,
  });
  final String errorMessage;
  final VoidCallback onRetryPressed;
  final ResponseType responseType;
  final bool isOneLineWidget;
  @override
  Widget build(BuildContext context) {
    if (isOneLineWidget) {
      return OneLineErrorWidget(
        onRetryPressed: onRetryPressed,
        errorMessage: errorMessage,
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child:
                responseType.image != null
                    ? Image.asset(responseType.image!)
                    : Lottie.asset(Assets.lottie.errorAnim),
          ),
          AppText.bodyLarge(responseType.title, align: TextAlign.center),
          AppText.bodyMedium(responseType.subTitle, align: TextAlign.center),
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.x12),
            child: AppMainButton(title: 'Retry', onTap: onRetryPressed),
          ),
        ],
      ),
    );
  }
}

class OneLineErrorWidget extends StatelessWidget {
  const OneLineErrorWidget({
    required this.onRetryPressed,
    required this.errorMessage,
    super.key,
  });

  final VoidCallback onRetryPressed;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;
    return GestureDetector(
      onTap: onRetryPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.x2,
        children: [
          Icon(Icons.error_outline, color: colors.errorColor),
          Expanded(child: AppText.bodySmall(errorMessage)),
          Icon(Icons.refresh_outlined),
        ],
      ),
    );
  }
}
