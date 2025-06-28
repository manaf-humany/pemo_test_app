import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pemo_test_project/core/core.dart';

class AppMainButton extends StatelessWidget {
  const AppMainButton({
    required this.title,
    required this.onTap,
    this.foregroundColor,
    this.backgroundColor,
    this.icon,
    this.showProgress = false,
    this.borderColor,
    super.key,
  });
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final String title;
  final bool showProgress;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppSpacing.x12,
        decoration: ShapeDecoration(
          color:
              onTap == null
                  ? colors.primaryColor.withValues(alpha: 0.4)
                  : backgroundColor ?? colors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.x4),
            side:
                borderColor != null
                    ? BorderSide(color: borderColor!, width: 1.2)
                    : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[SvgPicture.asset(icon!), SizedBox(width: 8)],
            if (showProgress == true)
              AppLoaderWidget(
                loadingColor: foregroundColor ?? colors.mainTextColor,
                loadingSize: AppSpacing.x6,
              ),
            if (showProgress != true)
              AppText.bodySmall(title, align: TextAlign.center, maxLines: 2),
          ],
        ),
      ),
    );
  }
}
