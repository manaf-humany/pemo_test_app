import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pemo_test_project/core/core.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    required this.child,
    required this.onRefresh,
    super.key,
  });
  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;
    return RefreshIndicator.adaptive(
      backgroundColor: Platform.isIOS ? colors.primaryColor : Colors.white,
      color: colors.primaryColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
