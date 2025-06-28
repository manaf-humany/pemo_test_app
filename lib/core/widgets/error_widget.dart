import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pemo_test_project/core/generated/assets.gen.dart';
import 'package:pemo_test_project/core/theme/theme_export.dart';
import 'package:pemo_test_project/core/widgets/app_texts.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    required this.errorMessage,
    required this.onRetryPressed,
    this.showAnim = true,
    super.key,
  });
  final String errorMessage;
  final VoidCallback onRetryPressed;
  final bool showAnim;
  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showAnim
              ? SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.x4,
                  ),
                  child: Lottie.asset(Assets.lottie.errorAnim),
                ),
              )
              : const SizedBox(),
          AppSpacing.h6,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x3),
            child: AppText.headingLarge(
              errorMessage,
              align: TextAlign.center,
              color: colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.x6),
            child: TextButton(
              onPressed: onRetryPressed,
              child: AppText.bodyMedium('Retry', align: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}
