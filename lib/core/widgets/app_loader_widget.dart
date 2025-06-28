import 'package:flutter/material.dart';
import 'package:pemo_test_project/core/theme/theme_export.dart';

class AppLoaderWidget extends StatelessWidget {
  const AppLoaderWidget({super.key, this.loadingSize, this.loadingColor});

  final double? loadingSize;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).color;
    return Center(
      child: SizedBox(
        width: loadingSize ?? AppSpacing.x8,
        height: loadingSize ?? AppSpacing.x8,
        child: CircularProgressIndicator(
          color: loadingColor ?? color.blue.shade300,
          strokeWidth: AppSpacing.x0,
        ),
      ),
    );
  }
}
