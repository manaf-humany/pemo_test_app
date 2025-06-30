import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

class TransactionDetailsLoadingWidget extends StatelessWidget {
  const TransactionDetailsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonLoadingWidget(
      enabled: true,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(AppSpacing.x4),
        child: Column(
          spacing: AppSpacing.x4,
          children: [
            CircleAvatar(
              radius: AppSpacing.x12,
              backgroundColor: AppTheme.of(context).color.shimmerBaseColor,
            ),
            _SkeletonBox(width: AppSpacing.x5 * 15, height: AppSpacing.x5),
            _SkeletonBox(width: AppSpacing.x5 * 20, height: AppSpacing.x5),
            _SkeletonBox(width: AppSpacing.x5 * 15, height: AppSpacing.x5),
            _SkeletonBox(height: AppSpacing.x5 * 15),
          ],
        ),
      ),
    );
  }
}

/// A box used as a placeholder in the skeleton loading UI.
class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? AppSpacing.x4,
      decoration: BoxDecoration(
        color: AppTheme.of(context).color.shimmerBaseColor,
        borderRadius: BorderRadius.circular(AppSpacing.x1),
      ),
    );
  }
}
